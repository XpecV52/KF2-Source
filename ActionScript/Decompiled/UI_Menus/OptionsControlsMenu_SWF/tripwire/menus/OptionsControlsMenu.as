package tripwire.menus
{
    import flash.external.ExternalInterface;
    import flash.utils.Timer;
    import scaleform.clik.controls.ButtonBar;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.ui.InputDetails;
    import tripwire.containers.SectionHeaderContainer;
    import tripwire.containers.TripContainer;
    import tripwire.containers.optionsControls.ControlsInputContainer;
    import tripwire.controls.TripButton;
    
    public class OptionsControlsMenu extends TripContainer
    {
        
        private static const MENU_STATE_INPUT:int = 0;
        
        private static const MENU_STATE_KEYBINDINGS:int = 1;
        
        private static const MENU_STATE_CONTROLLER:int = 2;
         
        
        public var header:SectionHeaderContainer;
        
        public var closeButton:TripButton;
        
        public var tabButtonBar:ButtonBar;
        
        public var inputContainer:ControlsInputContainer;
        
        public var keybindingsContainer:TripContainer;
        
        public var controllerPresetsContainer:ControllerPresetsContainer;
        
        private var currentIndex:int = -1;
        
        private var _currentContainer:TripContainer;
        
        private var myIdentifier:Timer;
        
        public function OptionsControlsMenu()
        {
            super();
            enableInitCallback = true;
            defaultFirstElement = this.tabButtonBar;
            this.closeButton.addEventListener(ButtonEvent.PRESS,this.closeMenu,false,0,true);
            this.keybindingsContainer.visible = false;
            this.inputContainer.visible = false;
            this.controllerPresetsContainer.visible = false;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.header.text = !!param1.header ? param1.header : "";
            this.closeButton.label = !!param1.close ? param1.close : "";
        }
        
        public function set tabStrings(param1:Array) : *
        {
            this.tabButtonBar.dataProvider = new DataProvider(param1);
            this.tabButtonBar.selectedIndex = 0;
            this.tabButtonBar.validateNow();
            if(this.tabButtonBar.getButtonAt(1))
            {
                this.tabButtonBar.getButtonAt(1).enabled = !bManagerUsingGamepad;
            }
        }
        
        override public function openContainer() : void
        {
            this.tabButtonBar.selectedIndex = 0;
            this.tabButtonBar.tabIndex = 1;
            super.openContainer();
            this.openTab(MENU_STATE_INPUT);
            if(this.tabButtonBar.getButtonAt(1))
            {
                this.tabButtonBar.getButtonAt(1).enabled = !bManagerUsingGamepad;
            }
            this.tabButtonBar.addEventListener(IndexEvent.INDEX_CHANGE,this.handleTabChanged,false,0,true);
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            this.tabButtonBar.removeEventListener(IndexEvent.INDEX_CHANGE,this.handleTabChanged);
        }
        
        override public function selectContainer() : void
        {
            currentElement = defaultFirstElement;
            super.selectContainer();
            this.tabButtonBar.addEventListener(ButtonEvent.PRESS,this.handleGamepadTabSelect,false,0,true);
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            this.tabButtonBar.removeEventListener(ButtonEvent.PRESS,this.handleGamepadTabSelect);
        }
        
        protected function goBackToOptionsSelection() : *
        {
            this.closeContainer();
            ExternalInterface.call("Callback_CloseMenu");
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            if(this.tabButtonBar.tabEnabled)
            {
                this.goBackToOptionsSelection();
            }
        }
        
        private function closeMenu(param1:ButtonEvent) : void
        {
            this.goBackToOptionsSelection();
        }
        
        private function handleTabChanged(param1:IndexEvent) : void
        {
            this.openTab(param1.index);
        }
        
        private function openTab(param1:int) : void
        {
            if(this.currentIndex != param1)
            {
                if(param1 >= 0)
                {
                    this.currentIndex = param1;
                    if(this._currentContainer)
                    {
                        this._currentContainer.closeContainer();
                    }
                    this._currentContainer = this.getContainer(this.currentIndex);
                    this._currentContainer.openContainer();
                    this._currentContainer.deselectContainer();
                    this.selectContainer();
                    if(!bManagerUsingGamepad)
                    {
                        this.tabSelect();
                    }
                }
            }
        }
        
        private function handleGamepadTabSelect(param1:ButtonEvent) : void
        {
            if(bManagerUsingGamepad)
            {
                this.tabSelect();
            }
        }
        
        private function tabSelect() : void
        {
            if(this.currentIndex >= 0)
            {
                this._currentContainer = this.getContainer(this.currentIndex);
                if(this._currentContainer)
                {
                    this.deselectContainer();
                    tabEnabled = true;
                    tabChildren = true;
                    if(currentElement)
                    {
                        currentElement.focused = 0;
                        currentElement.tabEnabled = false;
                        currentElement.tabChildren = false;
                    }
                    this._currentContainer.selectContainer();
                    this._currentContainer.addEventListener(IndexEvent.INDEX_CHANGE,this.listenForContainer,false,0,true);
                }
            }
        }
        
        private function listenForContainer(param1:IndexEvent) : *
        {
            if(param1.index == CANCELLED_INDEX)
            {
                this._currentContainer.removeEventListener(IndexEvent.INDEX_CHANGE,this.listenForContainer);
                this._currentContainer.deselectContainer();
                this.selectContainer();
            }
        }
        
        private function getContainer(param1:int) : TripContainer
        {
            switch(param1)
            {
                case MENU_STATE_INPUT:
                    return this.inputContainer;
                case MENU_STATE_KEYBINDINGS:
                    return this.keybindingsContainer;
                case MENU_STATE_CONTROLLER:
                    return this.controllerPresetsContainer;
                default:
                    return null;
            }
        }
    }
}
