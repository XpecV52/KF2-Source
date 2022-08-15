package tripwire.controls
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import com.greensock.events.TweenEvent;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.FocusEvent;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.ScrollingList;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.interfaces.IListItemRenderer;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.FocusManager;
    import tripwire.containers.TripContainer;
    import tripwire.managers.MenuManager;
    
    public class TripScrollingList extends ScrollingList
    {
         
        
        public var associatedButton:TripButton;
        
        public var background:MovieClip;
        
        public var redBar:MovieClip;
        
        public var bStayOpenOnSelection:Boolean;
        
        protected var _defaultAlpha:Number;
        
        private var _type:String;
        
        private var _bOpen:Boolean;
        
        private var _fadeIn:TweenMax;
        
        private var _fadeOut:TweenMax;
        
        public function TripScrollingList()
        {
            super();
            focused = 0;
            this._defaultAlpha = alpha;
        }
        
        override protected function drawScrollBar() : void
        {
            if(!_autoScrollBar)
            {
                return;
            }
            _scrollBar.x = _width - _scrollBar.width - margin;
            _scrollBar.y = margin + padding.top;
            _scrollBar.height = availableHeight - 8;
            _scrollBar.validateNow();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        override protected function draw() : void
        {
            margin = 10;
            super.draw();
        }
        
        public function get bManagerUsingGamepad() : Boolean
        {
            if(MenuManager.manager != null)
            {
                return MenuManager.manager.bUsingGamepad;
            }
            return false;
        }
        
        public function get bOpen() : Boolean
        {
            return this._bOpen;
        }
        
        public function set bOpen(param1:Boolean) : void
        {
            this._bOpen = param1;
            if(param1)
            {
                this.open();
            }
            else
            {
                this.close();
            }
        }
        
        override protected function updateScrollBar() : void
        {
            if(scrollBar != null)
            {
                scrollBar.visible = dataProvider.length > _totalRenderers;
            }
            super.updateScrollBar();
        }
        
        protected function open() : void
        {
            if(this.associatedButton != null)
            {
                this.associatedButton.selected = true;
            }
            focusable = true;
            focused = 1;
            if(!this.bManagerUsingGamepad)
            {
                this.selectedIndex = -1;
            }
            visible = true;
            mouseEnabled = true;
            this._fadeIn = TweenMax.fromTo(this,6,{
                "z":48,
                "alpha":0,
                "blurFilter":{
                    "blurX":24,
                    "blurY":16,
                    "quality":1
                },
                "ease":Cubic.easeIn,
                "useFrames":true
            },{
                "z":-32,
                "alpha":1,
                "blurFilter":{
                    "blurX":0,
                    "blurY":0,
                    "quality":1,
                    "remove":true
                },
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":this.onOpen,
                "onCompleteParams":[this.bManagerUsingGamepad]
            });
            addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOut,false,0,true);
        }
        
        public function indexChanged(param1:IndexEvent) : void
        {
            trace("INDEX CHANGED: ",param1.index);
        }
        
        protected function close(param1:FocusEvent = null) : void
        {
            if(this.associatedButton != null)
            {
                this.associatedButton.selected = false;
            }
            mouseEnabled = false;
            this._fadeOut = TweenMax.fromTo(this,6,{
                "alpha":1,
                "blurFilter":{
                    "blurX":0,
                    "blurY":0,
                    "quality":1
                },
                "ease":Cubic.easeOut,
                "useFrames":true
            },{
                "alpha":0,
                "blurFilter":{
                    "blurX":24,
                    "blurY":16,
                    "quality":1,
                    "remove":true
                },
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":this.onClose
            });
            removeEventListener(FocusEvent.FOCUS_OUT,this.onFocusOut);
        }
        
        function onFocusOut(param1:FocusEvent) : *
        {
            this.closeList(TripContainer.CANCELLED_INDEX);
        }
        
        override protected function handleItemClick(param1:ButtonEvent) : void
        {
            super.handleItemClick(param1);
            this.closeList((param1.currentTarget as IListItemRenderer).index);
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            if(param1.handled)
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
                        this.closeList(_selectedIndex);
                        break;
                    case NavigationCode.UP:
                        break;
                    case NavigationCode.DOWN:
                        break;
                    case NavigationCode.GAMEPAD_B:
                        this.onBPressed();
                        break;
                    default:
                        this.closeList(selectedIndex);
                }
            }
        }
        
        protected function onBPressed(param1:InputDetails = null) : void
        {
            this.closeList(TripContainer.CANCELLED_INDEX);
        }
        
        private function closeList(param1:int) : *
        {
            dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,param1));
            if(!this.bStayOpenOnSelection)
            {
                this.bOpen = false;
            }
            if(this.associatedButton)
            {
                if(this.bManagerUsingGamepad)
                {
                    FocusManager.setFocus(this.associatedButton);
                }
            }
        }
        
        function updateMainInFilters(param1:TweenEvent) : void
        {
            filters = [TripList.getBlurInEffect(alpha)];
        }
        
        function updateMainOutFilters(param1:TweenEvent) : void
        {
            filters = [TripList.getBlurOutEffect(alpha)];
        }
        
        function onOpen(param1:Boolean = true) : void
        {
            if(param1)
            {
                TripList.onOpen(this);
            }
        }
        
        function onClose(param1:Event = null) : void
        {
            TripList.onClose(this);
        }
    }
}
