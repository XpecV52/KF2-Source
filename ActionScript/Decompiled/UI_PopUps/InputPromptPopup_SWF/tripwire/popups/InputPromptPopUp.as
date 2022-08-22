package tripwire.popups
{
    import com.greensock.events.TweenEvent;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.Button;
    import scaleform.clik.controls.TextInput;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.FocusManager;
    import tripwire.widgets.MultiPromptDisplay;
    
    public class InputPromptPopUp extends BasePopup
    {
         
        
        public var dialogText:TextField;
        
        public var playerInputText:TextInput;
        
        public var confirmButton:Button;
        
        public var cancelButton:Button;
        
        public var promptsContainer:MultiPromptDisplay;
        
        public function InputPromptPopUp()
        {
            super();
            defaultFirstElement = currentElement = this.confirmButton;
        }
        
        override public function setPopupText(param1:String, param2:String, param3:String, param4:String, param5:String) : *
        {
            var _loc6_:Array = new Array();
            this.dialogText.text = param1;
            this.confirmButton.label = param3;
            this.cancelButton.label = param4;
            _loc6_.push({
                "promptText":param3,
                "buttonDisplay":"xboxtypes_a"
            });
            _loc6_.push({
                "promptText":param4,
                "buttonDisplay":"xboxtypes_b"
            });
            this.promptsContainer.prompts = _loc6_;
            this.updateControllerVisibility(bManagerUsingGamepad);
        }
        
        override public function setTabIndex() : void
        {
            super.setTabIndex();
            this.playerInputText.tabIndex = 1;
            this.confirmButton.tabIndex = 2;
            this.cancelButton.tabIndex = 3;
        }
        
        override public function openContainer(param1:Boolean = true) : void
        {
            super.openContainer();
            visible = true;
        }
        
        override public function set descriptionText(param1:String) : void
        {
            if(this.dialogText != null)
            {
                this.dialogText.text = param1;
            }
        }
        
        override protected function onOpened(param1:TweenEvent = null) : void
        {
            FocusManager.setFocus(this.playerInputText.textField);
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.playerInputText.text = "";
            this.playerInputText.addEventListener(KeyboardEvent.KEY_UP,this.checkInputKeyForAttemptPassword,false,0,true);
            this.confirmButton.addEventListener(ButtonEvent.CLICK,this.onConfirm,false,0,true);
            this.cancelButton.addEventListener(ButtonEvent.CLICK,onClosePopup,false,0,true);
            this.updateControllerVisibility(bManagerUsingGamepad);
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            this.updateControllerVisibility(bManagerUsingGamepad);
        }
        
        public function updateControllerVisibility(param1:Boolean) : void
        {
            this.confirmButton.visible = !param1;
            this.cancelButton.visible = !param1;
            this.promptsContainer.visible = param1;
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            this.playerInputText.removeEventListener(KeyboardEvent.KEY_UP,this.checkInputKeyForAttemptPassword);
            this.confirmButton.removeEventListener(ButtonEvent.CLICK,this.onConfirm);
            this.cancelButton.removeEventListener(ButtonEvent.CLICK,onClosePopup);
        }
        
        protected function checkInputKeyForAttemptPassword(param1:KeyboardEvent) : void
        {
            var _loc2_:TextInput = param1.target.parent as TextInput;
            if(param1.keyCode == 13)
            {
                this.attemptPassword();
            }
        }
        
        public function onConfirm(param1:ButtonEvent) : void
        {
            this.attemptPassword();
        }
        
        protected function attemptPassword() : void
        {
            ExternalInterface.call("Callback_ClickedConfirm",this.playerInputText.text);
            closeContainer();
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            trace("BUTTON PRESSED: ");
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
                        trace("A PRESSED");
                        this.attemptPassword();
                        param1.handled;
                        break;
                    case NavigationCode.GAMEPAD_B:
                        trace("B PRESSED");
                        closePopup();
                        param1.handled;
                }
            }
        }
    }
}
