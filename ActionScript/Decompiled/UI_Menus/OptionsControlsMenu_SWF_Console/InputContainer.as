package
{
    import tripwire.containers.optionsControls.ControlsInputContainer;
    
    public dynamic class InputContainer extends ControlsInputContainer
    {
         
        
        public function InputContainer()
        {
            super();
            this.__setProp_defaultButton_InputContainerMC_defaultButton_0();
        }
        
        function __setProp_defaultButton_InputContainerMC_defaultButton_0() : *
        {
            try
            {
                defaultButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            defaultButton.autoRepeat = false;
            defaultButton.autoSize = "none";
            defaultButton.data = "";
            defaultButton.enabled = true;
            defaultButton.enableInitCallback = false;
            defaultButton.focusable = true;
            defaultButton.label = "";
            defaultButton.selected = false;
            defaultButton.toggle = false;
            defaultButton.visible = false;
            try
            {
                defaultButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
