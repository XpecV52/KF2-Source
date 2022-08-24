package tripwire.menus
{
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import scaleform.clik.controls.Button;
    import scaleform.clik.controls.ButtonBar;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonBarEvent;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.managers.FocusHandler;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.FocusManager;
    import tripwire.containers.SectionHeaderContainer;
    import tripwire.containers.TripContainer;
    
    public class OptionsSelectionMenu extends TripContainer
    {
         
        
        public var header:SectionHeaderContainer;
        
        public var buttonBar:ButtonBar;
        
        private var _selectedIndex:int;
        
        private var _tempselected:int;
        
        public function OptionsSelectionMenu()
        {
            super();
            defaultFirstElement = this.buttonBar;
            this.buttonBar.tabIndex = 1;
            visible = false;
            sectionHeader = this.header;
        }
        
        public function set buttonNames(param1:Array) : void
        {
            var _loc3_:int = 0;
            this.header.text = param1.header;
            this.buttonBar.dataProvider = new DataProvider(param1);
            this.buttonBar.validateNow();
            var _loc2_:int = 0;
            while(_loc2_ < this.buttonBar.dataProvider.length)
            {
                if(this.buttonBar.dataProvider[_loc2_].hasOwnProperty("enabled"))
                {
                    this.buttonBar.getButtonAt(_loc2_).enabled = this.buttonBar.dataProvider[_loc2_].enabled;
                }
                _loc2_++;
            }
            if(bManagerUsingGamepad)
            {
                _loc3_ = 0;
                while(_loc3_ < this.buttonBar.dataProvider.length)
                {
                    if(this.buttonBar.getButtonAt(_loc3_).enabled)
                    {
                        FocusHandler.getInstance().setFocus(this.buttonBar.getButtonAt(_loc3_));
                        break;
                    }
                    _loc3_++;
                }
            }
        }
        
        override public function focusGroupIn() : void
        {
            super.focusGroupIn();
            if(bManagerUsingGamepad)
            {
                if(this._tempselected > -1)
                {
                    this.buttonBar.selectedIndex = this._tempselected;
                }
                else
                {
                    this.buttonBar.selectedIndex = 0;
                }
            }
        }
        
        override public function focusGroupOut() : void
        {
            super.focusGroupOut();
            this._tempselected = this.buttonBar.selectedIndex;
            this.buttonBar.selectedIndex = -1;
        }
        
        override public function openContainer(param1:Boolean = true) : void
        {
            super.openContainer(param1);
            if(bManagerUsingGamepad && this.buttonBar.selectedIndex == -1)
            {
                this.buttonBar.selectedIndex = 0;
            }
            if(!bManagerUsingGamepad)
            {
                this.buttonBar.selectedIndex = -1;
            }
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            if(bManagerUsingGamepad)
            {
                this.buttonBar.selectedIndex = !!this.buttonBar.getButtonAt(0).visible ? 0 : 1;
                FocusManager.setFocus(this.buttonBar);
            }
            else
            {
                this.buttonBar.selectedIndex = -1;
            }
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            this.buttonBar.mouseEnabled = true;
            this.buttonBar.mouseChildren = true;
            this.buttonBar.addEventListener(ButtonBarEvent.BUTTON_SELECT,this.handleMouseButtonSelect,false,0,true);
            this.buttonBar.addEventListener(ButtonEvent.PRESS,this.gamePadButtonSelected,false,0,true);
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            this.buttonBar.removeEventListener(ButtonBarEvent.BUTTON_SELECT,this.handleMouseButtonSelect);
            this.buttonBar.removeEventListener(ButtonEvent.PRESS,this.gamePadButtonSelected);
        }
        
        protected function handleMouseButtonSelect(param1:ButtonBarEvent) : void
        {
            if(!bManagerUsingGamepad)
            {
                this._selectedIndex = param1.index;
                this.openNewMenu();
            }
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            ExternalInterface.call("Callback_ControllerCloseMenu");
        }
        
        protected function gamePadButtonSelected(param1:ButtonEvent) : void
        {
            if(bManagerUsingGamepad)
            {
                this._selectedIndex = this.buttonBar.selectedIndex;
                this.openNewMenu();
            }
        }
        
        protected function openNewMenu() : void
        {
            var _loc1_:Button = null;
            this.buttonBar.mouseEnabled = false;
            this.buttonBar.mouseChildren = false;
            if(this.buttonBar.dataProvider[this._selectedIndex].hasOwnProperty("buttonID"))
            {
                ExternalInterface.call("Callback_MenuSelected",this.buttonBar.dataProvider[this._selectedIndex].buttonID);
            }
            else
            {
                ExternalInterface.call("Callback_MenuSelected",this._selectedIndex);
            }
            if(!bManagerUsingGamepad)
            {
                this.buttonBar.selectedIndex = -1;
            }
        }
    }
}
