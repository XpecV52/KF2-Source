package
{
    import tripwire.containers.optionsControls.ControlsBindingContainer;
    
    public dynamic class KeyBindingsContainer extends ControlsBindingContainer
    {
         
        
        public function KeyBindingsContainer()
        {
            super();
            this.__setProp_bindingSections_KeyBindingsContainerMC_Lists_0();
            this.__setProp_scrollBar_KeyBindingsContainerMC_Scrollbar_0();
            this.__setProp_resetButton_KeyBindingsContainerMC_Buttons_0();
        }
        
        function __setProp_bindingSections_KeyBindingsContainerMC_Lists_0() : *
        {
            try
            {
                bindingSections["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            bindingSections.enabled = true;
            bindingSections.enableInitCallback = false;
            bindingSections.focusable = true;
            bindingSections.itemRendererName = "";
            bindingSections.itemRendererInstanceName = "";
            bindingSections.margin = 0;
            bindingSections.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            bindingSections.rowHeight = 0;
            bindingSections.scrollBar = "scrollBar";
            bindingSections.visible = true;
            bindingSections.wrapping = "normal";
            try
            {
                bindingSections["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_scrollBar_KeyBindingsContainerMC_Scrollbar_0() : *
        {
            try
            {
                scrollBar["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            scrollBar.enabled = true;
            scrollBar.enableInitCallback = false;
            scrollBar.minThumbSize = 10;
            scrollBar.offsetBottom = 0;
            scrollBar.offsetTop = 0;
            scrollBar.scrollTarget = "bindingSections";
            scrollBar.trackMode = "scrollPage";
            scrollBar.visible = true;
            try
            {
                scrollBar["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_resetButton_KeyBindingsContainerMC_Buttons_0() : *
        {
            try
            {
                resetButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            resetButton.autoRepeat = false;
            resetButton.autoSize = "none";
            resetButton.data = "";
            resetButton.enabled = true;
            resetButton.enableInitCallback = false;
            resetButton.focusable = false;
            resetButton.label = "";
            resetButton.selected = false;
            resetButton.toggle = false;
            resetButton.visible = true;
            try
            {
                resetButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
