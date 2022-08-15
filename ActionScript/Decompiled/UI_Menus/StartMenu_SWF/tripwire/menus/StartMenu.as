package tripwire.menus
{
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import scaleform.clik.events.IndexEvent;
    import scaleform.gfx.Extensions;
    import tripwire.containers.StartFindGameContainer;
    import tripwire.containers.StartOptionsContainer;
    import tripwire.containers.StartOverviewBrowserContainer;
    import tripwire.containers.StartOverviewContainer;
    import tripwire.containers.TripContainer;
    import tripwire.managers.MenuManager;
    
    public class StartMenu extends TripContainer
    {
         
        
        public var findGameContainer:StartFindGameContainer;
        
        public var gameOptionsContainer:StartOptionsContainer;
        
        public var overviewContainer:StartOverviewContainer;
        
        public var serverBrowserOverviewContainer:StartOverviewBrowserContainer;
        
        public const FindGameMenu:int = 255;
        
        public const MatchMakingState:int = 0;
        
        public const ServerBrowserState:int = 1;
        
        public const SoloState:int = 2;
        
        public const OverviewState:int = 3;
        
        public const ServerBrowserOverviewState:int = 4;
        
        public var _currentMenuState:int = 255;
        
        private var _currentContainer:TripContainer;
        
        private var _bOverview:Boolean;
        
        public function StartMenu()
        {
            super();
            Extensions.enabled = true;
            enableInitCallback = true;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.gameOptionsContainer.visible = false;
            this.overviewContainer.visible = false;
            this.serverBrowserOverviewContainer.visible = false;
            this.showMenus(true,false,false,false);
            tabEnabled = false;
            this._currentContainer = this.findGameContainer;
        }
        
        private function setTabIndexes() : void
        {
            this.findGameContainer.tabIndex = 1;
        }
        
        public function openMultiplayerMenu() : void
        {
            this.gameOptionsContainer.bIsSoloGame = false;
            this.showMenus(false,true,false,false);
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            if(bManagerUsingGamepad && !MenuManager.manager.bPopUpOpen)
            {
                if(this._currentContainer != null)
                {
                    this._currentContainer.selectContainer();
                }
            }
        }
        
        public function showOverview(param1:Boolean, param2:Boolean, param3:Boolean = false, param4:Boolean = false) : void
        {
            this._bOverview = param1;
            if(param1)
            {
                if(param4)
                {
                    this.showMenus(false,false,false,true);
                }
                else
                {
                    this.showMenus(false,false,true,false);
                    this.overviewContainer.permissionsButton.enabled = false;
                    this.overviewContainer.permissionsButton.focusable = false;
                    this.overviewContainer.permissionsButton.visible = param2 || param3;
                }
            }
            else
            {
                this.showMenus(true,false,false,false);
            }
        }
        
        private function showMenus(param1:Boolean, param2:Boolean, param3:Boolean, param4:Boolean) : void
        {
            var _loc5_:TripContainer = null;
            if(this._currentContainer != null)
            {
                _loc5_ = this._currentContainer;
            }
            if(param1)
            {
                this._currentContainer = this.findGameContainer;
                this.menuState = this.FindGameMenu;
            }
            else if(param2)
            {
                this._currentContainer = this.gameOptionsContainer;
                this.menuState = !!this.gameOptionsContainer.bIsSoloGame ? int(this.SoloState) : int(this.MatchMakingState);
            }
            else if(param3)
            {
                this._currentContainer = this.overviewContainer;
                this.menuState = this.OverviewState;
            }
            else if(param4)
            {
                this._currentContainer = this.serverBrowserOverviewContainer;
                this.menuState = this.ServerBrowserOverviewState;
            }
            if(this._currentContainer != _loc5_)
            {
                this.closeChildContainer(_loc5_);
                this.openChildContainer(this._currentContainer);
            }
        }
        
        public function get menuState() : int
        {
            return this._currentMenuState;
        }
        
        public function set menuState(param1:int) : void
        {
            this._currentMenuState = param1;
            ExternalInterface.call("Callback_StartMenuChange");
        }
        
        protected function onBack(param1:IndexEvent) : void
        {
            if(this._currentContainer == this.overviewContainer)
            {
                return;
            }
            switch(param1.index)
            {
                case TripContainer.CANCELLED_INDEX:
                    if(this._currentContainer)
                    {
                        this.closeChildContainer(this._currentContainer);
                        this.showMenus(true,false,false,false);
                    }
                    break;
                case this.MatchMakingState:
                    this.gameOptionsContainer.bIsSoloGame = false;
                    this.showMenus(false,true,false,false);
                    break;
                case this.ServerBrowserState:
                    ExternalInterface.call("Callback_OpenServerBrowser");
                    break;
                case this.SoloState:
                    this.gameOptionsContainer.bIsSoloGame = true;
                    this.showMenus(false,true,false,false);
            }
        }
        
        override public function openContainer() : void
        {
            super.openContainer();
            if(this._currentContainer)
            {
                this.openChildContainer(this._currentContainer);
            }
            else if(this._bOverview)
            {
                this.openChildContainer(this.overviewContainer);
            }
            else
            {
                this.openChildContainer(this.findGameContainer);
            }
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            if(this.menuState == this.ServerBrowserOverviewState && bManagerUsingGamepad)
            {
                MenuManager.manager.setFocusToPartyWidget();
            }
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            if(this._currentContainer != null)
            {
                this._currentContainer.closeContainer();
            }
        }
        
        public function openChildContainer(param1:TripContainer) : void
        {
            param1.openContainer();
            param1.selectContainer();
            param1.addEventListener(IndexEvent.INDEX_CHANGE,this.onBack,false,0,true);
        }
        
        public function closeChildContainer(param1:TripContainer) : void
        {
            if(param1 != null)
            {
                param1.closeContainer();
                param1.removeEventListener(IndexEvent.INDEX_CHANGE,this.onBack);
            }
        }
    }
}
