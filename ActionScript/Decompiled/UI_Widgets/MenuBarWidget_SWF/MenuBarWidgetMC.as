package
{
    import tripwire.widgets.MenuBarWidget;
    
    public dynamic class MenuBarWidgetMC extends MenuBarWidget
    {
         
        
        public function MenuBarWidgetMC()
        {
            super();
            this.__setProp_menuButtonBar_MenuBarWidgetMC_ButtonBar_0();
        }
        
        function __setProp_menuButtonBar_MenuBarWidgetMC_ButtonBar_0() : *
        {
            try
            {
                menuButtonBar["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            menuButtonBar.autoSize = "none";
            menuButtonBar.buttonWidth = 0;
            menuButtonBar.direction = "horizontal";
            menuButtonBar.enabled = true;
            menuButtonBar.enableInitCallback = false;
            menuButtonBar.focusable = true;
            menuButtonBar.itemRendererName = "MenuBarButtonMC";
            menuButtonBar.spacing = 8;
            menuButtonBar.visible = true;
            try
            {
                menuButtonBar["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
