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
    import tripwire.controls.PartySlotButton;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripScrollingList;
    
    public class VersusLobbyWidget extends PartyWidget
    {
         
        
        public var squadMember6:PartySlotButton;
        
        public var squadMember7:PartySlotButton;
        
        public var squadMember8:PartySlotButton;
        
        public var squadMember9:PartySlotButton;
        
        public var squadMember10:PartySlotButton;
        
        public var squadMember11:PartySlotButton;
        
        public var perksList6:TripScrollingList;
        
        public var perksList7:TripScrollingList;
        
        public var perksList8:TripScrollingList;
        
        public var perksList9:TripScrollingList;
        
        public var perksList10:TripScrollingList;
        
        public var perksList11:TripScrollingList;
        
        public var optionsList6:TripScrollingList;
        
        public var optionsList7:TripScrollingList;
        
        public var optionsList8:TripScrollingList;
        
        public var optionsList9:TripScrollingList;
        
        public var optionsList10:TripScrollingList;
        
        public var optionsList11:TripScrollingList;
        
        public var switchTeamsButton:TripButton;
        
        public var teamImage:MovieClip;
        
        public var lastTeamId:int = 0;
        
        public var warningText:TextField;
        
        public function VersusLobbyWidget()
        {
            MAX_SLOTS = 12;
            super();
            enableInitCallback = true;
        }
        
        override protected function setTabIndex() : *
        {
            readyButton.tabIndex = 17;
            this.switchTeamsButton.tabIndex = 16;
            leaveButton.tabIndex = 15;
            this.squadMember11.tabIndex = 13;
            this.squadMember10.tabIndex = 12;
            this.squadMember9.tabIndex = 11;
            this.squadMember8.tabIndex = 10;
            this.squadMember7.tabIndex = 9;
            this.squadMember6.tabIndex = 8;
            squadMember5.tabIndex = 7;
            squadMember4.tabIndex = 6;
            squadMember3.tabIndex = 5;
            squadMember2.tabIndex = 4;
            squadMember1.tabIndex = 3;
            createPartyButton.tabIndex = 2;
            squadMember0.tabIndex = 1;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.switchTeamsButton.addEventListener(ButtonEvent.PRESS,this.requestSwitchTeams,false,0,true);
            this.balanceWarning = "";
        }
        
        public function requestSwitchTeams(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_RequestTeamSwitch");
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
                        if(_loc3_.focused == 1)
                        {
                            FocusManager.setFocus(this.switchTeamsButton);
                            param1.handled = true;
                        }
                        break;
                    case NavigationCode.UP:
                        if(readyButton.focused == 1)
                        {
                            FocusManager.setFocus(this.switchTeamsButton);
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
    }
}
