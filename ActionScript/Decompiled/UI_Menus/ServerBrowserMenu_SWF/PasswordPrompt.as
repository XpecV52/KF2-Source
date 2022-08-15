package
{
    import tripwire.containers.serverBrowser.ServerBrowserPasswordPromptContainer;
    
    public dynamic class PasswordPrompt extends ServerBrowserPasswordPromptContainer
    {
         
        
        public function PasswordPrompt()
        {
            super();
            addFrameScript(9,this.frame10,19,this.frame20,29,this.frame30,39,this.frame40);
            this.__setProp_passwordInputText_PasswordPromt_passwordBox_0();
            this.__setProp_confirmButton_PasswordPromt_AcceptButton_0();
            this.__setProp_cancelButton_PasswordPromt_AcceptButton_0();
        }
        
        function __setProp_passwordInputText_PasswordPromt_passwordBox_0() : *
        {
            try
            {
                passwordInputText["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            passwordInputText.actAsButton = false;
            passwordInputText.defaultText = "";
            passwordInputText.displayAsPassword = true;
            passwordInputText.editable = true;
            passwordInputText.enabled = true;
            passwordInputText.enableInitCallback = false;
            passwordInputText.focusable = true;
            passwordInputText.maxChars = 0;
            passwordInputText.text = "";
            passwordInputText.visible = true;
            try
            {
                passwordInputText["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_confirmButton_PasswordPromt_AcceptButton_0() : *
        {
            try
            {
                confirmButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            confirmButton.autoRepeat = false;
            confirmButton.autoSize = "left";
            confirmButton.data = "";
            confirmButton.enabled = true;
            confirmButton.enableInitCallback = false;
            confirmButton.focusable = true;
            confirmButton.label = "Join Server";
            confirmButton.selected = false;
            confirmButton.toggle = false;
            confirmButton.visible = true;
            try
            {
                confirmButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_cancelButton_PasswordPromt_AcceptButton_0() : *
        {
            try
            {
                cancelButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            cancelButton.autoRepeat = false;
            cancelButton.autoSize = "left";
            cancelButton.data = "";
            cancelButton.enabled = true;
            cancelButton.enableInitCallback = false;
            cancelButton.focusable = true;
            cancelButton.label = "Cancel";
            cancelButton.selected = false;
            cancelButton.toggle = false;
            cancelButton.visible = true;
            try
            {
                cancelButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function frame10() : *
        {
            stop();
        }
        
        function frame20() : *
        {
            stop();
        }
        
        function frame30() : *
        {
            stop();
        }
        
        function frame40() : *
        {
            stop();
        }
    }
}
