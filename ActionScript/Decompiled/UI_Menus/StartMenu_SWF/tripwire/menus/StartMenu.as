package tripwire.menus
{
    import com.greensock.events.TweenEvent;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.Extensions;
    import tripwire.containers.StartFindGameContainer;
    import tripwire.containers.StartOptionsContainer;
    import tripwire.containers.StartOverviewBrowserContainer;
    import tripwire.containers.StartOverviewContainer;
    import tripwire.containers.TripContainer;
    import tripwire.managers.MenuManager;
    
    public class StartMenu extends TripContainer
    {
        
        public static var MENU_STATE_HOME:int = 0;
        
        public static var MENU_STATE_FIND_GAME:int = 1;
        
        public static var MENU_STATE_CREATE_GAME:int = 2;
        
        public static var MENU_STATE_SERVER_BROWSER:int = 3;
        
        public static var MENU_STATE_SOLO_GAME:int = 4;
        
        public static var MENU_STATE_TUTORIAL_GAME:int = 5;
        
        public static var MENU_STATE_OVERVIEW:int = 6;
        
        public static var MENU_STATE_OVERVIEW_SERVER_BROWSER:int = 7;
        
        public static var MENU_STATE_OVERVIEW_MATCHMAKING:int = 8;
        
        public static var MENU_STATE_OVERVIEW_CREATE_GAME:int = 9;
        
        public static var FADE_OUT_OBJECTIVES = "FadeOutMissionObjectives";
        
        public static var FADE_IN_OBJECTIVES = "FadeInMissionObjectives";
         
        
        public var _currentMenuState:int = -1;
        
        public var _previousMenuState:int = -1;
        
        public var findGameContainer:StartFindGameContainer;
        
        public var gameOptionsContainer:StartOptionsContainer;
        
        public var overviewContainer:StartOverviewContainer;
        
        public var serverBrowserOverviewContainer:StartOverviewBrowserContainer;
        
        public var missionObjectivesContainerMC:MissionObjectivesContainer;
        
        private var _currentContainer:TripContainer;
        
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
            this.overviewContainer.bBlockContainerFocus = true;
            this.serverBrowserOverviewContainer.visible = false;
            tabEnabled = false;
            this._currentContainer = this.findGameContainer;
            this.gameOptionsContainer.addEventListener(FADE_OUT_OBJECTIVES,this.fadeOutObjectives,false,0,true);
            this.gameOptionsContainer.addEventListener(FADE_IN_OBJECTIVES,this.fadeInObjectives,false,0,true);
            this.findGameContainer.addEventListener(FADE_OUT_OBJECTIVES,this.fadeOutObjectives,false,0,true);
            this.findGameContainer.addEventListener(FADE_IN_OBJECTIVES,this.fadeInObjectives,false,0,true);
            this.registerWithChildContainers();
            this.menuState = MENU_STATE_HOME;
        }
        
        public function registerWithChildContainers() : void
        {
            this.findGameContainer.myStartMenu = this;
            this.gameOptionsContainer.myStartMenu = this;
            this.overviewContainer.myStartMenu = this;
            this.serverBrowserOverviewContainer.myStartMenu = this;
            this.missionObjectivesContainerMC.myStartMenu = this;
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            if(param1.handled)
            {
                return;
            }
            if(!_bReadyForInput)
            {
                return;
            }
            super.handleInput(param1);
            if(this.overviewContainer.visible && this.overviewContainer.GetPopUpVisible())
            {
                return;
            }
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_X:
                        if(this.missionObjectivesContainerMC.interactable)
                        {
                            this.missionObjectivesContainerMC.toggleExpanded();
                            this.findGameContainer.whatsNewButton.bDisableLeftRight = this.missionObjectivesContainerMC.expanded;
                        }
                        break;
                    case NavigationCode.LEFT:
                        this.missionObjectivesContainerMC.onLeftPressed();
                        break;
                    case NavigationCode.RIGHT:
                        this.missionObjectivesContainerMC.onRighttPressed();
                }
            }
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.missionObjectivesContainerMC.updateControllerIcons();
        }
        
        private function setTabIndexes() : void
        {
            this.findGameContainer.tabIndex = 1;
        }
        
        public function get menuState() : int
        {
            return this._currentMenuState;
        }
        
        public function set externalMenuState(param1:int) : *
        {
            this.menuState = param1;
        }
        
        public function set menuState(param1:int) : void
        {
            if(this._currentMenuState != param1)
            {
                this.closeMenuState(this._currentMenuState);
                switch(param1)
                {
                    case MENU_STATE_OVERVIEW:
                    case MENU_STATE_OVERVIEW_CREATE_GAME:
                    case MENU_STATE_OVERVIEW_MATCHMAKING:
                        this.overviewContainer.openContainer();
                        this._currentContainer = this.overviewContainer;
                        this.missionObjectivesContainerMC.expanded = false;
                        this.missionObjectivesContainerMC.updateControllerIcons();
                        break;
                    case MENU_STATE_OVERVIEW_SERVER_BROWSER:
                        this._currentContainer = this.serverBrowserOverviewContainer;
                        this.serverBrowserOverviewContainer.openContainer();
                        this.missionObjectivesContainerMC.expanded = false;
                        this.missionObjectivesContainerMC.updateControllerIcons();
                        break;
                    case MENU_STATE_FIND_GAME:
                        this.gameOptionsContainer.menuState = MENU_STATE_FIND_GAME;
                        this.gameOptionsContainer.openContainer();
                        this._currentContainer = this.gameOptionsContainer;
                        this.missionObjectivesContainerMC.expanded = false;
                        this.missionObjectivesContainerMC.updateControllerIcons();
                        break;
                    case MENU_STATE_CREATE_GAME:
                        this.gameOptionsContainer.menuState = MENU_STATE_CREATE_GAME;
                        this.gameOptionsContainer.openContainer();
                        this._currentContainer = this.gameOptionsContainer;
                        this.missionObjectivesContainerMC.expanded = false;
                        this.missionObjectivesContainerMC.updateControllerIcons();
                        break;
                    case MENU_STATE_SOLO_GAME:
                        this.gameOptionsContainer.menuState = MENU_STATE_SOLO_GAME;
                        this.gameOptionsContainer.openContainer();
                        this._currentContainer = this.gameOptionsContainer;
                        this.missionObjectivesContainerMC.expanded = false;
                        this.missionObjectivesContainerMC.updateControllerIcons();
                        break;
                    case MENU_STATE_SERVER_BROWSER:
                        this.missionObjectivesContainerMC.expanded = false;
                        this.missionObjectivesContainerMC.updateControllerIcons();
                        ExternalInterface.call("Callback_OpenServerBrowser");
                        break;
                    case MENU_STATE_HOME:
                        this.findGameContainer.openContainer();
                        this._currentContainer = this.findGameContainer;
                        this.missionObjectivesContainerMC.expanded = false;
                        this.missionObjectivesContainerMC.updateControllerIcons();
                    default:
                        this.missionObjectivesContainerMC.expanded = false;
                        this.missionObjectivesContainerMC.updateControllerIcons();
                }
                this._previousMenuState = this._currentMenuState;
                this._currentMenuState = param1;
                ExternalInterface.call("Callback_StartMenuChange");
            }
        }
        
        public function closeMenuState(param1:int) : void
        {
            switch(param1)
            {
                case MENU_STATE_OVERVIEW:
                case MENU_STATE_OVERVIEW_CREATE_GAME:
                case MENU_STATE_OVERVIEW_MATCHMAKING:
                    this.overviewContainer.closeContainer();
                    break;
                case MENU_STATE_OVERVIEW_SERVER_BROWSER:
                    this.serverBrowserOverviewContainer.closeContainer();
                    break;
                case MENU_STATE_FIND_GAME:
                    this.gameOptionsContainer.closeContainer();
                    break;
                case MENU_STATE_CREATE_GAME:
                    this.gameOptionsContainer.closeContainer();
                    break;
                case MENU_STATE_SOLO_GAME:
                    this.gameOptionsContainer.closeContainer();
                    break;
                case MENU_STATE_SERVER_BROWSER:
                    break;
                case MENU_STATE_HOME:
                    this.findGameContainer.closeContainer();
            }
        }
        
        public function proceedToMatchMaking() : void
        {
            this.gameOptionsContainer.bIsSoloGame = false;
        }
        
        protected function onBack(param1:IndexEvent) : void
        {
            if(this._currentMenuState >= MENU_STATE_OVERVIEW)
            {
                return;
            }
        }
        
        override public function openContainer(param1:Boolean = true) : void
        {
            super.openContainer();
            if(this._currentMenuState < MENU_STATE_OVERVIEW && this.menuState != MENU_STATE_HOME)
            {
                this.menuState = MENU_STATE_HOME;
            }
            else if(this._currentContainer)
            {
                this.openChildContainer(this._currentContainer);
            }
            else if(this._currentMenuState >= MENU_STATE_OVERVIEW)
            {
                this.openChildContainer(this.overviewContainer);
                this.overviewContainer.bBlockContainerFocus = false;
            }
            else
            {
                this.openChildContainer(this.findGameContainer);
            }
        }
        
        override public function get bBlockContainerFocus() : Boolean
        {
            if(this._currentContainer != null)
            {
                return this._currentContainer.bBlockContainerFocus;
            }
            return super.bBlockContainerFocus;
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            if(this._currentContainer != null)
            {
                this._currentContainer.selectContainer();
            }
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            if(bManagerUsingGamepad && !MenuManager.manager.bPopUpOpen)
            {
                if(this._currentContainer != null && bOpen)
                {
                    this._currentContainer.deselectContainer();
                }
            }
        }
        
        override public function closeContainer() : void
        {
            if(this.menuState < MENU_STATE_OVERVIEW)
            {
                this.menuState = MENU_STATE_HOME;
            }
            super.closeContainer();
            if(this._currentContainer != null)
            {
                this._currentContainer.closeContainer();
            }
        }
        
        public function openChildContainer(param1:TripContainer) : void
        {
            param1.openContainer();
        }
        
        public function closeChildContainer(param1:TripContainer) : void
        {
            if(param1 != null)
            {
                param1.closeContainer();
                param1.removeEventListener(IndexEvent.INDEX_CHANGE,this.onBack);
            }
        }
        
        override protected function onOpened(param1:TweenEvent = null) : void
        {
            super.onOpened(param1);
        }
        
        public function fadeOutObjectives(param1:Event = null) : void
        {
            this.missionObjectivesContainerMC.interactable = false;
        }
        
        public function fadeInObjectives(param1:Event = null) : void
        {
            this.missionObjectivesContainerMC.interactable = true;
        }
    }
}
