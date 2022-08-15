package
{
    import tripwire.menus.ServerBrowserMenu;
    
    public dynamic class ServerBrowserMenu extends tripwire.menus.ServerBrowserMenu
    {
         
        
        public function ServerBrowserMenu()
        {
            super();
            this.__setProp_tabButtonBar_ServerBrowserMenu_buttonBar_0();
            this.__setProp_serverDetailsContainer_ServerBrowserMenu_ServerDetails_0();
            this.__setProp_serverBrowserHeader_ServerBrowserMenu_Header_0();
        }
        
        function __setProp_tabButtonBar_ServerBrowserMenu_buttonBar_0() : *
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
            tabButtonBar.itemRendererName = "ServerBrowserTabButton";
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
        
        function __setProp_serverDetailsContainer_ServerBrowserMenu_ServerDetails_0() : *
        {
            try
            {
                serverDetailsContainer["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            serverDetailsContainer.enabled = true;
            serverDetailsContainer.enableInitCallback = true;
            serverDetailsContainer.visible = true;
            try
            {
                serverDetailsContainer["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_serverBrowserHeader_ServerBrowserMenu_Header_0() : *
        {
            try
            {
                serverBrowserHeader["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            serverBrowserHeader.enabled = true;
            serverBrowserHeader.enableInitCallback = true;
            serverBrowserHeader.visible = true;
            try
            {
                serverBrowserHeader["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
