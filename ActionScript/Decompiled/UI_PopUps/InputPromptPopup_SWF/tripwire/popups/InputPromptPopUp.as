package tripwire.popups
{
    import com.greensock.events.TweenEvent;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.Button;
    import scaleform.clik.controls.TextInput;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.gfx.FocusManager;
    
    public class InputPromptPopUp extends BasePopup
    {
         
        
        public var dialogText:TextField;
        
        public var playerInputText:TextInput;
        
        public var confirmButton:Button;
        
        public var cancelButton:Button;
        
        public function InputPromptPopUp()
        {
            super();
        }
        
        override public function setPopupText(param1:String, param2:String, param3:String, param4:String, param5:String) : *
        {
            this.dialogText.text = param1;
            this.confirmButton.label = param3;
            this.cancelButton.label = param4;
        }
        
        override public function setTabIndex() : *
        {
            super.setTabIndex();
            this.playerInputText.tabIndex = 1;
            this.confirmButton.tabIndex = 2;
            this.cancelButton.tabIndex = 3;
        }
        
        override public function openContainer() : void
        {
            super.openContainer();
            visible = true;
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
    }
}
