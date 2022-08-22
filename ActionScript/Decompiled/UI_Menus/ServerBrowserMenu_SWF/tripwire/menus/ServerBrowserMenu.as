package tripwire.menus
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.external.ExternalInterface;
    import flash.ui.Keyboard;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.Button;
    import scaleform.clik.controls.ButtonBar;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.FocusManager;
    import tripwire.containers.SectionHeaderContainer;
    import tripwire.containers.TripContainer;
    import tripwire.containers.serverBrowser.ServerBrowserMainListContainer;
    import tripwire.containers.serverBrowser.ServerBrowserPasswordPromptContainer;
    import tripwire.controls.TripCheckBox;
    import tripwire.managers.MenuManager;
    
    public class ServerBrowserMenu extends TripContainer
    {
        
        public static const MENU_STATE_NONE:int = 0;
        
        public static const MENU_STATE_TAB:int = 1;
        
        public static const MENU_STATE_LIST:int = 2;
        
        public static const MENU_STATE_FILTERS:int = 3;
        
        public static const MENU_STATE_DETAILS:int = 4;
         
        
        public var serverBrowserHeader:SectionHeaderContainer;
        
        public var filtersContainer:ServerBrowserFilterContainer;
        
        public var serverListContainer:ServerBrowserMainListContainer;
        
        public var serverDetailsContainer:ServerDetailsContainer;
        
        public var backButton:Button;
        
        public var filterList:Array;
        
        public var tabButtonBar:ButtonBar;
        
        public var passwordPromptContainer:ServerBrowserPasswordPromptContainer;
        
        private var _menuState:int = 0;
        
        private var _previousMenuState:int = -1;
        
        public var coverBG:MovieClip;
        
        private var currentOpenContainer:TripContainer;
        
        public function ServerBrowserMenu()
        {
            super();
            if(this.filtersContainer != null)
            {
                this.filtersContainer.visible = false;
            }
            defaultFirstElement = this.tabButtonBar;
            sectionHeader = this.serverBrowserHeader;
            defaultNumPrompts = 2;
        }
        
        override public function openContainer(param1:Boolean = true) : void
        {
            if(!bOpen)
            {
                this.serverListContainer.openContainer();
                super.openContainer();
                this.serverDetailsContainer.visible = false;
                this._previousMenuState = MENU_STATE_NONE;
                this.menuState = MENU_STATE_TAB;
                this.filtersContainer.addEventListener(IndexEvent.INDEX_CHANGE,this.onBack,false,0,true);
                this.serverDetailsContainer.addEventListener(IndexEvent.INDEX_CHANGE,this.onBack,false,0,true);
                this.selectContainer();
            }
        }
        
        override public function closeContainer() : void
        {
            if(bOpen)
            {
                super.closeContainer();
                this.tabButtonBar.selectedIndex = 0;
                this.menuState = MENU_STATE_NONE;
                this.serverListContainer.closeContainer();
                this.serverDetailsContainer.closeContainer();
                this.filtersContainer.closeContainer();
                this.filtersContainer.removeEventListener(IndexEvent.INDEX_CHANGE,this.onBack);
                this.serverDetailsContainer.removeEventListener(IndexEvent.INDEX_CHANGE,this.onBack);
                if(stage)
                {
                    stage.removeEventListener(InputEvent.INPUT,handleInput);
                    stage.removeEventListener(MenuManager.INPUT_CHANGED,onInputChange);
                }
            }
        }
        
        override public function selectContainer() : void
        {
            currentElement = defaultFirstElement;
            super.selectContainer();
            this.enableTabButtonBar();
            if(this.serverListContainer != null && this.serverListContainer.serverScrollingList.dataProvider.length > 0)
            {
                this.menuState = MENU_STATE_LIST;
            }
            if(stage)
            {
                stage.addEventListener(KeyboardEvent.KEY_UP,this.onUserKeyUp,false,0,true);
            }
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            removeEventListener(KeyboardEvent.KEY_UP,this.onUserKeyUp);
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
            }
        }
        
        private function enableTabButtonBar() : *
        {
            this.tabButtonBar.addEventListener(ButtonEvent.CLICK,this.onButtonSelected,false,0,true);
            this.tabButtonBar.addEventListener(IndexEvent.INDEX_CHANGE,this.onListSelected,false,0,true);
            this.tabButtonBar.addEventListener(InputEvent.INPUT,this.handleButtonBarInput,false,0,true);
            this.tabButtonBar.tabEnabled = true;
            this.tabButtonBar.tabChildren = true;
        }
        
        public function handleButtonBarInput(param1:InputEvent) : void
        {
            if(param1.handled)
            {
                return;
            }
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_A:
                        this.onButtonSelected(null);
                }
            }
        }
        
        override public function focusGroupOut() : void
        {
            super.focusGroupOut();
        }
        
        override public function focusGroupIn() : void
        {
            super.focusGroupIn();
            this.menuState = this.menuState;
        }
        
        public function set menuState(param1:int) : void
        {
            this._previousMenuState = this._menuState;
            this._menuState = param1;
            switch(this._menuState)
            {
                case MENU_STATE_TAB:
                    TweenMax.to(this.coverBG,8,{
                        "autoAlpha":0,
                        "useFrames":true,
                        "ease":Cubic.easeOut
                    });
                    this.serverListContainer.deselectContainer();
                    this.serverListContainer.unselectItem();
                    this.enableTabButtonBar();
                    FocusManager.setFocus(this.tabButtonBar);
                    break;
                case MENU_STATE_LIST:
                    TweenMax.to(this.coverBG,8,{
                        "autoAlpha":0,
                        "useFrames":true,
                        "ease":Cubic.easeOut
                    });
                    this.switchToMenuStateList();
                    break;
                case MENU_STATE_FILTERS:
                    TweenMax.to(this.coverBG,8,{
                        "autoAlpha":1,
                        "useFrames":true,
                        "ease":Cubic.easeOut
                    });
                    this.filtersContainer.openContainer();
                    this.serverListContainer.pushToBackground();
                    this.pushbackBrowser();
                    if(this._previousMenuState == MENU_STATE_DETAILS)
                    {
                        this.serverDetailsContainer.closeContainer();
                    }
                    break;
                case MENU_STATE_DETAILS:
                    TweenMax.to(this.coverBG,8,{
                        "autoAlpha":1,
                        "useFrames":true,
                        "ease":Cubic.easeOut
                    });
                    if(this.serverDetailsContainer != null)
                    {
                        this.serverDetailsContainer.openContainer();
                    }
                    if(this.serverListContainer != null)
                    {
                        this.serverListContainer.deselectContainer();
                    }
            }
        }
        
        public function set bAllowSpectate(param1:Boolean) : void
        {
            this.serverListContainer.bAllowSpectate = param1;
        }
        
        private function deselectTabButtonBar() : *
        {
            this.tabButtonBar.tabEnabled = false;
            this.tabButtonBar.tabChildren = false;
        }
        
        private function switchToMenuStateList() : *
        {
            switch(this._previousMenuState)
            {
                case MENU_STATE_TAB:
                    this.deselectTabButtonBar();
                    this.serverListContainer.selectFirstItem();
                    break;
                case MENU_STATE_NONE:
                    this.deselectTabButtonBar();
                    break;
                case MENU_STATE_FILTERS:
                    this.filtersContainer.closeContainer();
                    this.serverListContainer.openContainer();
                    this.pushforwardBrowser();
                    break;
                case MENU_STATE_DETAILS:
                    this.serverDetailsContainer.closeContainer();
            }
            this.serverListContainer.selectContainer();
        }
        
        public function get menuState() : int
        {
            return this._menuState;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            var _loc2_:Array = new Array();
            var _loc3_:int = 0;
            while(_loc3_ < 3)
            {
                _loc2_.push({
                    "label":"Item " + _loc3_,
                    "index":_loc3_
                });
                _loc3_++;
            }
            this.searchTabs = _loc2_;
            this.backButton = this.serverListContainer.backButton;
            this.tabButtonBar.tabIndex = 1;
            this.filtersContainer.filterChangeFunction = this.onFilterChange;
            this.serverListContainer.serverScrollingList.addEventListener(ListEvent.ITEM_CLICK,this.onServerItemChanged,false,0,true);
            this.serverListContainer.filtersButton.addEventListener(ButtonEvent.CLICK,this.showFilterOptions,false,0,true);
            this.serverListContainer.detailsButton.addEventListener(ButtonEvent.CLICK,this.showDetails,false,0,true);
            this.serverListContainer.joinGameButton.addEventListener(ButtonEvent.CLICK,this.joinGame,false,0,true);
            this.serverListContainer.spectateGameButton.addEventListener(ButtonEvent.CLICK,this.spectateGame,false,0,true);
            this.backButton.addEventListener(ButtonEvent.CLICK,this.handleButtonEvent,false,0,true);
            this.selectContainer();
            stage.addEventListener(KeyboardEvent.KEY_UP,this.onUserKeyUp,false,0,true);
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            this.onBack(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
        }
        
        public function onFilterChange(param1:TripCheckBox, param2:Boolean = false) : void
        {
            var _loc4_:int = 0;
            if(param2)
            {
                this.filterList = null;
                this.serverListContainer.filterListTextfield.text = "";
                return;
            }
            if(this.filterList == null)
            {
                this.filterList = new Array();
            }
            if(param1.selected)
            {
                this.filterList.push({"name":param1.label});
            }
            else
            {
                _loc4_ = this.filterList.length;
                while(--_loc4_ >= 0)
                {
                    if(param1.label == this.filterList[_loc4_].name)
                    {
                        this.filterList.splice(_loc4_,1);
                        break;
                    }
                }
            }
            this.serverListContainer.filterListTextfield.text = "";
            var _loc3_:int = 0;
            while(_loc3_ < this.filterList.length)
            {
                if(_loc3_ > 0)
                {
                    this.serverListContainer.filterListTextfield.appendText(" | ");
                }
                this.serverListContainer.filterListTextfield.appendText(this.filterList[_loc3_].name);
                _loc3_++;
            }
            ExternalInterface.call("Callback_FilterChanged",param1.Key,param1.selected);
        }
        
        protected function openStartMenu() : void
        {
            ExternalInterface.call("Callback_CloseServerBrowser");
        }
        
        public function set confirmServerBrowserClose(param1:Boolean) : void
        {
            if(param1)
            {
                this.closeContainer();
            }
        }
        
        protected function handleButtonEvent(param1:ButtonEvent) : void
        {
            switch(param1.currentTarget)
            {
                case this.backButton:
                    this.openStartMenu();
            }
        }
        
        private function onServerItemChanged(param1:ListEvent) : void
        {
            if(param1 != null && param1.hasOwnProperty("index"))
            {
                if(bManagerUsingGamepad)
                {
                    this.serverListContainer.serverSelected();
                }
                ExternalInterface.call("CallBack_ServerSelected",param1.index);
            }
        }
        
        protected function onBack(param1:IndexEvent) : void
        {
            if(param1.index == CANCELLED_INDEX)
            {
                switch(this.menuState)
                {
                    case MENU_STATE_TAB:
                        this.openStartMenu();
                        break;
                    case MENU_STATE_LIST:
                        if(bManagerUsingGamepad)
                        {
                            this.menuState = MENU_STATE_TAB;
                        }
                        else
                        {
                            this.openStartMenu();
                        }
                        break;
                    case MENU_STATE_FILTERS:
                        if(param1.target == this.filtersContainer)
                        {
                            this.menuState = MENU_STATE_LIST;
                        }
                        break;
                    case MENU_STATE_DETAILS:
                        this.menuState = MENU_STATE_LIST;
                }
            }
        }
        
        public function showFilterOptions(param1:ButtonEvent) : void
        {
            if(this.menuState == MENU_STATE_LIST || !bManagerUsingGamepad)
            {
                this.menuState = MENU_STATE_FILTERS;
            }
        }
        
        public function showDetails(param1:ButtonEvent) : void
        {
            if(this.menuState == MENU_STATE_LIST || !bManagerUsingGamepad)
            {
                this.menuState = MENU_STATE_DETAILS;
                ExternalInterface.call("CallBack_ServerDetailsClicked");
            }
        }
        
        public function joinGame(param1:ButtonEvent) : void
        {
            ExternalInterface.call("CallBack_ServerJoinGame");
        }
        
        public function spectateGame(param1:ButtonEvent) : void
        {
            ExternalInterface.call("CallBack_ServerSpectateGame");
        }
        
        public function set searchTabs(param1:Object) : void
        {
            var _loc2_:Array = param1 as Array;
            if(param1)
            {
                this.tabButtonBar.dataProvider = new DataProvider(_loc2_);
            }
            this.tabButtonBar.selectedIndex = 0;
        }
        
        private function onListSelected(param1:IndexEvent) : void
        {
            if(MenuManager.manager && !MenuManager.manager.bUsingGamepad)
            {
                this.menuState = ServerBrowserMenu.MENU_STATE_LIST;
                ExternalInterface.call("CallBack_SearchTabChanged",param1.index);
            }
            this.serverListContainer.tabChanged();
        }
        
        private function onButtonSelected(param1:ButtonEvent) : void
        {
            if(MenuManager.manager && MenuManager.manager.bUsingGamepad)
            {
                this.menuState = ServerBrowserMenu.MENU_STATE_LIST;
                ExternalInterface.call("CallBack_SearchTabChanged",this.tabButtonBar.selectedIndex);
            }
            this.serverListContainer.tabChanged();
        }
        
        private function makeFakeTabs() : *
        {
            var _loc1_:Array = new Array("A","B","C","D");
            this.searchTabs = _loc1_;
        }
        
        private function pushbackBrowser() : *
        {
        }
        
        private function pushforwardBrowser() : *
        {
        }
    }
}
