package tripwire.containers.serverBrowser
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.ScrollBar;
    import scaleform.clik.controls.ScrollingList;
    import scaleform.clik.controls.TextInput;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.Extensions;
    import scaleform.gfx.FocusManager;
    import scaleform.gfx.TextFieldEx;
    import tripwire.containers.TripSubContainer;
    import tripwire.controls.TripButton;
    import tripwire.controls.serverBrowser.ServerListSortButton;
    
    public class ServerBrowserMainListContainer extends TripSubContainer
    {
         
        
        public var backButton:TripButton;
        
        public var filtersButton:TripButton;
        
        public var refreshButton:TripButton;
        
        public var joinGameButton:TripButton;
        
        public var spectateGameButton:TripButton;
        
        public var detailsButton:TripButton;
        
        public var refreshingIndicator:MovieClip;
        
        public var sortButtonsContainer;
        
        public var serverListScrollBar:ScrollBar;
        
        public var serverScrollingList:ScrollingList;
        
        public var searchBar:TextInput;
        
        public var filterListTextfield:TextField;
        
        public var gamesFoundText:TextField;
        
        public var numGamesFoundText:TextField;
        
        public var controllerIcon_Y:MovieClip;
        
        public var controllerIcon_X:MovieClip;
        
        public var controllerIcon_RightThumbStick:MovieClip;
        
        public var _bAllowSpectate:Boolean = true;
        
        private var buttonList:Vector.<ServerListSortButton>;
        
        private var dataList:Array;
        
        private var _blistElementsVisible:Boolean = false;
        
        private var _sortButtonIndex:int = 0;
        
        public function ServerBrowserMainListContainer()
        {
            super();
            this.controllerIcon_Y.visible = false;
            this.controllerIcon_X.visible = false;
            this.controllerIcon_RightThumbStick.visible = false;
            TextFieldEx.setVerticalAlign(this.filterListTextfield,TextFieldEx.VALIGN_CENTER);
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            this.initButtons();
            this.updateControllerIconVisibility();
            this.serverScrollingList.addEventListener(ListEvent.ITEM_PRESS,this.serverItemPressed,false,0,true);
            this.serverScrollingList.addEventListener(ListEvent.ITEM_DOUBLE_CLICK,this.serverItemDoubleClick,false,0,true);
            this.serverScrollingList.doubleClickEnabled = true;
        }
        
        public function serverItemDoubleClick(param1:ListEvent) : void
        {
            this.serverSelected();
            ExternalInterface.call("CallBack_ServerJoinGame");
        }
        
        public function serverItemPressed(param1:ListEvent) : void
        {
            if(!bManagerUsingGamepad)
            {
                this.serverSelected();
            }
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.updateControllerIconVisibility();
        }
        
        private function updateControllerIconVisibility() : void
        {
            this.controllerIcon_Y.visible = bManagerUsingGamepad && bSelected;
            this.controllerIcon_X.visible = bManagerUsingGamepad && bSelected;
            this.controllerIcon_RightThumbStick.visible = bManagerUsingGamepad && bSelected;
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            this.controllerIcon_Y.visible = false;
            this.controllerIcon_X.visible = false;
            this.controllerIcon_RightThumbStick.visible = false;
        }
        
        public function selectFirstItem() : *
        {
            this.serverScrollingList.selectedIndex = 0;
        }
        
        public function unselectItem() : *
        {
            this.serverScrollingList.selectedIndex = -1;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.sortButtonsContainer.sortNameButton.label = !!param1.name ? param1.name : "";
            this.sortButtonsContainer.sortModeButton.label = !!param1.mode ? param1.mode : "";
            this.sortButtonsContainer.sortDifficultyButton.label = !!param1.difficulty ? param1.difficulty : "";
            this.sortButtonsContainer.sortMapButton.label = !!param1.map ? param1.map : "";
            this.filtersButton.label = !!param1.filters ? param1.filters : "";
            this.searchBar.text = !!param1.search ? param1.search : "";
            this.refreshButton.label = !!param1.refresh ? param1.refresh : "";
            this.gamesFoundText.text = !!param1.gamesFound ? param1.gamesFound : "";
            this.backButton.label = !!param1.back ? param1.back : "";
            this.detailsButton.label = !!param1.details ? param1.details : "";
            this.spectateGameButton.label = !!param1.spectate ? param1.spectate : "";
            this.joinGameButton.label = !!param1.join ? param1.join : "";
        }
        
        public function set dataProvider(param1:Array) : void
        {
            this.dataList = param1;
            this.serverScrollingList.dataProvider = new DataProvider(param1);
            this.serverCount = param1.length;
        }
        
        public function set bAllowSpectate(param1:Boolean) : void
        {
            this._bAllowSpectate = param1;
            if(this.spectateGameButton.enabled)
            {
                this.spectateGameButton.enabled = false;
            }
        }
        
        public function set serverCount(param1:int) : void
        {
            this.numGamesFoundText.text = param1.toString();
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            super.handleInput(param1);
            if(param1.handled || !visible)
            {
                return;
            }
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_R3:
                        ExternalInterface.call("Callback_RefreshServer");
                        break;
                    case NavigationCode.GAMEPAD_Y:
                        this.filtersButton.dispatchEvent(new ButtonEvent(ButtonEvent.CLICK));
                        break;
                    case NavigationCode.GAMEPAD_X:
                        this.changeSort();
                }
            }
        }
        
        public function changeSort() : *
        {
            var _loc1_:ServerListSortButton = null;
            if(visible)
            {
                _loc1_ = this.buttonList[this._sortButtonIndex];
                switch(_loc1_.currentSortOrder)
                {
                    case ServerListSortButton.NONE:
                        _loc1_.dispatchEvent(new ButtonEvent(ButtonEvent.CLICK));
                        break;
                    case ServerListSortButton.ASCENDING:
                        _loc1_.dispatchEvent(new ButtonEvent(ButtonEvent.CLICK));
                        break;
                    case ServerListSortButton.DESCENDING:
                        ++this._sortButtonIndex;
                        if(this._sortButtonIndex >= this.buttonList.length)
                        {
                            this._sortButtonIndex = 0;
                        }
                        this.changeSort();
                }
            }
        }
        
        protected function handleButtonEvent(param1:ButtonEvent) : void
        {
            switch(param1.currentTarget)
            {
                case this.refreshButton:
                    this.refreshClicked();
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            defaultFirstElement = this.serverScrollingList;
            currentElement = this.serverScrollingList;
            this.serverScrollingList.tabIndex = 1;
            this.joinGameButton.tabIndex = 2;
            this.spectateGameButton.tabIndex = 3;
            this.detailsButton.tabIndex = 4;
            this.backButton.tabIndex = 5;
            this.refreshing = false;
            this.initButtons();
            this.setFocusGrouping();
        }
        
        private function initButtons() : void
        {
            var _loc1_:ServerListSortButton = null;
            this.buttonList = new Vector.<ServerListSortButton>();
            this.buttonList.push(this.sortButtonsContainer.sortNameButton);
            this.buttonList.push(this.sortButtonsContainer.sortModeButton);
            this.buttonList.push(this.sortButtonsContainer.sortDifficultyButton);
            this.buttonList.push(this.sortButtonsContainer.sortMapButton);
            this.buttonList.push(this.sortButtonsContainer.sortPlayerCountButton);
            this.buttonList.push(this.sortButtonsContainer.sortWaveCountButton);
            this.buttonList.push(this.sortButtonsContainer.sortPingButton);
            for each(_loc1_ in this.buttonList)
            {
                _loc1_.addEventListener(ButtonEvent.CLICK,this.onSortButtonClick,false,0,true);
            }
            this.joinGameButton.enabled = this.serverScrollingList.selectedIndex != -1;
            this.spectateGameButton.enabled = this.serverScrollingList.selectedIndex != -1 && this._bAllowSpectate;
            this.detailsButton.enabled = this.serverScrollingList.selectedIndex != -1;
            this.refreshButton.addEventListener(ButtonEvent.CLICK,this.handleButtonEvent,false,0,true);
        }
        
        protected function setFocusGrouping() : *
        {
            this.filtersButton.focusable = false;
            this.sortButtonsContainer.focusable = false;
            this.refreshButton.focusable = false;
            this.searchBar.focusable = false;
            this.serverListScrollBar.focusable = false;
        }
        
        private function onSortButtonClick(param1:ButtonEvent) : void
        {
            var _loc2_:ServerListSortButton = null;
            var _loc3_:ServerListSortButton = null;
            _loc2_ = ServerListSortButton(param1.currentTarget);
            var _loc4_:int = 0;
            while(_loc4_ < this.buttonList.length)
            {
                _loc3_ = this.buttonList[_loc4_];
                if(_loc3_ != _loc2_)
                {
                    _loc3_.selected = false;
                    _loc3_.sortOrder = ServerListSortButton.NONE;
                }
                else
                {
                    _loc3_.selected = true;
                    _loc3_.toggleSortOrder();
                    Extensions.gfxProcessSound(this,"ButtonSoundTheme","Button_Selected");
                    ExternalInterface.call("Callback_SortList",_loc4_,_loc2_.currentSortOrder - 1);
                }
                _loc4_++;
            }
        }
        
        public function refreshClicked() : void
        {
            ExternalInterface.call("Callback_RefreshServer");
            this.joinGameButton.enabled = false;
            this.spectateGameButton.enabled = false;
            this.detailsButton.enabled = false;
        }
        
        public function set refreshing(param1:Boolean) : void
        {
            if(this.refreshingIndicator != null)
            {
                if(this.refreshingIndicator.visible != param1)
                {
                    this.refreshingIndicator.visible = param1;
                    if(param1)
                    {
                        this.refreshingIndicator.play();
                    }
                    else
                    {
                        this.refreshingIndicator.stop();
                    }
                }
            }
        }
        
        public function serverSelected() : void
        {
            this.joinGameButton.enabled = true;
            this.spectateGameButton.enabled = Boolean(this._bAllowSpectate);
            this.detailsButton.enabled = true;
            if(bManagerUsingGamepad)
            {
                FocusManager.setFocus(this.joinGameButton);
            }
        }
        
        private function getFakePlayerData() : Array
        {
            var _loc3_:Object = null;
            var _loc1_:Array = new Array();
            var _loc2_:int = 0;
            while(_loc2_ < 6)
            {
                _loc3_ = new Object();
                _loc3_.playerName = "Test " + _loc2_;
                _loc3_.killCount = _loc2_ * 10;
                _loc3_.playTime = _loc2_ + ": 00";
                _loc3_.playerPing = _loc2_ + 1 * 10;
                _loc1_.push(_loc3_);
                _loc2_++;
            }
            return _loc1_;
        }
        
        override protected function openAnimation() : *
        {
            alpha = 1;
        }
        
        override protected function closeAnimation() : *
        {
        }
        
        override public function closeContainer() : void
        {
            this.serverScrollingList.dataProvider.cleanUp();
            this.serverScrollingList.invalidate();
            super.closeContainer();
        }
        
        override protected function pushToBackAnimation() : *
        {
        }
    }
}
