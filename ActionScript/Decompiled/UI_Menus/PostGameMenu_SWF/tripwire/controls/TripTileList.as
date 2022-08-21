package tripwire.controls
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.display.MovieClip;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.TileList;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.interfaces.IListItemRenderer;
    import scaleform.clik.ui.InputDetails;
    import tripwire.containers.TripContainer;
    import tripwire.managers.MenuManager;
    
    public class TripTileList extends TileList
    {
         
        
        public var background:MovieClip;
        
        protected var _defaultAlpha:Number;
        
        private var _type:String;
        
        private var _bOpen:Boolean;
        
        private var _fadeIn:TweenMax;
        
        private var _fadeOut:TweenMax;
        
        public function TripTileList()
        {
            super();
            focused = 0;
            this._defaultAlpha = alpha;
        }
        
        public function get bManagerUsingGamepad() : Boolean
        {
            if(MenuManager.manager != null)
            {
                return MenuManager.manager.bUsingGamepad;
            }
            return false;
        }
        
        public function open() : void
        {
            visible = true;
            tabEnabled = true;
            tabChildren = true;
            focused = 1;
            if(!this.bManagerUsingGamepad)
            {
                this.selectedIndex = -1;
            }
            if(!this._bOpen)
            {
                this._fadeIn = TweenMax.to(this,10,{
                    "alpha":1,
                    "ease":Cubic.easeIn,
                    "useFrames":true,
                    "onComplete":this.onOpen,
                    "onCompleteParams":[this.bManagerUsingGamepad]
                });
                this._bOpen = true;
            }
        }
        
        public function close() : void
        {
            tabEnabled = false;
            tabChildren = false;
            focused = 0;
            selectedIndex = 0;
            if(this._bOpen)
            {
                this._bOpen = false;
                this._fadeOut = TweenMax.to(this,10,{
                    "alpha":0,
                    "ease":Cubic.easeOut,
                    "useFrames":true,
                    "onComplete":this.onClose
                });
            }
        }
        
        override protected function handleItemClick(param1:ButtonEvent) : void
        {
            super.handleItemClick(param1);
            this.closeList((param1.currentTarget as IListItemRenderer).index);
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            if(param1.handled || !this._bOpen)
            {
                return;
            }
            super.handleInput(param1);
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_A:
                        this.closeList(selectedIndex);
                        break;
                    case NavigationCode.GAMEPAD_B:
                        this.onBPressed(_loc2_);
                }
            }
        }
        
        protected function onBPressed(param1:InputDetails) : void
        {
            this.closeList(TripContainer.CANCELLED_INDEX);
        }
        
        private function closeList(param1:int) : *
        {
            this.close();
            dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,param1));
        }
        
        private function onOpen(param1:Boolean = true) : void
        {
            if(param1)
            {
                TripList.onOpen(this);
            }
        }
        
        private function onClose() : void
        {
            TripList.onClose(this);
        }
    }
}
