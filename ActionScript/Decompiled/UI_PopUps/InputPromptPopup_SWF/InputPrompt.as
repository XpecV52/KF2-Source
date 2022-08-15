package
{
    import tripwire.popups.InputPromptPopUp;
    
    public dynamic class InputPrompt extends InputPromptPopUp
    {
         
        
        public function InputPrompt()
        {
            super();
            addFrameScript(9,this.frame10,19,this.frame20,29,this.frame30,39,this.frame40);
            this.__setProp_playerInputText_InputPrompt_passwordBox_0();
            this.__setProp_confirmButton_InputPrompt_AcceptButton_0();
            this.__setProp_cancelButton_InputPrompt_AcceptButton_0();
        }
        
        function __setProp_playerInputText_InputPrompt_passwordBox_0() : *
        {
            try
            {
                playerInputText["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            playerInputText.actAsButton = false;
            playerInputText.defaultText = "";
            playerInputText.displayAsPassword = true;
            playerInputText.editable = true;
            playerInputText.enabled = true;
            playerInputText.enableInitCallback = false;
            playerInputText.focusable = true;
            playerInputText.maxChars = 0;
            playerInputText.text = "";
            playerInputText.visible = true;
            try
            {
                playerInputText["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_confirmButton_InputPrompt_AcceptButton_0() : *
        {
            try
            {
                confirmButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            confirmButton.autoRepeat = false;
            confirmButton.autoSize = "none";
            confirmButton.data = "";
            confirmButton.enabled = true;
            confirmButton.enableInitCallback = false;
            confirmButton.focusable = true;
            confirmButton.label = "confirmButton";
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
        
        function __setProp_cancelButton_InputPrompt_AcceptButton_0() : *
        {
            try
            {
                cancelButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            cancelButton.autoRepeat = false;
            cancelButton.autoSize = "none";
            cancelButton.data = "";
            cancelButton.enabled = true;
            cancelButton.enableInitCallback = false;
            cancelButton.focusable = true;
            cancelButton.label = "cancelButton";
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
