package tripwire.widgets
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.FocusManager;
    import scaleform.gfx.TextFieldEx;
    import tripwire.controls.PartySlotButton;
    import tripwire.controls.TripButton;
    
    public class VersusLobbyWidget extends PartyWidget
    {
         
        
        public var squadMember6:PartySlotButton;
        
        public var squadMember7:PartySlotButton;
        
        public var squadMember8:PartySlotButton;
        
        public var squadMember9:PartySlotButton;
        
        public var squadMember10:PartySlotButton;
        
        public var squadMember11:PartySlotButton;
        
        public var switchTeamsButton:TripButton;
        
        public var teamImage:MovieClip;
        
        public var lastTeamId:int = 0;
        
        public var warningText:TextField;
        
        public var switchTeamsText:TextField;
        
        public var teamsIcon:MovieClip;
        
        public var switchTeamsBG:MovieClip;
        
        private const MATCH_CONTAINER_CONSOLE_Y:int = 632;
        
        private const CONSOLE_Y_OFFSET:int = 8;
        
        private const WIDGET_WIDTH:int = 416;
        
        public function VersusLobbyWidget()
        {
            MAX_SLOTS = 12;
            super();
            enableInitCallback = true;
            TextFieldEx.setTextAutoSize(this.switchTeamsText,"shrink");
        }
        
        override protected function setTabIndex() : *
        {
            readyButton.tabIndex = 13;
            this.squadMember11.tabIndex = 12;
            this.squadMember10.tabIndex = 11;
            this.squadMember9.tabIndex = 10;
            this.squadMember8.tabIndex = 9;
            this.squadMember7.tabIndex = 8;
            this.squadMember6.tabIndex = 7;
            squadMember5.tabIndex = 6;
            squadMember4.tabIndex = 5;
            squadMember3.tabIndex = 4;
            squadMember2.tabIndex = 3;
            squadMember1.tabIndex = 2;
            squadMember0.tabIndex = 1;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            this.switchTeamsButton.addEventListener(ButtonEvent.CLICK,this.requestSwitchTeams,false,0,true);
            this.balanceWarning = "";
            super.addedToStage(param1);
        }
        
        private function requestSwitchTeams(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_RequestTeamSwitch");
        }
        
        public function set switchTeamsString(param1:String) : void
        {
            this.switchTeamsButton.label = param1;
            this.switchTeamsText.text = param1;
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            var _loc3_:PartySlotButton = null;
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.DOWN:
                        _loc3_ = this.lastVisibleMemberSlot;
                        if(_loc3_.focused == 1 && readyButton.visible)
                        {
                            FocusManager.setFocus(readyButton);
                            param1.handled = true;
                        }
                        break;
                    case NavigationCode.UP:
                        if(readyButton.focused == 1)
                        {
                            FocusManager.setFocus(this.lastVisibleMemberSlot);
                            param1.handled = true;
                        }
                        else if(this.switchTeamsButton.focused == 1)
                        {
                            FocusManager.setFocus(this.lastVisibleMemberSlot);
                            param1.handled = true;
                        }
                }
            }
            super.handleInput(param1);
        }
        
        public function get lastVisibleMemberSlot() : PartySlotButton
        {
            return this["squadMember" + (MAX_SLOTS - 1)];
        }
        
        public function set balanceWarning(param1:String) : void
        {
            this.warningText.text = param1;
        }
        
        public function set myTeam(param1:int) : void
        {
            if(this.lastTeamId != param1)
            {
                if(param1 == 255)
                {
                    this.teamImage.gotoAndStop(2);
                }
                else
                {
                    this.teamImage.gotoAndStop(1);
                }
                this.lastTeamId = param1;
            }
        }
        
        override public function updateControllerIconVisibility() : *
        {
            super.updateControllerIconVisibility();
            if(!bManagerUsingGamepad)
            {
                this.switchTeamsButton.focused = 0;
            }
            this.switchTeamsButton.focusable = false;
            this.switchTeamsButton.visible = !bManagerUsingGamepad;
            this.switchTeamsText.visible = bManagerUsingGamepad;
            this.teamsIcon.visible = bManagerUsingGamepad;
            this.switchTeamsBG.visible = bManagerUsingGamepad;
            matchStartContainer.BlackBG.alpha = !!bManagerUsingGamepad ? 0 : 1;
            if(this.switchTeamsText.text != this.switchTeamsButton.label)
            {
                this.switchTeamsText.text = this.switchTeamsButton.label;
            }
        }
    }
}
