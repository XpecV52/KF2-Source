package
{
    import tripwire.widgets.ButtonPromptWidget;
    
    public dynamic class ButtonPromptWidget extends tripwire.widgets.ButtonPromptWidget
    {
         
        
        public function ButtonPromptWidget()
        {
            super();
            this.__setProp_promptDisplay_ButtonPromptWidget_Layer2_0();
        }
        
        function __setProp_promptDisplay_ButtonPromptWidget_Layer2_0() : *
        {
            try
            {
                promptDisplay["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            promptDisplay.bCenterAligned = false;
            promptDisplay.bUseWidthForBoundry = false;
            promptDisplay.enabled = true;
            promptDisplay.enableInitCallback = false;
            promptDisplay.promptSpacing = 120;
            promptDisplay.visible = true;
            try
            {
                promptDisplay["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
