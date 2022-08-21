package tripwire.containers
{
    import com.greensock.events.TweenEvent;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.managers.FocusHandler;
    import tripwire.controls.TripButton;
    import tripwire.managers.MenuManager;
    
    public class StartFindGameContainer extends TripContainer
    {
         
        
        private const NUM_FINDGAME_OPTIONS:int = 3;
        
        public var tutorialButton:TripButton;
        
        public var soloOfflineButton:TripButton;
        
        public var matchMakingButton:TripButton;
        
        public var serverBrowserButton:TripButton;
        
        public var findGameHeader:SectionHeaderContainer;
        
        public function StartFindGameContainer()
        {
            super();
            sectionHeader = this.findGameHeader;
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.findGameHeader.text = !!param1.home ? param1.home : "";
                this.matchMakingButton.label = !!param1.multiplayer ? param1.multiplayer : "";
                this.serverBrowserButton.label = !!param1.serverBrowser ? param1.serverBrowser : "";
                this.soloOfflineButton.label = !!param1.solo ? param1.solo : "";
                this.tutorialButton.label = !!param1.tutorial ? param1.tutorial : "";
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            this.soloOfflineButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.tutorialButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.matchMakingButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.serverBrowserButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
        }
        
        override public function deselectContainer() : void
        {
            defaultFirstElement = currentElement;
            super.deselectContainer();
            this.tutorialButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.soloOfflineButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.matchMakingButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.serverBrowserButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
        }
        
        override protected function onOpened(param1:TweenEvent = null) : void
        {
            super.onOpened(param1);
            this.setTabIndexes();
        }
        
        public function setTabIndexes() : *
        {
            if(this.matchMakingButton.enabled)
            {
                this.matchMakingButton.tabIndex = 1;
                this.serverBrowserButton.tabIndex = 2;
                this.soloOfflineButton.tabIndex = 3;
                this.tutorialButton.tabIndex = 4;
            }
            else if(!this.matchMakingButton.enabled)
            {
                this.matchMakingButton.tabIndex = -1;
                this.serverBrowserButton.tabIndex = -1;
                this.soloOfflineButton.tabIndex = 1;
                this.tutorialButton.tabIndex = 2;
            }
            if(currentElement == null)
            {
                defaultFirstElement = currentElement = this.matchMakingButton;
            }
            if(!currentElement.enabled)
            {
                defaultFirstElement = currentElement = !!this.matchMakingButton.enabled ? this.matchMakingButton : this.soloOfflineButton;
            }
            if(bManagerUsingGamepad && !MenuManager.manager.bPopUpOpen)
            {
                FocusHandler.getInstance().setFocus(currentElement);
            }
        }
        
        protected function handleButtonEvent(param1:ButtonEvent) : void
        {
            switch(param1.currentTarget)
            {
                case this.matchMakingButton:
                    dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,0));
                    break;
                case this.serverBrowserButton:
                    dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,1));
                    break;
                case this.soloOfflineButton:
                    dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,2));
                    break;
                case this.tutorialButton:
                    ExternalInterface.call("Callback_StartTutorial");
            }
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.setTabIndexes();
        }
    }
}
