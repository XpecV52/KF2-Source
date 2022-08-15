package
{
    import tripwire.menus.OptionsSelectionMenu;
    
    public dynamic class OptionsSelectionMenu extends tripwire.menus.OptionsSelectionMenu
    {
         
        
        public function OptionsSelectionMenu()
        {
            super();
            this.__setProp_buttonBar_optionsSelectionMenuMC_Layer1_0();
        }
        
        function __setProp_buttonBar_optionsSelectionMenuMC_Layer1_0() : *
        {
            try
            {
                buttonBar["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            buttonBar.autoSize = "none";
            buttonBar.buttonWidth = 0;
            buttonBar.direction = "vertical";
            buttonBar.enabled = true;
            buttonBar.enableInitCallback = false;
            buttonBar.focusable = true;
            buttonBar.itemRendererName = "TitleButtonMC";
            buttonBar.spacing = 0;
            buttonBar.visible = true;
            try
            {
                buttonBar["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
