package tripwire.widgets
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.TimerEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import flash.ui.Keyboard;
    import flash.utils.Timer;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.managers.FocusHandler;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.FocusManager;
    import scaleform.gfx.TextFieldEx;
    import tripwire.containers.NotificationContainer;
    import tripwire.containers.TripContainer;
    import tripwire.controls.PartySlotButton;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripScrollingList;
    
    public class PartyWidget extends TripContainer
    {
         
        
        public var Notification:NotificationContainer;
        
        public var searchingTextField:TextField;
        
        public var SearchingBG:MovieClip;
        
        public var squadMember0:PartySlotButton;
        
        public var squadMember1:PartySlotButton;
        
        public var squadMember2:PartySlotButton;
        
        public var squadMember3:PartySlotButton;
        
        public var squadMember4:PartySlotButton;
        
        public var squadMember5:PartySlotButton;
        
        public var perksList0:TripScrollingList;
        
        public var perksList1:TripScrollingList;
        
        public var perksList2:TripScrollingList;
        
        public var perksList3:TripScrollingList;
        
        public var perksList4:TripScrollingList;
        
        public var perksList5:TripScrollingList;
        
        public var optionsList0:TripScrollingList;
        
        public var optionsList1:TripScrollingList;
        
        public var optionsList2:TripScrollingList;
        
        public var optionsList3:TripScrollingList;
        
        public var optionsList4:TripScrollingList;
        
        public var optionsList5:TripScrollingList;
        
        public var headerIcon:MovieClip;
        
        public var controllerIcon:MovieClip;
        
        public var startIcon:MovieClip;
        
        public var createPartyButton:TripButton;
        
        public var leaveButton:TripButton;
        
        public var readyButton:TripButton;
        
        public var ChatBoxWidget:PlayerChatWidget;
        
        public var bReady:Boolean;
        
        public var matchStartContainer:MovieClip;
        
        public const FinalCountdownColor:uint = 15534080;
        
        public const CountDownText:uint = 12234399;
        
        public var _waitingString:String = "TEXT";
        
        public var _deployingString:String = "TEXT";
        
        protected var _bInParty:Boolean = false;
        
        protected var bListsInit:Boolean = false;
        
        protected var MAX_SLOTS:int = 6;
        
        protected var _deployTimer:Timer;
        
        protected var _currentTime:int;
        
        protected var _bInitialPartySet:Boolean;
        
        public function PartyWidget()
        {
            super();
            this.matchStartContainer.messageTextField.visible = false;
            this.matchStartContainer.timeTextField.visible = false;
            this.matchStartContainer.BlackBG.visible = false;
            this._deployTimer = new Timer(1000);
            this._deployTimer.addEventListener(TimerEvent.TIMER,this.countdownTimer,false,0,true);
            if(this._bInParty)
            {
                defaultFirstElement = currentElement = this.squadMember0;
            }
            else
            {
                defaultFirstElement = currentElement = this.createPartyButton;
            }
            this.setTabIndex();
            this.deselectContainer();
            ANIM_OFFSET_X = 24;
        }
        
        public function get waitingString() : String
        {
            return this._waitingString;
        }
        
        public function set waitingString(param1:String) : void
        {
            this._waitingString = param1;
        }
        
        public function get deployingString() : String
        {
            return this._deployingString;
        }
        
        public function set deployingString(param1:String) : void
        {
            this._deployingString = param1;
            this.matchStartContainer.timeTextField.visible = true;
            this.matchStartContainer.BlackBG.visible = true;
        }
        
        protected function setTabIndex() : *
        {
            this.readyButton.tabIndex = 9;
            this.leaveButton.tabIndex = 8;
            this.squadMember5.tabIndex = 7;
            this.squadMember4.tabIndex = 6;
            this.squadMember3.tabIndex = 5;
            this.squadMember2.tabIndex = 4;
            this.squadMember1.tabIndex = 3;
            this.createPartyButton.tabIndex = 2;
            this.squadMember0.tabIndex = 1;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            var _loc2_:int = 0;
            while(_loc2_ < this.MAX_SLOTS)
            {
                this.slotChanged(_loc2_,false,false,false);
                this.updatePerk(_loc2_,"","","");
                _loc2_++;
            }
            TextFieldEx.setVerticalAlign(this.searchingTextField,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.matchStartContainer.messageTextField,TextFieldEx.VALIGN_CENTER);
            this.leaveButton.addEventListener(ButtonEvent.CLICK,this.leaveParty,false,0,true);
            this.readyButton.addEventListener(ButtonEvent.CLICK,this.readyUp,false,0,true);
            this.createPartyButton.addEventListener(ButtonEvent.CLICK,this.createParty,false,0,true);
            this.readyButton.focused = 0;
            this.ChatBoxWidget.InitializeAsPartyChat();
            this.updateControllerIconVisibility();
            this.bListsInit = true;
            super.addedToStage(param1);
            this.bInParty = false;
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            var _loc3_:PartySlotButton = null;
            super.handleInput(param1);
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.DOWN:
                        if(this.createPartyButton.visible)
                        {
                            FocusManager.setFocus(this.createPartyButton);
                        }
                        else if(this.leaveButton.visible)
                        {
                            _loc3_ = this["squadMember" + (this.MAX_SLOTS - 1)];
                            if(_loc3_.focused == 1)
                            {
                                FocusHandler.getInstance().setFocus(this.leaveButton);
                            }
                        }
                }
            }
        }
        
        public function set readyHighlight(param1:Boolean) : void
        {
            FocusHandler.getInstance().setFocus(this.readyButton);
        }
        
        public function testKey(param1:KeyboardEvent) : void
        {
            if(param1.keyCode == Keyboard.Q)
            {
                this.readyHighlight = true;
            }
        }
        
        public function set searchingText(param1:String) : void
        {
            this.searchingTextField.text = param1;
            if(param1 != "")
            {
                this.SearchingBG.visible = true;
            }
            else if(param1 == "")
            {
                this.SearchingBG.visible = false;
            }
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.updateControllerIconVisibility();
        }
        
        public function updateControllerIconVisibility() : *
        {
            this.headerIcon.visible = !bManagerUsingGamepad || bSelected;
            this.controllerIcon.visible = bManagerUsingGamepad && !bSelected;
            this.startIcon.visible = bManagerUsingGamepad && !bSelected && this.readyButton.visible;
        }
        
        public function set bInParty(param1:Boolean) : void
        {
            var _loc2_:PartySlotButton = null;
            var _loc3_:int = 0;
            if(this._bInParty != param1)
            {
                this.setTabIndex();
            }
            else
            {
                if(this._bInitialPartySet)
                {
                    return;
                }
                this._bInitialPartySet = true;
            }
            this._bInParty = param1;
            if(param1)
            {
                this.createPartyButton.visible = !param1;
            }
            _loc2_ = this["squadMember" + _loc3_];
            _loc2_.enabled = this._bInParty;
            _loc3_ = 1;
            while(_loc3_ < this.MAX_SLOTS)
            {
                _loc2_ = this["squadMember" + _loc3_];
                _loc2_.visible = _loc2_.bIsOccupied || this._bInParty;
                _loc3_++;
            }
        }
        
        public function set locked(param1:Boolean) : void
        {
            this.squadMember0.enabled = !param1;
        }
        
        public function slotChanged(param1:int, param2:Boolean, param3:Boolean, param4:Boolean) : void
        {
            var _loc5_:PartySlotButton = this["squadMember" + param1];
            var _loc6_:TripScrollingList = this["perksList" + param1];
            var _loc7_:TripScrollingList = this["optionsList" + param1];
            if(!this.bListsInit)
            {
                _loc5_.slotIndex = param1;
                _loc5_.perksList = _loc6_;
                _loc6_.visible = false;
                _loc5_.optionsList = _loc7_;
                _loc7_.visible = false;
            }
            _loc5_.bIsMyPlayer = param3;
            _loc5_.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            _loc5_.bIsOccupied = param2;
            _loc5_.bIsLeader = param4;
        }
        
        public function updatePerk(param1:int, param2:String, param3:String, param4:String) : void
        {
            var _loc5_:PartySlotButton;
            (_loc5_ = this["squadMember" + param1]).updatePerk(param2,param3,param4);
        }
        
        public function set readyButtonVisible(param1:Boolean) : void
        {
            this.readyButton.visible = param1;
            this.matchStartContainer.visible = param1;
        }
        
        override public function selectContainer() : void
        {
            if(this.readyButton.visible)
            {
                currentElement = this.readyButton;
            }
            else if(this.createPartyButton && this.createPartyButton.visible)
            {
                currentElement = this.createPartyButton;
            }
            else
            {
                currentElement = this.squadMember0;
            }
            super.selectContainer();
            this.updateControllerIconVisibility();
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            this.updateControllerIconVisibility();
        }
        
        public function startCountdown(param1:int, param2:Boolean) : void
        {
            if(param2)
            {
                this.matchStartContainer.messageTextField.visible = true;
                this.matchStartContainer.messageTextField.text = this._deployingString;
                this.matchStartContainer.timeTextField.textColor = this.FinalCountdownColor;
            }
            else
            {
                this.matchStartContainer.messageTextField.visible = true;
                this.matchStartContainer.messageTextField.text = this.waitingString;
                this.matchStartContainer.timeTextField.textColor = this.CountDownText;
            }
            this._currentTime = param1 - 1;
            this.setDeployTime();
            this._deployTimer.repeatCount = param1;
            this._deployTimer.reset();
            this._deployTimer.start();
        }
        
        public function stopCountdown() : void
        {
            this._deployTimer.stop();
        }
        
        private function countdownTimer(param1:TimerEvent) : void
        {
            this._currentTime = Math.max(this._currentTime - 1,0);
            this.setDeployTime();
        }
        
        private function setDeployTime() : *
        {
            this.matchStartContainer.timeTextField.text = this.GetTime();
        }
        
        private function GetTime() : String
        {
            var _loc1_:int = 0;
            var _loc2_:int = 0;
            var _loc3_:String = null;
            var _loc4_:String = null;
            _loc2_ = Math.floor(this._currentTime / 60);
            if(_loc2_ < 0)
            {
                _loc2_ = 0;
            }
            _loc3_ = (_loc2_ >= 10 ? "" : "0") + _loc2_;
            _loc1_ = this._currentTime % 60;
            if(_loc1_ < 0)
            {
                _loc1_ = 0;
            }
            _loc4_ = (_loc1_ >= 10 ? "" : "0") + _loc1_;
            return _loc3_ + ":" + _loc4_;
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            var _loc2_:PartySlotButton = null;
            if(currentElement != null)
            {
                _loc2_ = currentElement as PartySlotButton;
                if(_loc2_ != null)
                {
                    _loc2_.handleGamePadB();
                }
            }
        }
        
        protected function handleButtonEvent(param1:ButtonEvent) : void
        {
            var _loc2_:PartySlotButton = null;
            var _loc3_:PartySlotButton = null;
            var _loc4_:int = 0;
            if(bOpen)
            {
                if(param1.currentTarget is PartySlotButton)
                {
                    _loc2_ = param1.currentTarget as PartySlotButton;
                    currentElement = param1.currentTarget as PartySlotButton;
                    if(_loc2_.bIsOccupied)
                    {
                        if(!_loc2_.activeList.visible)
                        {
                            _loc2_.openList();
                            _loc4_ = 1;
                            while(_loc4_ < this.MAX_SLOTS)
                            {
                                _loc3_ = this["squadMember" + _loc4_];
                                if(_loc3_ != _loc2_ && _loc3_.activeList.bOpen)
                                {
                                    _loc3_.closeList();
                                }
                                _loc4_++;
                            }
                        }
                    }
                    else
                    {
                        ExternalInterface.call("Callback_InviteFriend");
                        if(!bManagerUsingGamepad)
                        {
                            (param1.currentTarget as PartySlotButton).focused = 0;
                        }
                    }
                }
            }
        }
        
        private function createParty() : *
        {
            ExternalInterface.call("Callback_CreateParty");
        }
        
        private function leaveParty(param1:ButtonEvent) : void
        {
            if(bOpen)
            {
                ExternalInterface.call("Callback_LeaveParty");
            }
        }
        
        private function readyUp(param1:ButtonEvent) : void
        {
            if(bOpen)
            {
                this.bReady = !this.bReady;
                this.readyButton.focused = 0;
                ExternalInterface.call("Callback_ReadyClicked",this.bReady);
            }
        }
    }
}
