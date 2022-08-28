package
{
    import tripwire.containers.StartFindGameContainer;
    
    public dynamic class FindGameContainerMC extends StartFindGameContainer
    {
         
        
        public function FindGameContainerMC()
        {
            super();
            this.__setProp_matchMakingButton_FindGameContainerMC_Buttons_0();
            this.__setProp_serverBrowserButton_FindGameContainerMC_Buttons_0();
            this.__setProp_soloOfflineButton_FindGameContainerMC_Buttons_0();
            this.__setProp_tutorialButton_FindGameContainerMC_Buttons_0();
            this.__setProp_newsButton_FindGameContainerMC_Buttons_0();
        }
        
        function __setProp_matchMakingButton_FindGameContainerMC_Buttons_0() : *
        {
            try
            {
                matchMakingButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            matchMakingButton.autoRepeat = false;
            matchMakingButton.autoSize = "none";
            matchMakingButton.data = "";
            matchMakingButton.enabled = true;
            matchMakingButton.enableInitCallback = true;
            matchMakingButton.focusable = true;
            matchMakingButton.label = "text";
            matchMakingButton.selected = false;
            matchMakingButton.toggle = false;
            matchMakingButton.visible = true;
            try
            {
                matchMakingButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_serverBrowserButton_FindGameContainerMC_Buttons_0() : *
        {
            try
            {
                serverBrowserButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            serverBrowserButton.autoRepeat = false;
            serverBrowserButton.autoSize = "none";
            serverBrowserButton.data = "";
            serverBrowserButton.enabled = true;
            serverBrowserButton.enableInitCallback = true;
            serverBrowserButton.focusable = true;
            serverBrowserButton.label = "text";
            serverBrowserButton.selected = false;
            serverBrowserButton.toggle = false;
            serverBrowserButton.visible = true;
            try
            {
                serverBrowserButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_soloOfflineButton_FindGameContainerMC_Buttons_0() : *
        {
            try
            {
                soloOfflineButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            soloOfflineButton.autoRepeat = false;
            soloOfflineButton.autoSize = "none";
            soloOfflineButton.data = "";
            soloOfflineButton.enabled = true;
            soloOfflineButton.enableInitCallback = true;
            soloOfflineButton.focusable = true;
            soloOfflineButton.label = "text";
            soloOfflineButton.selected = false;
            soloOfflineButton.toggle = false;
            soloOfflineButton.visible = true;
            try
            {
                soloOfflineButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_tutorialButton_FindGameContainerMC_Buttons_0() : *
        {
            try
            {
                tutorialButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            tutorialButton.autoRepeat = false;
            tutorialButton.autoSize = "none";
            tutorialButton.data = "";
            tutorialButton.enabled = true;
            tutorialButton.enableInitCallback = true;
            tutorialButton.focusable = true;
            tutorialButton.label = "text";
            tutorialButton.selected = false;
            tutorialButton.toggle = false;
            tutorialButton.visible = true;
            try
            {
                tutorialButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_newsButton_FindGameContainerMC_Buttons_0() : *
        {
            try
            {
                newsButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            newsButton.autoRepeat = false;
            newsButton.autoSize = "none";
            newsButton.data = "";
            newsButton.enabled = true;
            newsButton.enableInitCallback = true;
            newsButton.focusable = true;
            newsButton.label = "M_NEWS_M";
            newsButton.selected = false;
            newsButton.toggle = false;
            newsButton.visible = true;
            try
            {
                newsButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
