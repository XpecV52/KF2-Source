package tripwire.widgets
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.text.TextField;
    import flash.ui.Keyboard;
    import scaleform.clik.core.UIComponent;
    
    public class BossHealthBarWidget extends UIComponent
    {
         
        
        public var bossnameText:TextField;
        
        public var healthBarRed:MovieClip;
        
        public var healthBarGlow:MovieClip;
        
        protected var originalHealthBarWidth:Number;
        
        protected var previousHealthValue:Number = 1;
        
        public const barOffset:int = 56;
        
        public function BossHealthBarWidget()
        {
            super();
            enableInitCallback = true;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.originalHealthBarWidth = this.healthBarRed.width;
            this.healthBarGlow.width = 0;
            visible = false;
        }
        
        public function onGlowComplete(param1:Event = null) : void
        {
            this.healthBarGlow.width = 0;
        }
        
        public function set currentHealthPercentValue(param1:Number) : void
        {
            var _loc2_:Number = NaN;
            var _loc3_:Number = NaN;
            if(param1 > 1)
            {
                param1 = 1;
                visible = true;
            }
            if(param1 < 0)
            {
                param1 = 0;
                visible = false;
            }
            if(this.previousHealthValue != param1)
            {
                _loc2_ = this.healthBarRed.width;
                _loc3_ = this.originalHealthBarWidth * param1;
                this.healthBarGlow.x = _loc2_ + this.barOffset;
                TweenMax.to(this.healthBarRed,4,{
                    "width":_loc3_,
                    "useFrames":true,
                    "easing":Cubic.easeOut
                });
                if(this.healthBarRed.width > this.originalHealthBarWidth)
                {
                    this.healthBarRed.width = this.originalHealthBarWidth;
                    this.healthBarGlow.x = this.originalHealthBarWidth + this.barOffset;
                }
                TweenMax.killTweensOf(this.healthBarGlow);
                if(_loc2_ > _loc3_)
                {
                    this.healthBarGlow.alpha = 1;
                    TweenMax.to(this.healthBarGlow,4,{
                        "x":_loc3_ + this.barOffset,
                        "width":this.healthBarGlow.width + (_loc2_ - _loc3_),
                        "useFrames":true,
                        "easing":Cubic.easeOut
                    });
                    TweenMax.to(this.healthBarGlow,4,{
                        "delay":8,
                        "alpha":0,
                        "useFrames":true,
                        "easing":Cubic.easeOut
                    });
                    TweenMax.to(this.healthBarGlow,4,{
                        "delay":12,
                        "alpha":1,
                        "useFrames":true,
                        "repeat":3,
                        "yoyo":true,
                        "easing":Cubic.easeOut,
                        "onComplete":this.onGlowComplete
                    });
                }
                if(_loc2_ < _loc3_ && this.healthBarGlow.width != 0)
                {
                    TweenMax.to(this.healthBarGlow,2,{
                        "alpha":0,
                        "useFrames":true,
                        "easing":Cubic.easeOut,
                        "onComplete":this.onGlowComplete
                    });
                }
                this.previousHealthValue = param1;
            }
        }
        
        public function get currentHealthPercentValue() : Number
        {
            return this.previousHealthValue;
        }
        
        public function onKeyPress(param1:KeyboardEvent) : void
        {
            switch(param1.keyCode)
            {
                case Keyboard.A:
                    this.currentHealthPercentValue += 0.01 * (Math.floor(Math.random() * (10 - 2 + 1)) + 2);
                    break;
                case Keyboard.B:
                    this.currentHealthPercentValue -= 0.01 * (Math.floor(Math.random() * (10 - 2 + 1)) + 2);
            }
        }
    }
}
