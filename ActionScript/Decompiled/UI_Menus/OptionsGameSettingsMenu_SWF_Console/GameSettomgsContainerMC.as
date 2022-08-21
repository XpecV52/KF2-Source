package
{
    import tripwire.menus.OptionsGameSettingsMenu;
    
    public dynamic class GameSettomgsContainerMC extends OptionsGameSettingsMenu
    {
         
        
        public function GameSettomgsContainerMC()
        {
            super();
            this.__setProp_crosshairCheckBox_GameSettomgsContainerMC_test_0();
            this.__setProp_killTickerCheckBox_GameSettomgsContainerMC_test_0();
            this.__setProp_closeButton_GameSettomgsContainerMC_header_0();
        }
        
        function __setProp_crosshairCheckBox_GameSettomgsContainerMC_test_0() : *
        {
            try
            {
                crosshairCheckBox["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            crosshairCheckBox.autoSize = "none";
            crosshairCheckBox.data = "";
            crosshairCheckBox.enabled = true;
            crosshairCheckBox.enableInitCallback = false;
            crosshairCheckBox.focusable = true;
            crosshairCheckBox.label = "Music Vocals";
            crosshairCheckBox.selected = false;
            crosshairCheckBox.visible = true;
            try
            {
                crosshairCheckBox["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_killTickerCheckBox_GameSettomgsContainerMC_test_0() : *
        {
            try
            {
                killTickerCheckBox["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            killTickerCheckBox.autoSize = "none";
            killTickerCheckBox.data = "";
            killTickerCheckBox.enabled = true;
            killTickerCheckBox.enableInitCallback = false;
            killTickerCheckBox.focusable = true;
            killTickerCheckBox.label = "Music Vocals";
            killTickerCheckBox.selected = false;
            killTickerCheckBox.visible = true;
            try
            {
                killTickerCheckBox["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_closeButton_GameSettomgsContainerMC_header_0() : *
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
