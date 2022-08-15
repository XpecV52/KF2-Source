package
{
    import tripwire.menus.OptionsControlsMenu;
    
    public dynamic class BindingsContainerMC extends OptionsControlsMenu
    {
         
        
        public function BindingsContainerMC()
        {
            super();
            this.__setProp_tabButtonBar_BindingsContainerMC_Tabs_0();
            this.__setProp_closeButton_BindingsContainerMC_header_0();
        }
        
        function __setProp_tabButtonBar_BindingsContainerMC_Tabs_0() : *
        {
            try
            {
                tabButtonBar["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            tabButtonBar.autoSize = "none";
            tabButtonBar.buttonWidth = 0;
            tabButtonBar.direction = "horizontal";
            tabButtonBar.enabled = true;
            tabButtonBar.enableInitCallback = false;
            tabButtonBar.focusable = true;
            tabButtonBar.itemRendererName = "$TabButton";
            tabButtonBar.spacing = 0;
            tabButtonBar.visible = true;
            try
            {
                tabButtonBar["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_closeButton_BindingsContainerMC_header_0() : *
        {
            try
            {
                closeButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            closeButton.autoRepeat = false;
            closeButton.autoSize = "none";
            closeButton.data = "";
            closeButton.enabled = true;
            closeButton.enableInitCallback = false;
            closeButton.focusable = true;
            closeButton.label = "SHENANIGANS";
            closeButton.selected = false;
            closeButton.toggle = false;
            closeButton.visible = true;
            try
            {
                closeButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
