package tripwire.popups
{
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.managers.FocusHandler;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.FocusManager;
    import scaleform.gfx.TextFieldEx;
    import tripwire.controls.TripButton;
    import tripwire.widgets.MultiPromptDisplay;
    
    public class ConfirmationPopup extends BasePopup
    {
         
        
        public var leftButton:TripButton;
        
        public var middleButton:TripButton;
        
        public var rightButton:TripButton;
        
        public var TitleTF:TextField;
        
        public var DescriptionTF:TextField;
        
        public var promptsContainer:MultiPromptDisplay;
        
        public function ConfirmationPopup()
        {
            super();
            enableInitCallback = true;
            defaultFirstElement = currentElement = this.leftButton;
            this.changeButtonPriority();
        }
        
        override public function set descriptionText(param1:String) : void
        {
            super.descriptionText = param1;
            this.DescriptionTF.text = param1;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.openPopup();
            TextFieldEx.setVerticalAlign(this.DescriptionTF,TextFieldEx.VALIGN_CENTER);
            this.leftButton.addEventListener(ButtonEvent.PRESS,this.onLeftOption,false,0,true);
            this.middleButton.addEventListener(ButtonEvent.PRESS,this.onMiddleOption,false,0,true);
            this.rightButton.addEventListener(ButtonEvent.PRESS,this.onRightOption,false,0,true);
            this.updateControllerVisibility(bManagerUsingGamepad);
        }
        
        override public function setTabIndex() : void
        {
            this.leftButton.tabIndex = 1;
            this.middleButton.tabIndex = 2;
            this.rightButton.tabIndex = 3;
            this.leftButton.preventAutosizing = true;
            this.middleButton.preventAutosizing = true;
            this.rightButton.preventAutosizing = true;
        }
        
        public function changeButtonPriority() : void
        {
            var _loc1_:* = new Object();
            _loc1_["xboxtypes_a"] = _loc1_["xboxtypes_a_o"] = 0;
            _loc1_["xboxtypes_x"] = _loc1_["xboxtypes_x_o"] = 1;
            _loc1_["xboxtypes_y"] = _loc1_["xboxtypes_y_o"] = 2;
            _loc1_["xboxtypes_b"] = _loc1_["xboxtypes_b_o"] = 3;
            _loc1_["xboxtypes_back"] = _loc1_["xboxtypes_back_o"] = 4;
            _loc1_["xboxtypes_start"] = _loc1_["xboxtypes_start_o"] = 5;
            _loc1_["xboxtypes_rightthumbstick"] = _loc1_["xboxtypes_rightthumbstick_o"] = 6;
            _loc1_["xboxtypes_leftthumbstick"] = _loc1_["xboxtypes_leftthumbstick_o"] = 7;
            _loc1_["xboxtypes_dpad_left"] = _loc1_["xboxtypes_dpad_left_o"] = 8;
            _loc1_["xboxtypes_dpad_down"] = _loc1_["xboxtypes_dpad_down_o"] = 9;
            _loc1_["xboxtypes_dpad_right"] = _loc1_["xboxtypes_dpad_right_o"] = 10;
            _loc1_["xboxtypes_dpad_up"] = _loc1_["xboxtypes_dpad_up_o"] = 11;
            _loc1_["xboxtypes_righttrigger"] = _loc1_["xboxtypes_righttrigger_o"] = 12;
            _loc1_["xboxtypes_lefttrigger"] = _loc1_["xboxtypes_lefttrigger_o"] = 13;
            _loc1_["xboxtypes_rightshoulder"] = _loc1_["xboxtypes_rightshoulder_o"] = 14;
            _loc1_["xboxtypes_leftshoulder"] = _loc1_["xboxtypes_leftshoulder_o"] = 15;
            this.promptsContainer.buttonPriority = _loc1_;
        }
        
        override public function openPopup() : void
        {
            super.openPopup();
            if(bManagerUsingGamepad)
            {
                FocusHandler.getInstance().setFocus(currentElement);
            }
            else
            {
                FocusManager.setFocus(null);
            }
            this.updateControllerVisibility(bManagerUsingGamepad);
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            this.updateControllerVisibility(bManagerUsingGamepad);
        }
        
        public function updateControllerVisibility(param1:Boolean) : void
        {
            this.leftButton.visible = this.leftButton.label != "" ? !param1 : false;
            this.middleButton.visible = this.middleButton.label != "" ? !param1 : false;
            this.rightButton.visible = this.rightButton.label != "" ? !param1 : false;
            this.promptsContainer.visible = param1;
        }
        
        private function onLeftOption(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_ClickedLeftOption");
        }
        
        private function onMiddleOption(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_ClickedMiddleOption");
        }
        
        private function onRightOption(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_ClickedRightOption");
        }
        
        override public function setPopupText(param1:String, param2:String, param3:String, param4:String, param5:String) : *
        {
            var _loc6_:Array = new Array();
            this.TitleTF.text = param1;
            this.DescriptionTF.text = param2;
            this.leftButton.label = param3;
            this.middleButton.label = param5;
            this.rightButton.label = param4;
            if(this.leftButton.label != "")
            {
                _loc6_.push({
                    "promptText":param3,
                    "buttonDisplay":"xboxtypes_a"
                });
            }
            if(this.middleButton.label != "")
            {
                _loc6_.push({
                    "promptText":param5,
                    "buttonDisplay":"xboxtypes_x"
                });
            }
            if(this.rightButton.label != "")
            {
                _loc6_.push({
                    "promptText":param4,
                    "buttonDisplay":"xboxtypes_b"
                });
            }
            this.promptsContainer.prompts = _loc6_;
            if(bManagerUsingGamepad)
            {
                this.promptsContainer.visible = true;
            }
            else
            {
                this.leftButton.visible = !(param3 == null || param3 == "");
                this.middleButton.visible = !(param5 == null || param5 == "");
                this.rightButton.visible = !(param4 == null || param4 == "");
            }
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
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_A:
                        if(this.leftButton.label != "")
                        {
                            ExternalInterface.call("Callback_ClickedLeftOption");
                            param1.handled;
                        }
                        break;
                    case NavigationCode.GAMEPAD_X:
                        if(this.middleButton.label != "")
                        {
                            ExternalInterface.call("Callback_ClickedMiddleOption");
                            param1.handled;
                        }
                        break;
                    case NavigationCode.GAMEPAD_B:
                        if(this.rightButton.label != "")
                        {
                            ExternalInterface.call("Callback_ClickedRightOption");
                            param1.handled;
                        }
                }
            }
        }
    }
}
