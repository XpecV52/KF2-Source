package
{
    import tripwire.menus.DoshVaultMenu;
    
    public dynamic class DoshVaultMenu extends tripwire.menus.DoshVaultMenu
    {
         
        
        public function DoshVaultMenu()
        {
            super();
            this.__setProp_openCrateButton_DoshVaultMenu_details_0();
        }
        
        function __setProp_openCrateButton_DoshVaultMenu_details_0() : *
        {
            try
            {
                openCrateButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            openCrateButton.autoRepeat = false;
            openCrateButton.autoSize = "none";
            openCrateButton.data = "";
            openCrateButton.enabled = true;
            openCrateButton.enableInitCallback = false;
            openCrateButton.focusable = true;
            openCrateButton.label = "M_OPEN CRATE_M";
            openCrateButton.selected = false;
            openCrateButton.toggle = false;
            openCrateButton.visible = false;
            try
            {
                openCrateButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
