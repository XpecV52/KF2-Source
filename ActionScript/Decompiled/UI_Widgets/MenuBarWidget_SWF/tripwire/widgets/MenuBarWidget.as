package tripwire.widgets
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.ButtonBar;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonBarEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.ui.InputDetails;
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
        
        private const OPTIONS_INDEX = 3;
        
        private const EXIT_INDEX = 4;
        
        private const MAX_INDEX = 5;
        
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
            this.controllerIconContainer.visible = bManagerUsingGamepad;
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            stage.addEventListener(InputEvent.INPUT,this.handleMenubarInput,false,0,true);
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            stage.removeEventListener(InputEvent.INPUT,this.handleMenubarInput);
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.controllerIconContainer.visible = bManagerUsingGamepad;
        }
        
        protected function handleButtonSelect(param1:ButtonBarEvent) : void
        {
            switch(param1.index)
            {
                case this.START_INDEX:
                    ExternalInterface.call("Callback_MenuBarTabChanged",this.START_INDEX);
                    break;
                case this.PERKS_INDEX:
                    ExternalInterface.call("Callback_MenuBarTabChanged",this.PERKS_INDEX);
                    break;
                case this.GEAR_INDEX:
                    ExternalInterface.call("Callback_MenuBarTabChanged",this.GEAR_INDEX);
                    break;
                case this.OPTIONS_INDEX:
                    ExternalInterface.call("Callback_MenuBarTabChanged",this.OPTIONS_INDEX);
                    break;
                case this.EXIT_INDEX:
                    ExternalInterface.call("Callback_MenuBarTabChanged",this.EXIT_INDEX);
            }
            this._currentIndex = param1.index;
        }
        
        public function handleMenubarInput(param1:InputEvent) : void
        {
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN && !MenuManager.manager.bPopUpOpen)
            {
                switch(param1.details.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_L1:
                        this.calloutButtonBumperPress(-1);
                        break;
                    case NavigationCode.GAMEPAD_R1:
                        this.calloutButtonBumperPress(1);
                        break;
                    case NavigationCode.GAMEPAD_L2:
                        break;
                    case NavigationCode.GAMEPAD_R2:
                }
            }
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
        
        private function calloutButtonBumperPress(param1:int) : *
        {
            if(MenuManager.manager != null && !MenuManager.manager.bPopUpOpen)
            {
                this._currentIndex += param1;
                if(this._currentIndex < 0)
                {
                    this._currentIndex = 0;
                    return;
                }
                if(this._currentIndex >= this.menuButtonBar.dataProvider.length)
                {
                    this._currentIndex = this.menuButtonBar.dataProvider.length - 1;
                    return;
                }
                if(!this.menuButtonBar.getButtonAt(this._currentIndex).enabled)
                {
                    this.calloutButtonBumperPress(param1);
                    return;
                }
                this.menuButtonBar.selectedIndex = this._currentIndex;
                ExternalInterface.call("Callback_MenuBarTabChanged",this._currentIndex);
            }
        }
        
        private function onQuit() : *
        {
            ExternalInterface.call("Callback_Quit");
        }
    }
}
