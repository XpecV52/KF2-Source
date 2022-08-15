package tripwire.containers.c4Screen
{
    import com.greensock.TweenMax;
    import flash.display.Shape;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;
    import flash.ui.Keyboard;
    import scaleform.clik.core.UIComponent;
    
    public class C4Screen_BarCountContainer extends UIComponent
    {
         
        
        public var barList:Vector.<Shape>;
        
        public var textFieldList:Vector.<TextField>;
        
        public var currentMaxBars:int = 0;
        
        public var currentActiveBars:int = 0;
        
        public const barHeight:Number = 70;
        
        public const mcWidth:Number = 228;
        
        public const barSpacing:Number = 10;
        
        public const barAlpha:Number = 0.6;
        
        public function C4Screen_BarCountContainer()
        {
            super();
        }
        
        public function TestKey(param1:KeyboardEvent) : void
        {
            switch(param1.keyCode)
            {
                case Keyboard.A:
                    --this.activeCharges;
                    break;
                case Keyboard.Q:
                    ++this.activeCharges;
                    break;
                case Keyboard.NUMPAD_SUBTRACT:
                    --this.maxBars;
                    break;
                case Keyboard.NUMPAD_ADD:
                    ++this.maxBars;
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.barList = new Vector.<Shape>();
            this.textFieldList = new Vector.<TextField>();
        }
        
        public function set maxBars(param1:int) : void
        {
            if(param1 != this.currentMaxBars)
            {
                this.currentMaxBars = param1;
                this.populateBars();
            }
        }
        
        public function get maxBars() : int
        {
            return this.currentMaxBars;
        }
        
        public function get activeCharges() : int
        {
            return this.currentActiveBars;
        }
        
        public function set activeCharges(param1:int) : void
        {
            this.currentActiveBars = param1;
            var _loc2_:int = 0;
            while(_loc2_ < this.currentMaxBars)
            {
                this.barList[_loc2_].visible = _loc2_ < this.currentActiveBars;
                this.textFieldList[_loc2_].visible = _loc2_ < this.currentActiveBars;
                _loc2_++;
            }
        }
        
        protected function populateBars() : *
        {
            var _loc1_:Number = NaN;
            var _loc2_:Number = NaN;
            var _loc3_:Shape = null;
            var _loc4_:int = 0;
            while(_loc4_ < this.barList.length)
            {
                removeChild(this.barList[_loc4_]);
                _loc4_++;
            }
            var _loc5_:int = 0;
            while(_loc5_ < this.textFieldList.length)
            {
                removeChild(this.textFieldList[_loc5_]);
                _loc5_++;
            }
            this.barList.length = 0;
            _loc2_ = this.mcWidth / this.currentMaxBars - this.barSpacing;
            var _loc6_:int = 0;
            while(_loc6_ < this.currentMaxBars)
            {
                _loc3_ = new Shape();
                _loc3_.graphics.beginFill(16711680);
                _loc1_ = _loc6_ == 0 ? Number(_loc6_ * _loc2_) : Number(_loc6_ * _loc2_ + this.barSpacing * _loc6_);
                _loc3_.graphics.drawRect(0,0,_loc2_,this.barHeight);
                _loc3_.x = _loc1_;
                _loc3_.y = 0;
                _loc3_.graphics.endFill();
                _loc3_.alpha = this.barAlpha;
                _loc3_.visible = false;
                addChild(_loc3_);
                this.barList.push(_loc3_);
                this.makeBarLabel(_loc6_);
                _loc6_++;
            }
            this.activeCharges = this.currentActiveBars;
            alpha = 0.5;
            TweenMax.killTweensOf(this);
            TweenMax.to(this,10,{
                "alpha":1,
                "useFrames":true,
                "repeat":-1,
                "yoyo":true
            });
        }
        
        private function makeBarLabel(param1:int) : void
        {
            var _loc2_:TextField = new TextField();
            var _loc3_:TextFormat = new TextFormat();
            _loc2_.width = this.barList[param1].width;
            _loc3_.color = 16711680;
            _loc3_.size = 32;
            _loc3_.align = TextFormatAlign.CENTER;
            _loc3_.font = "$UIFont";
            _loc2_.text = (param1 + 1).toString();
            _loc2_.setTextFormat(_loc3_);
            addChild(_loc2_);
            _loc2_.x = this.barList[param1].x;
            _loc2_.y = this.barHeight;
            this.textFieldList.push(_loc2_);
        }
    }
}
