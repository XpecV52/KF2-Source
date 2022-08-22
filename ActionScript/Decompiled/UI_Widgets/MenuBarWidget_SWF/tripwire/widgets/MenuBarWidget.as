package tripwire.widgets
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import scaleform.clik.controls.ButtonBar;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonBarEvent;
    import tripwire.containers.TripContainer;
    import tripwire.managers.MenuManager;
    
    public class MenuBarWidget extends TripContainer
    {
         
        
        public var menuButtonBar:ButtonBar;
        
        public var controllerIconContainer:MovieClip;
        
        private var _currentIndex:int = 0;
        
        private const START_INDEX = 0;
        
        private const PERKS_INDEX = 1;
        
        private const GEAR_INDEX = 2;
        
        private const INVENTORY_INDEX = 3;
        
        private const STORE_INDEX = 4;
        
        private const OPTIONS_INDEX = 5;
        
        private const EXIT_INDEX = 6;
        
        private const MAX_INDEX = 7;
        
        public function MenuBarWidget()
        {
            var _loc1_:int = 0;
            var _loc2_:Array = new Array();
            focusable = false;
            tabEnabled = false;
            tabChildren = false;
            super();
            _loc1_ = 0;
            while(_loc1_ < this.MAX_INDEX)
            {
                _loc2_.push({
                    "label":"Item " + _loc1_,
                    "index":_loc1_,
                    "enabled":true
                });
                _loc1_++;
            }
            this.menuButtonBar.dataProvider = new DataProvider(_loc2_);
            this.menuButtonBar.selectedIndex = 0;
            this.menuButtonBar.addEventListener(ButtonBarEvent.BUTTON_SELECT,this.handleButtonSelect,false,0,true);
            this.menuButtonBar.tabChildren = false;
            this.menuButtonBar.tabEnabled = false;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            if(MenuManager.manager != null)
            {
                this.controllerIconContainer.visible = bManagerUsingGamepad && !MenuManager.manager.bPartyWidgetFocused;
            }
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            if(MenuManager.manager != null)
            {
                this.controllerIconContainer.visible = bManagerUsingGamepad && !MenuManager.manager.bPartyWidgetFocused;
            }
        }
        
        protected function handleButtonSelect(param1:ButtonBarEvent) : void
        {
            if(param1.index >= 0 && param1.index < this.MAX_INDEX)
            {
                ExternalInterface.call("Callback_MenuBarTabChanged",param1.index);
            }
            this._currentIndex = param1.index;
        }
        
        public function set dataObject(param1:Array) : void
        {
            this.menuButtonBar.dataProvider = new DataProvider(param1);
            this.setSelectedMenuBarIndex(!!param1.selectedIndex ? int(param1.selectedIndex) : 0);
            this.menuButtonBar.dataProvider.invalidate();
        }
        
        public function setSelectedMenuBarIndex(param1:int) : void
        {
            if(this.menuButtonBar.getButtonAt(param1) && this.menuButtonBar.getButtonAt(param1).enabled)
            {
                this.menuButtonBar.selectedIndex = param1;
                this._currentIndex = param1;
                invalidate();
            }
        }
        
        public function setGearButtonEnabled(param1:Boolean) : void
        {
            if(this.menuButtonBar.getButtonAt(this.GEAR_INDEX))
            {
                this.menuButtonBar.getButtonAt(this.GEAR_INDEX).enabled = param1;
            }
        }
        
        public function set calloutButtonBumperPress(param1:int) : *
        {
            if(MenuManager.manager != null && !MenuManager.manager.bPopUpOpen && _bOpen)
            {
                this._currentIndex += param1;
                if(this._currentIndex < 0)
                {
                    this._currentIndex = this.menuButtonBar.dataProvider.length - 1;
                }
                if(this._currentIndex >= this.menuButtonBar.dataProvider.length)
                {
                    this._currentIndex = 0;
                }
                if(!this.menuButtonBar.getButtonAt(this._currentIndex).enabled)
                {
                    this.calloutButtonBumperPress = param1;
                    return;
                }
                MenuManager.manager.bTabNavigated = true;
                this.menuButtonBar.selectedIndex = this._currentIndex;
                ExternalInterface.call("Callback_MenuBarTabChanged",this._currentIndex);
            }
        }
        
        private function onQuit() : *
        {
            ExternalInterface.call("Callback_Quit");
        }
        
        public function ShowNavBumpers(param1:Boolean) : *
        {
            this.controllerIconContainer.visible = param1;
        }
    }
}
