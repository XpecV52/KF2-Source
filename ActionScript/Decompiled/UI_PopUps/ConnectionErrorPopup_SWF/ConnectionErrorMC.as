package
{
    import tripwire.popups.ConnectionErrorPopup;
    
    public dynamic class ConnectionErrorMC extends ConnectionErrorPopup
    {
         
        
        public function ConnectionErrorMC()
        {
            super();
            this.__setProp_promptsContainer_ConnectionErrorMC_Controller_0();
            this.__setProp_AcceptButton_ConnectionErrorMC_AcceptButton_0();
        }
        
        function __setProp_promptsContainer_ConnectionErrorMC_Controller_0() : *
        {
            try
            {
                promptsContainer["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            promptsContainer.bUseWidthForBoundry = true;
            promptsContainer.enabled = true;
            promptsContainer.enableInitCallback = false;
            promptsContainer.promptSpacing = 32;
            promptsContainer.visible = true;
            try
            {
                promptsContainer["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_AcceptButton_ConnectionErrorMC_AcceptButton_0() : *
        {
            try
            {
                AcceptButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            AcceptButton.autoRepeat = false;
            AcceptButton.autoSize = "left";
            AcceptButton.data = "";
            AcceptButton.enabled = true;
            AcceptButton.enableInitCallback = false;
            AcceptButton.focusable = false;
            AcceptButton.label = "<<BACK NOW";
            AcceptButton.selected = false;
            AcceptButton.toggle = false;
            AcceptButton.visible = true;
            try
            {
                AcceptButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
