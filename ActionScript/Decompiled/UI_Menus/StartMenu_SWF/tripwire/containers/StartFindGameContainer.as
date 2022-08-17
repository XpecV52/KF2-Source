package tripwire.containers
{
    import flash.events.Event;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.managers.FocusHandler;
    import tripwire.controls.TripButton;
    import tripwire.managers.MenuManager;
    
    public class StartFindGameContainer extends TripContainer
    {
         
        
        private const NUM_FINDGAME_OPTIONS:int = 3;
        
        public var soloOfflineButton:TripButton;
        
        public var matchMakingButton:TripButton;
        
        public var serverBrowserButton:TripButton;
        
        public var findGameHeader:SectionHeaderContainer;
        
        public function StartFindGameContainer()
        {
            super();
            defaultFirstElement = currentElement = this.matchMakingButton;
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
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            defaultFirstElement = currentElement = this.matchMakingButton;
            this.setTabIndexes();
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            this.soloOfflineButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.matchMakingButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.serverBrowserButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            if(bManagerUsingGamepad && !MenuManager.manager.bPopUpOpen)
            {
                FocusHandler.getInstance().setFocus(currentElement);
            }
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            this.soloOfflineButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.matchMakingButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.serverBrowserButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
        }
        
        private function setTabIndexes() : *
        {
            this.matchMakingButton.tabIndex = 1;
            this.serverBrowserButton.tabIndex = 2;
            this.soloOfflineButton.tabIndex = 3;
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
            }
        }
    }
}
