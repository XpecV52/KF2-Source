package tripwire.containers
{
    import com.greensock.events.TweenEvent;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.Button;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.managers.FocusHandler;
    import scaleform.clik.ui.InputDetails;
    import tripwire.controls.TitleButton;
    import tripwire.controls.TripButton;
    import tripwire.managers.MenuManager;
    import tripwire.menus.StartMenu;
    
    public class StartFindGameContainer extends TripContainer
    {
        
        public static var WHATS_NEW_CLICKED = "WhatsNewClicked";
        
        public static var CLOSED_NEWS = "ClosedNewsPage";
         
        
        public var myStartMenu:StartMenu;
        
        private const NUM_FINDGAME_OPTIONS:int = 3;
        
        public var newsButton:TitleButton;
        
        public var tutorialButton:TripButton;
        
        public var soloOfflineButton:TripButton;
        
        public var matchMakingButton:TripButton;
        
        public var createGameButton:TripButton;
        
        public var serverBrowserButton:TripButton;
        
        public var findGameHeader:SectionHeaderContainer;
        
        public var newsPage:StartNewsContainer;
        
        public var whatsNewButton:WhatsNewButton;
        
        public function StartFindGameContainer()
        {
            super();
            sectionHeader = this.findGameHeader;
            this.whatsNewButton.autoSize = "none";
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            if(bManagerConsoleBuild)
            {
                this.serverBrowserButton.visible = false;
                this.newsButton.y = this.tutorialButton.y;
                this.tutorialButton.y = this.soloOfflineButton.y;
                this.soloOfflineButton.y = this.serverBrowserButton.y;
            }
            this.newsPage.visible = false;
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.findGameHeader.text = !!param1.home ? param1.home : "";
                this.matchMakingButton.label = !!param1.multiplayer ? param1.multiplayer : "";
                this.createGameButton.label = !!param1.createGame ? param1.createGame : "create";
                this.serverBrowserButton.label = !!param1.serverBrowser ? param1.serverBrowser : "";
                this.soloOfflineButton.label = !!param1.solo ? param1.solo : "";
                this.tutorialButton.label = !!param1.tutorial ? param1.tutorial : "";
                this.newsButton.label = !!param1.news ? param1.news : "M_NEWS_M";
            }
        }
        
        public function set whatsNew(param1:Array) : void
        {
            if(param1)
            {
                this.whatsNewButton.dataArray = param1;
            }
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            this.soloOfflineButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.tutorialButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.matchMakingButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.createGameButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.serverBrowserButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.newsButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.whatsNewButton.addEventListener(WHATS_NEW_CLICKED,this.whatsNewClicked,false,0,true);
        }
        
        override public function deselectContainer() : void
        {
            defaultFirstElement = currentElement == this.whatsNewButton ? this.matchMakingButton : currentElement;
            super.deselectContainer();
            this.tutorialButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.soloOfflineButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.matchMakingButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.createGameButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.serverBrowserButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.newsButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.whatsNewButton.removeEventListener(WHATS_NEW_CLICKED,this.whatsNewClicked);
        }
        
        override protected function onOpened(param1:TweenEvent = null) : void
        {
            super.onOpened(param1);
            if(!this.newsPage.visible)
            {
                this.setTabIndexes();
            }
        }
        
        public function setTabIndexes() : *
        {
            var _loc1_:int = 0;
            if(currentElement == this)
            {
                currentElement = null;
            }
            if(this.matchMakingButton.enabled)
            {
                this.matchMakingButton.tabIndex = ++_loc1_;
                this.createGameButton.tabIndex = ++_loc1_;
                this.serverBrowserButton.tabIndex = ++_loc1_;
                this.soloOfflineButton.tabIndex = ++_loc1_;
                this.tutorialButton.tabIndex = ++_loc1_;
                this.newsButton.tabIndex = ++_loc1_;
                this.whatsNewButton.tabIndex = ++_loc1_;
            }
            else if(!this.matchMakingButton.enabled)
            {
                this.matchMakingButton.tabIndex = -1;
                this.createGameButton.tabIndex = -1;
                this.serverBrowserButton.tabIndex = -1;
                if(this.soloOfflineButton.enabled)
                {
                    this.soloOfflineButton.tabIndex = ++_loc1_;
                    this.tutorialButton.tabIndex = ++_loc1_;
                    this.newsButton.tabIndex = ++_loc1_;
                    this.whatsNewButton.tabIndex = ++_loc1_;
                }
                else
                {
                    this.soloOfflineButton.tabIndex = ++_loc1_;
                    this.tutorialButton.tabIndex = ++_loc1_;
                    this.newsButton.tabIndex = ++_loc1_;
                    this.whatsNewButton.tabIndex = ++_loc1_;
                }
            }
            if(currentElement == null)
            {
                defaultFirstElement = currentElement = this.matchMakingButton;
            }
            if(!currentElement.enabled)
            {
                defaultFirstElement = currentElement = this.GetFirstEnabledButton();
            }
            if(bManagerUsingGamepad && !MenuManager.manager.bPopUpOpen && bSelected)
            {
                FocusHandler.getInstance().setFocus(currentElement);
            }
        }
        
        public function GetFirstEnabledButton() : Button
        {
            if(this.matchMakingButton.enabled)
            {
                return this.matchMakingButton;
            }
            if(this.soloOfflineButton.enabled)
            {
                return this.soloOfflineButton;
            }
            return this.tutorialButton;
        }
        
        protected function handleButtonEvent(param1:ButtonEvent) : void
        {
            switch(param1.currentTarget)
            {
                case this.matchMakingButton:
                    ExternalInterface.call("Callback_OpenMatchMaking");
                    break;
                case this.createGameButton:
                    ExternalInterface.call("Callback_OpenCreateGame");
                    break;
                case this.serverBrowserButton:
                    this.myStartMenu.menuState = StartMenu.MENU_STATE_SERVER_BROWSER;
                    break;
                case this.soloOfflineButton:
                    ExternalInterface.call("Callback_SoloButtonPressed");
                    break;
                case this.tutorialButton:
                    ExternalInterface.call("Callback_StartTutorial");
                    break;
                case this.newsButton:
                    ExternalInterface.call("Callback_NewsButtonPressed");
            }
        }
        
        public function closedNewsPage(param1:Event) : void
        {
            this.newsButton.selected = false;
            this.newsButton.hasAlert = false;
            this.whatsNewButton.bDisableLeftRight = false;
            this.newsPage.removeEventListener(CLOSED_NEWS,this.closedNewsPage);
            this.dispatchEvent(new Event("FadeInMissionObjectives"));
            if(bManagerUsingGamepad)
            {
                currentElement = this.newsButton;
                FocusHandler.getInstance().setFocus(this.newsButton);
            }
        }
        
        public function whatsNewClicked(param1:Event = null) : void
        {
            ExternalInterface.call("Callback_OnWhatsNewClicked",this.whatsNewButton.itemIndex);
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.setTabIndexes();
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            super.handleInput(param1);
            if(param1.handled)
            {
                return;
            }
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.RIGHT:
                        param1.handled = true;
                        break;
                    case NavigationCode.LEFT:
                        param1.handled = true;
                }
            }
        }
        
        override protected function closeAnimation() : *
        {
            visible = false;
        }
    }
}
