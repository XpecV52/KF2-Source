package tripwire.controls
{
    import com.greensock.TimelineMax;
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.ui.InputDetails;
    
    public class WhatsNewButton extends TripButton
    {
         
        
        public var bDisableLeftRight:Boolean;
        
        public var imageLoader:TripUILoader;
        
        public var newItemTimeline:TimelineMax;
        
        public var leftNavArrow:TripButton;
        
        public var rightNavArrow:TripButton;
        
        public var hitbox:MovieClip;
        
        protected var _itemIndex:int;
        
        protected var _dataArray:Array;
        
        public const ITEM_DELAY:int = 210;
        
        public const FADE_TIME:int = 24;
        
        public function WhatsNewButton()
        {
            this.newItemTimeline = new TimelineMax({
                "repeat":-1,
                "paused":true,
                "useFrames":true
            });
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.navArrowVisibility = false;
            this.leftNavArrow.focusable = false;
            this.rightNavArrow.focusable = false;
            this.hitbox.addEventListener(MouseEvent.MOUSE_DOWN,this.sendURL,false,0,true);
        }
        
        public function set dataArray(param1:Array) : void
        {
            this._dataArray = param1;
            this.newItemTimeline.stop();
            this.newItemTimeline.clear();
            var _loc2_:int = 0;
            while(_loc2_ < param1.length)
            {
                this.makeNewItemTimeline(_loc2_);
                _loc2_++;
            }
            this.newItemTimeline.restart();
        }
        
        public function set itemIndex(param1:int) : void
        {
            this._itemIndex = param1;
            textField.text = !!this._dataArray[param1].label ? this._dataArray[param1].label : "";
            this.imageLoader.source = !!this._dataArray[param1].imageURL ? this._dataArray[param1].imageURL : "";
        }
        
        public function get itemIndex() : int
        {
            return this._itemIndex;
        }
        
        public function get itemURL() : String
        {
            return this._dataArray[this._itemIndex].redirectURL;
        }
        
        public function makeNewItemTimeline(param1:int) : void
        {
            this.newItemTimeline.call(this.changeIndex,[param1],"item" + String(param1));
            this.newItemTimeline.fromTo(this.imageLoader,this.FADE_TIME,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeOut,
                "immediateRender":false
            },"+=4");
            this.newItemTimeline.fromTo(this.imageLoader,this.FADE_TIME,{"alpha":1},{
                "alpha":0,
                "ease":Cubic.easeIn,
                "immediateRender":false
            },"+=" + String(this.ITEM_DELAY));
        }
        
        public function changeIndex(param1:int) : void
        {
            this.itemIndex = param1;
        }
        
        public function set navArrowVisibility(param1:Boolean) : void
        {
            this.leftNavArrow.visible = param1;
            this.rightNavArrow.visible = param1;
            mouseChildren = param1;
            if(param1 && this._dataArray != null)
            {
                this.leftNavArrow.addEventListener(MouseEvent.MOUSE_DOWN,this.backItem,false,0,true);
                this.rightNavArrow.addEventListener(MouseEvent.MOUSE_DOWN,this.forwardItem,false,0,true);
                stage.addEventListener(InputEvent.INPUT,this.handleNavInput,false,0,true);
            }
            else if(!param1 && this._dataArray != null)
            {
                this.leftNavArrow.removeEventListener(MouseEvent.MOUSE_DOWN,this.backItem);
                this.rightNavArrow.removeEventListener(MouseEvent.MOUSE_DOWN,this.forwardItem);
                stage.removeEventListener(InputEvent.INPUT,this.handleNavInput);
            }
        }
        
        public function sendURL() : void
        {
            dispatchEvent(new Event("WhatsNewClicked"));
        }
        
        public function backItem() : void
        {
            var _loc1_:int = 0;
            _loc1_ = this.itemIndex < 1 ? int(this._dataArray.length - 1) : int(this.itemIndex - 1);
            this.newItemTimeline.stop();
            TweenMax.to(this.imageLoader,4,{
                "alpha":0,
                "useFrames":true,
                "ease":Cubic.easeIn,
                "onComplete":this.newItemTimeline.play,
                "onCompleteParams":["item" + String(_loc1_),true]
            });
        }
        
        public function forwardItem() : void
        {
            var _loc1_:int = 0;
            _loc1_ = this.itemIndex == this._dataArray.length ? 0 : int(this.itemIndex + 1);
            this.newItemTimeline.stop();
            TweenMax.to(this.imageLoader,4,{
                "alpha":0,
                "useFrames":true,
                "ease":Cubic.easeIn,
                "onComplete":this.newItemTimeline.play,
                "onCompleteParams":["item" + String(_loc1_),true]
            });
        }
        
        override protected function highlightButton() : *
        {
            super.highlightButton();
            this.navArrowVisibility = true;
        }
        
        override protected function unhighlightButton() : *
        {
            super.unhighlightButton();
            this.navArrowVisibility = false;
        }
        
        public function handleNavInput(param1:InputEvent) : void
        {
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(param1.details.navEquivalent)
                {
                    case NavigationCode.LEFT:
                        if(!this.bDisableLeftRight)
                        {
                            this.backItem();
                        }
                        break;
                    case NavigationCode.RIGHT:
                        if(!this.bDisableLeftRight)
                        {
                            this.forwardItem();
                        }
                        break;
                    case NavigationCode.GAMEPAD_A:
                        this.sendURL();
                }
            }
        }
        
        public function testNews() : void
        {
            var _loc4_:Object = null;
            var _loc1_:Array = new Array();
            var _loc2_:Array = new Array("Rip_and_tear.png","K4mjP4c.png","f4BoPqK.png","emoji_shakespeare.png","1462386646918.png");
            var _loc3_:int = 0;
            while(_loc3_ < 5)
            {
                _loc4_ = {
                    "label":"test" + _loc3_.toString(),
                    "imageURL":"testImages/" + _loc2_[_loc3_],
                    "redirectURL":"www.google.com/#q=testURL" + _loc3_.toString()
                };
                _loc1_.push(_loc4_);
                _loc3_++;
            }
            this.dataArray = _loc1_;
        }
    }
}
