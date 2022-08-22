package tripwire.widgets
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import flash.utils.Timer;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.managers.FocusHandler;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.Extensions;
    import scaleform.gfx.FocusManager;
    import scaleform.gfx.TextFieldEx;
    import tripwire.containers.NotificationContainer;
    import tripwire.containers.TripContainer;
    import tripwire.controls.PartySlotButton;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripScrollingList;
    import tripwire.managers.MenuManager;
    
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
        
        public var optionsList0:TripScrollingList;
        
        public var optionsList1:TripScrollingList;
        
        public var optionsList2:TripScrollingList;
        
        public var optionsList3:TripScrollingList;
        
        public var optionsList4:TripScrollingList;
        
        public var optionsList5:TripScrollingList;
        
        public var headerIcon:MovieClip;
        
        public var controllerIcon:MovieClip;
        
        public var startIcon:MovieClip;
        
        public var readyArrows:MovieClip;
        
        public var createPartyButton:TripButton;
        
        public var leaveButton:TripButton;
        
        public var readyButton:TripButton;
        
        public var ChatBoxWidget:PlayerChatWidget;
        
        public var bReady:Boolean;
        
        public var bFinalCount:Boolean;
        
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
        
        public var countdownSoundEffect:String = "PARTYWIDGET_COUNTDOWN";
        
        public var readySoundEffect:String = "PARTYWIDGET_READYUP_BUTTON_CLICK";
        
        public var Overlay_mc:MovieClip;
        
        public var promptsDisplay:MultiPromptDisplay;
        
        public var promptsBG:MovieClip;
        
        public var _backPromptString:String;
        
        public var _selectPromptString:String;
        
        public function PartyWidget()
        {
            super();
            this.matchStartContainer.messageTextField.visible = false;
            this.matchStartContainer.timeTextField.visible = false;
            this.matchStartContainer.BlackBG.visible = false;
            this._deployTimer = new Timer(1000);
            this._deployTimer.addEventListener(TimerEvent.TIMER,this.countdownTimer,false,0,true);
            this._deployTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.stopCountdown,false,0,true);
            if(this._bInParty)
            {
                defaultFirstElement = currentElement = this.squadMember0;
            }
            else
            {
                defaultFirstElement = currentElement = this.createPartyButton;
            }
            this.setTabIndex();
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
        
        public function get backPromptString() : String
        {
            return this._backPromptString;
        }
        
        public function set backPromptString(param1:String) : void
        {
            this._backPromptString = param1;
            this.updatePrompts();
        }
        
        public function get selectPromptString() : String
        {
            return this._selectPromptString;
        }
        
        public function set selectPromptString(param1:String) : void
        {
            this._selectPromptString = param1;
            this.updatePrompts();
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
            this.controllerIcon.visible = false;
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
            this.readyArrows.mouseEnabled = false;
            this.readyArrows.mouseChildren = false;
            this.deselectContainer();
            if(MenuManager.manager)
            {
                MenuManager.manager.setFocusBackToMenu(true);
            }
        }
        
        public function updatePrompts() : *
        {
            var _loc1_:Array = new Array();
            _loc1_.push({
                "promptText":this._selectPromptString,
                "buttonDisplay":"xboxtypes_a"
            });
            _loc1_.push({
                "promptText":this._backPromptString,
                "buttonDisplay":"xboxtypes_b"
            });
            this.promptsDisplay.prompts = _loc1_;
            this.promptsDisplay.setPromptAlpha("xboxtypes_a",1);
            this.promptsDisplay.setPromptAlpha("xboxtypes_b",1);
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
            this.headerIcon.visible = true;
            this.startIcon.visible = bManagerUsingGamepad && this.readyButton.visible;
            this.readyArrows.visible = !bManagerUsingGamepad && this.readyButton.visible;
            if(!bManagerUsingGamepad)
            {
                this.readyButton.focused = 0;
                this.leaveButton.focused = 0;
                this.createPartyButton.focused = 0;
            }
            this.readyButton.focusable = bManagerUsingGamepad;
            this.leaveButton.focusable = bManagerUsingGamepad;
            this.createPartyButton.focusable = bManagerUsingGamepad;
        }
        
        public function set bInParty(param1:Boolean) : void
        {
            var _loc2_:PartySlotButton = null;
            var _loc3_:int = 0;
            if(this._bInParty != param1)
            {
                this.setTabIndex();
            }
            else if(!this._bInitialPartySet)
            {
                this._bInitialPartySet = true;
            }
            this._bInParty = param1;
            if(param1)
            {
                this.createPartyButton.visible = !param1;
            }
            _loc2_ = this["squadMember" + _loc3_];
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
            var _loc6_:TripScrollingList = this["optionsList" + param1];
            if(!this.bListsInit)
            {
                _loc5_.slotIndex = param1;
                _loc5_.optionsList = _loc6_;
                _loc6_.visible = false;
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
            this.readyArrows.visible = !bManagerUsingGamepad ? Boolean(param1) : false;
            if(!param1 && this.startIcon.visible)
            {
                this.startIcon.visible = false;
            }
            this.matchStartContainer.visible = param1;
        }
        
        public function set partyButtonVisible(param1:Boolean) : void
        {
            if(this.createPartyButton.visible == param1)
            {
                return;
            }
            if(!param1 && this.createPartyButton.hasFocus && bSelected)
            {
                FocusHandler.getInstance().setFocus(this.squadMember0);
                if(currentElement == this.createPartyButton)
                {
                    defaultFirstElement = currentElement = this.squadMember0;
                }
            }
            this.createPartyButton.visible = param1;
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
            if(this.Overlay_mc)
            {
                TweenMax.killTweensOf(this.Overlay_mc);
                TweenMax.to(this.Overlay_mc,8,{
                    "autoAlpha":1,
                    "ease":Cubic.easeOut,
                    "useFrames":true
                });
            }
            if(this.promptsDisplay && bManagerUsingGamepad)
            {
                this.promptsDisplay.visible = true;
            }
            if(MenuManager.manager && !MenuManager.manager.bPartyWidgetFocused)
            {
                this.deselectContainer();
            }
            if(stage != null)
            {
                stage.dispatchEvent(new Event(MenuManager.PARTYFOCUS_CHANGED));
            }
        }
        
        override public function deselectContainer() : void
        {
            var _loc2_:TripScrollingList = null;
            super.deselectContainer();
            this.updateControllerIconVisibility();
            var _loc1_:Number = 0;
            while(_loc1_ < 6)
            {
                _loc2_ = this["optionsList" + _loc1_];
                if(_loc2_.bOpen)
                {
                    _loc2_.bOpen = false;
                }
                _loc1_++;
            }
            if(this.Overlay_mc)
            {
                TweenMax.to(this.Overlay_mc,8,{
                    "autoAlpha":0,
                    "ease":Cubic.easeOut,
                    "useFrames":true
                });
            }
            if(this.promptsDisplay)
            {
                this.promptsDisplay.visible = false;
            }
            if(stage != null)
            {
                stage.dispatchEvent(new Event(MenuManager.PARTYFOCUS_CHANGED));
            }
        }
        
        public function startCountdown(param1:int, param2:Boolean) : void
        {
            this.bFinalCount = param2;
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
            this.bFinalCount = false;
            this._deployTimer.stop();
        }
        
        private function countdownTimer(param1:TimerEvent) : void
        {
            this.bFinalCount = this._currentTime == 0 ? false : Boolean(this.bFinalCount);
            this._currentTime = Math.max(this._currentTime - 1,0);
            this.setDeployTime();
        }
        
        private function setDeployTime(param1:Boolean = false) : *
        {
            if(Extensions.gfxProcessSound != null && this.bFinalCount == true)
            {
                Extensions.gfxProcessSound(this,"UI",this.countdownSoundEffect);
            }
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
            var _loc3_:Boolean = false;
            if(currentElement != null)
            {
                _loc2_ = currentElement as PartySlotButton;
                if(_loc2_ != null)
                {
                    _loc3_ = _loc2_.handleGamePadB();
                }
            }
            MenuManager.manager.setFocusBackToMenu();
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
                if(Extensions.gfxProcessSound != null && enabled == true && this.bReady == true)
                {
                    Extensions.gfxProcessSound(this,"UI",this.readySoundEffect);
                }
            }
        }
    }
}
