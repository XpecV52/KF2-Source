package
{
    import tripwire.popups.ConfirmationPopup;
    
    public dynamic class ConfirmationMC extends ConfirmationPopup
    {
         
        
        public function ConfirmationMC()
        {
            super();
            this.__setProp_promptsContainer_ConfirmationMC_Prompts_0();
            this.__setProp_middleButton_ConfirmationMC_SecondFunctionbutton_0();
            this.__setProp_leftButton_ConfirmationMC_AcceptButton_0();
            this.__setProp_rightButton_ConfirmationMC_AcceptButton_0();
        }
        
        function __setProp_promptsContainer_ConfirmationMC_Prompts_0() : *
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
        
        function __setProp_middleButton_ConfirmationMC_SecondFunctionbutton_0() : *
        {
            try
            {
                middleButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            middleButton.autoRepeat = false;
            middleButton.autoSize = "none";
            middleButton.data = "";
            middleButton.enabled = true;
            middleButton.enableInitCallback = false;
            middleButton.focusable = false;
            middleButton.label = "Middle Text";
            middleButton.selected = false;
            middleButton.toggle = false;
            middleButton.visible = true;
            try
            {
                middleButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_leftButton_ConfirmationMC_AcceptButton_0() : *
        {
            try
            {
                leftButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            leftButton.autoRepeat = false;
            leftButton.autoSize = "left";
            leftButton.data = "";
            leftButton.enabled = true;
            leftButton.enableInitCallback = false;
            leftButton.focusable = false;
            leftButton.label = "LeftText";
            leftButton.selected = false;
            leftButton.toggle = false;
            leftButton.visible = true;
            try
            {
                leftButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_rightButton_ConfirmationMC_AcceptButton_0() : *
        {
            try
            {
                rightButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            rightButton.autoRepeat = false;
            rightButton.autoSize = "none";
            rightButton.data = "";
            rightButton.enabled = true;
            rightButton.enableInitCallback = false;
            rightButton.focusable = false;
            rightButton.label = "Right Text";
            rightButton.selected = false;
            rightButton.toggle = false;
            rightButton.visible = true;
            try
            {
                rightButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
