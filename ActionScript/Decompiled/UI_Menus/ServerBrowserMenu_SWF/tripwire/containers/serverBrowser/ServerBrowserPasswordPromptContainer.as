package tripwire.containers.serverBrowser
{
    import flash.events.KeyboardEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.Button;
    import scaleform.clik.controls.TextInput;
    import scaleform.clik.events.ButtonEvent;
    import tripwire.containers.TripContainer;
    
    public class ServerBrowserPasswordPromptContainer extends TripContainer
    {
         
        
        public var passwordText:TextField;
        
        public var passwordInputText:TextInput;
        
        public var confirmButton:Button;
        
        public var cancelButton:Button;
        
        public function ServerBrowserPasswordPromptContainer()
        {
            super();
            visible = false;
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.passwordText.text = !!param1.passwordPrompt ? param1.passwordPrompt : "";
                this.confirmButton.label = !!param1.join ? param1.join : "";
                this.cancelButton.label = !!param1.cancel ? param1.cancel : "";
            }
        }
        
        override public function openContainer() : void
        {
            super.openContainer();
            visible = true;
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            this.passwordInputText.text = "";
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            this.passwordInputText.addEventListener(KeyboardEvent.KEY_UP,this.checkInputKeyForAttemptPassword,false,0,true);
            this.confirmButton.addEventListener(ButtonEvent.CLICK,this.onConfirm,false,0,true);
            this.cancelButton.addEventListener(ButtonEvent.CLICK,this.onCancel,false,0,true);
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            this.passwordInputText.removeEventListener(KeyboardEvent.KEY_UP,this.checkInputKeyForAttemptPassword);
            this.confirmButton.removeEventListener(ButtonEvent.CLICK,this.onConfirm);
            this.cancelButton.removeEventListener(ButtonEvent.CLICK,this.onCancel);
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
        
        public function onCancel(param1:ButtonEvent) : void
        {
            this.closeContainer();
        }
        
        protected function attemptPassword() : void
        {
            ExternalInterface.call("CallBack_ServerJoinGameWithPassword",this.passwordInputText.text);
            this.closeContainer();
        }
    }
}
