package
{
    import tripwire.containers.optionsControls.ControllerPresetsContainer;
    
    public dynamic class ControllerPresetsContainer extends tripwire.containers.optionsControls.ControllerPresetsContainer
    {
         
        
        public function ControllerPresetsContainer()
        {
            super();
            this.__setProp_defaultButton_ControllerPresetsContainer_ControllerImage_0();
        }
        
        function __setProp_defaultButton_ControllerPresetsContainer_ControllerImage_0() : *
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
