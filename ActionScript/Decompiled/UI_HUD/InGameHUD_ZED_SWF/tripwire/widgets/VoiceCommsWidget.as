package tripwire.widgets
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import flash.geom.Point;
    import scaleform.clik.core.UIComponent;
    import tripwire.controls.voiceComms.VoiceCommsOptionRenderer;
    
    public class VoiceCommsWidget extends UIComponent
    {
         
        
        public var ballA:MovieClip;
        
        public var ballB:MovieClip;
        
        public var selectedItem:VoiceCommsOptionRenderer;
        
        public var bUsingGamePad:Boolean = false;
        
        public var ballARadius:Number;
        
        public var ballBRadius:Number;
        
        public var initialZ:Number;
        
        private const NUM_OPTIONS:int = 9;
        
        private const BOUNDARY_BUFFER:Number = 32;
        
        private var lastSelectedItemIndex:int;
        
        public var middleBounds:MovieClip;
        
        public var Item0:VoiceCommsOptionRenderer;
        
        public var Item1:VoiceCommsOptionRenderer;
        
        public var Item2:VoiceCommsOptionRenderer;
        
        public var Item3:VoiceCommsOptionRenderer;
        
        public var Item4:VoiceCommsOptionRenderer;
        
        public var Item5:VoiceCommsOptionRenderer;
        
        public var Item6:VoiceCommsOptionRenderer;
        
        public var Item7:VoiceCommsOptionRenderer;
        
        public var Item8:VoiceCommsOptionRenderer;
        
        public var ItemBound0:MovieClip;
        
        public var ItemBound1:MovieClip;
        
        public var ItemBound2:MovieClip;
        
        public var ItemBound3:MovieClip;
        
        public var ItemBound4:MovieClip;
        
        public var ItemBound5:MovieClip;
        
        public var ItemBound6:MovieClip;
        
        public var ItemBound7:MovieClip;
        
        public var ItemBound8:MovieClip;
        
        public var ItemBound9:MovieClip;
        
        public function VoiceCommsWidget()
        {
            super();
            enableInitCallback = true;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.initValues();
            visible = false;
            alpha = 0;
            this.Item8.bCenterOption = true;
        }
        
        public function initValues() : *
        {
            this.initialZ = this.z;
            this.ballARadius = this.ballA.width / 2;
            this.ballBRadius = this.ballB.width / 2 - 15.15;
        }
        
        public function set textOptions(param1:Object) : void
        {
            var _loc2_:Number = 0;
            while(_loc2_ < this.NUM_OPTIONS)
            {
                if(_loc2_ < param1.length)
                {
                    this["Item" + _loc2_].data = param1[_loc2_];
                }
                else
                {
                    this["Item" + _loc2_].data = null;
                }
                this["Item" + _loc2_].itemIndex = _loc2_;
                _loc2_++;
            }
        }
        
        public function enableComm() : void
        {
            dispatchEvent(new Event("PopoutItems",true));
            visible = true;
            this.lastSelectedItemIndex = -1;
            this.selectedItem = null;
            TweenMax.fromTo(this,4,{
                "alpha":0,
                "z":this.initialZ + 256
            },{
                "alpha":0.88,
                "z":this.initialZ,
                "useFrames":true,
                "overwrite":1,
                "ease":Cubic.easeOut
            });
            if(!visible || alpha == 0)
            {
                this.ballA.x = this.ballB.x;
                this.ballA.y = this.ballB.y;
            }
        }
        
        public function setNormalizedMousePosition(param1:Number, param2:Number, param3:Boolean) : void
        {
            if(param3)
            {
                this.ballA.x += param1;
                this.ballA.y += param2;
            }
            else
            {
                this.ballA.x = param1 * this.ballB.width / 2 + this.ballB.x;
                this.ballA.y = param2 * this.ballB.height / 2 + this.ballB.y;
            }
            this.checkBallRadius();
            this.activateText();
        }
        
        public function disableComm() : void
        {
            if(visible)
            {
                if(this.selectedItem)
                {
                    this.selectedItem.deactivateItem();
                }
                dispatchEvent(new Event("PopinItems",true));
                TweenMax.fromTo(this,4,{
                    "alpha":0.88,
                    "z":this.initialZ
                },{
                    "alpha":0,
                    "z":this.initialZ + 256,
                    "visible":false,
                    "useFrames":true,
                    "ease":Cubic.easeIn
                });
                this.callSelectedItem();
            }
        }
        
        public function onClick(param1:MouseEvent) : void
        {
            if(visible)
            {
                this.callSelectedItem();
            }
        }
        
        public function setEmoteEnabled(param1:Boolean) : void
        {
            this.Item8.enabled = param1;
            if(param1 && this.Item8 == this.selectedItem)
            {
                this.Item8.activateItem();
            }
        }
        
        public function callSelectedItem() : *
        {
            if(this.selectedItem && this.selectedItem.enabled)
            {
                this.selectedItem.selectActiveItem();
                ExternalInterface.call("Callback_VoiceCommsSay",this.selectedItem.itemIndex);
            }
        }
        
        public function activateText() : void
        {
            var _loc1_:MovieClip = null;
            var _loc3_:Number = NaN;
            var _loc2_:Point = new Point(this.ballA.x,this.ballA.y);
            _loc2_ = this.localToGlobal(_loc2_);
            if(this.middleBounds.hitTestPoint(_loc2_.x,_loc2_.y,true))
            {
                if(this.selectedItem != null)
                {
                    this.selectedItem.deactivateItem();
                }
                this.selectedItem = null;
                this.lastSelectedItemIndex = -1;
            }
            else
            {
                _loc3_ = 0;
                while(_loc3_ < this.NUM_OPTIONS)
                {
                    _loc1_ = this["ItemBound" + _loc3_];
                    if(_loc1_.hitTestPoint(_loc2_.x,_loc2_.y,true))
                    {
                        if(this.selectedItem != null)
                        {
                            this.selectedItem.deactivateItem();
                        }
                        this.selectedItem = this["Item" + _loc3_];
                        this.selectedItem.activateItem();
                        if(this.selectedItem.itemIndex != this.lastSelectedItemIndex)
                        {
                            ExternalInterface.call("Callback_VoiceCommsSelection",this.selectedItem.itemIndex);
                            this.lastSelectedItemIndex = this.selectedItem.itemIndex;
                        }
                        return;
                    }
                    _loc3_++;
                }
            }
            if(this.selectedItem != null)
            {
                this.selectedItem.deactivateItem();
                this.selectedItem = null;
                this.lastSelectedItemIndex = -1;
                ExternalInterface.call("Callback_VoiceCommsSelection",this.lastSelectedItemIndex);
            }
        }
        
        public function checkBallRadius() : void
        {
            var _loc4_:Number = NaN;
            var _loc1_:Number = this.ballA.x - this.ballB.x;
            var _loc2_:Number = this.ballA.y - this.ballB.y;
            var _loc3_:Number = Math.sqrt(_loc1_ * _loc1_ + _loc2_ * _loc2_);
            if(_loc3_ > this.ballBRadius - this.ballARadius)
            {
                _loc4_ = _loc3_ - (this.ballBRadius - this.ballARadius);
                this.ballA.x -= _loc1_ / _loc3_ * _loc4_;
                this.ballA.y -= _loc2_ / _loc3_ * _loc4_;
            }
        }
        
        public function popAssets(param1:String) : void
        {
            dispatchEvent(new Event(param1));
        }
    }
}
