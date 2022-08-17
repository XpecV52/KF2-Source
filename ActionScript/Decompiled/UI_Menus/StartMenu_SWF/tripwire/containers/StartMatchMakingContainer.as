package tripwire.containers
{
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.external.ExternalInterface;
    import flash.ui.Keyboard;
    import scaleform.clik.controls.CheckBox;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.FocusManager;
    import tripwire.controls.CategoryButton;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripScrollingList;
    import tripwire.managers.MenuManager;
    
    public class StartMatchMakingContainer extends TripSubContainer
    {
         
        
        public var backButton:TripButton;
        
        public var findGameButton:TripButton;
        
        public var optionsHeader:SectionHeaderContainer;
        
        public var modeButton:CategoryButton;
        
        public var difficultyButton:CategoryButton;
        
        public var lengthButton:CategoryButton;
        
        public var modeList:TripScrollingList;
        
        public var difficultyList:TripScrollingList;
        
        public var lengthList:TripScrollingList;
        
        private var _currentList:TripScrollingList;
        
        public var inProgressCheckbox:CheckBox;
        
        public function StartMatchMakingContainer()
        {
            super();
            defaultFirstElement = this.modeButton;
            defaultNumPrompts = 2;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            currentElement = defaultFirstElement = this.modeButton;
            this.initializeLists();
            this.setTabIndex();
        }
        
        public function setTabIndex() : void
        {
            this.modeButton.tabIndex = 1;
            this.difficultyButton.tabIndex = 2;
            this.lengthButton.tabIndex = 3;
            this.inProgressCheckbox.tabIndex = 4;
            this.findGameButton.tabIndex = 5;
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            this.backButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.findGameButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.modeButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.difficultyButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.lengthButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            addEventListener(KeyboardEvent.KEY_UP,this.onUserKeyUp,false,0,true);
            if(bManagerUsingGamepad && !MenuManager.manager.bPopUpOpen)
            {
                FocusManager.setFocus(defaultFirstElement);
            }
        }
        
        public function onUserKeyUp(param1:KeyboardEvent) : void
        {
            if(bManagerUsingGamepad)
            {
                return;
            }
            if(param1.keyCode == Keyboard.ESCAPE)
            {
                this.onBack(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
                this._currentList = null;
            }
        }
        
        public function set localizedText(param1:*) : void
        {
            this.optionsHeader.text = !!param1.options ? param1.options : "";
            this.backButton.label = !!param1.back ? param1.back : "";
            this.findGameButton.label = !!param1.findGame ? param1.findGame : "";
            this.modeButton.label = !!param1.mode ? param1.mode : "";
            this.difficultyButton.label = !!param1.difficulty ? param1.difficulty : "";
            this.lengthButton.label = !!param1.length ? param1.length : "";
            this.inProgressCheckbox.label = !!param1.inProgress ? param1.inProgress : "";
            this.modeButton.infoTextField.text = this.modeList.dataProvider[this.modeList.dataProvider.length - 1].label;
            this.difficultyButton.infoTextField.text = this.difficultyList.dataProvider[this.difficultyList.dataProvider.length - 1].label;
            this.lengthButton.infoTextField.text = this.lengthList.dataProvider[this.lengthList.dataProvider.length - 1].label;
        }
        
        public function set options(param1:Object) : void
        {
            this.modeList.selectedIndex = !!param1.mode ? int(param1.mode) : 0;
            this.difficultyList.selectedIndex = !!param1.difficulty ? int(param1.difficulty) : 0;
            this.lengthList.selectedIndex = !!param1.length ? int(param1.length) : 0;
            this.inProgressCheckbox.selected = !!param1.inProgress ? Boolean(param1.inProgress) : false;
            this.modeButton.infoTextField.text = this.modeList.dataProvider[this.modeList.selectedIndex].label;
            this.difficultyButton.infoTextField.text = this.difficultyList.dataProvider[this.difficultyList.selectedIndex].label;
            this.lengthButton.infoTextField.text = this.lengthList.dataProvider[this.lengthList.selectedIndex].label;
        }
        
        public function get options() : Object
        {
            var _loc1_:Object = new Object();
            _loc1_.mode = this.modeList.selectedIndex;
            _loc1_.difficulty = this.difficultyList.selectedIndex;
            _loc1_.length = this.lengthList.selectedIndex;
            _loc1_.inProgress = this.inProgressCheckbox.selected;
            return _loc1_;
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            this.backButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.findGameButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.modeButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.difficultyButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.lengthButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            removeEventListener(KeyboardEvent.KEY_UP,this.onUserKeyUp);
        }
        
        function initializeLists() : *
        {
            this.setListProps(this.modeList,this.modeButton);
            this.setListProps(this.difficultyList,this.difficultyButton);
            this.setListProps(this.lengthList,this.lengthButton);
        }
        
        function setListProps(param1:TripScrollingList, param2:TripButton = null) : *
        {
            param1.addEventListener(IndexEvent.INDEX_CHANGE,this.onBack,false,0,true);
            param1.visible = false;
            param1.associatedButton = param2;
        }
        
        protected function handleButtonEvent(param1:ButtonEvent) : void
        {
            switch(param1.currentTarget)
            {
                case this.backButton:
                    dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
                    break;
                case this.modeButton:
                    this.showOptions(this.modeList);
                    break;
                case this.difficultyButton:
                    this.showOptions(this.difficultyList);
                    break;
                case this.lengthButton:
                    this.showOptions(this.lengthList);
                    break;
                case this.findGameButton:
                    ExternalInterface.call("Callback_StartMatchMaking");
            }
        }
        
        private function showOptions(param1:TripScrollingList) : void
        {
            param1.bOpen = true;
            this._currentList = param1;
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            this.onBack(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
            this._currentList = null;
        }
        
        protected function onBack(param1:IndexEvent) : *
        {
            if(this._currentList != null)
            {
                if(param1.index != CANCELLED_INDEX)
                {
                    (this._currentList.associatedButton as CategoryButton).infoTextField.text = this._currentList.dataProvider[param1.index].label;
                }
            }
            else
            {
                dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
            }
        }
    }
}
