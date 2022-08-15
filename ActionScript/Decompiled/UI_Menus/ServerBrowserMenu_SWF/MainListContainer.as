package
{
    import tripwire.containers.serverBrowser.ServerBrowserMainListContainer;
    
    public dynamic class MainListContainer extends ServerBrowserMainListContainer
    {
         
        
        public function MainListContainer()
        {
            super();
            this.__setProp_joinGameButton_MainListContainer_JoinButton_0();
            this.__setProp_spectateGameButton_MainListContainer_JoinButton_0();
            this.__setProp_detailsButton_MainListContainer_JoinButton_0();
            this.__setProp_backButton_MainListContainer_JoinButton_0();
            this.__setProp_searchBar_MainListContainer_searchBar_0();
            this.__setProp_serverScrollingList_MainListContainer_scrollingList_0();
        }
        
        function __setProp_joinGameButton_MainListContainer_JoinButton_0() : *
        {
            try
            {
                joinGameButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            joinGameButton.autoRepeat = false;
            joinGameButton.autoSize = "none";
            joinGameButton.data = "";
            joinGameButton.enabled = true;
            joinGameButton.enableInitCallback = false;
            joinGameButton.focusable = true;
            joinGameButton.label = "_JOIN";
            joinGameButton.selected = false;
            joinGameButton.toggle = false;
            joinGameButton.visible = true;
            try
            {
                joinGameButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_spectateGameButton_MainListContainer_JoinButton_0() : *
        {
            try
            {
                spectateGameButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            spectateGameButton.autoRepeat = false;
            spectateGameButton.autoSize = "none";
            spectateGameButton.data = "";
            spectateGameButton.enabled = true;
            spectateGameButton.enableInitCallback = false;
            spectateGameButton.focusable = true;
            spectateGameButton.label = "_SPECTATE";
            spectateGameButton.selected = false;
            spectateGameButton.toggle = false;
            spectateGameButton.visible = true;
            try
            {
                spectateGameButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_detailsButton_MainListContainer_JoinButton_0() : *
        {
            try
            {
                detailsButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            detailsButton.autoRepeat = false;
            detailsButton.autoSize = "none";
            detailsButton.data = "";
            detailsButton.enabled = true;
            detailsButton.enableInitCallback = false;
            detailsButton.focusable = true;
            detailsButton.label = "_DETAILS";
            detailsButton.selected = false;
            detailsButton.toggle = false;
            detailsButton.visible = true;
            try
            {
                detailsButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_backButton_MainListContainer_JoinButton_0() : *
        {
            try
            {
                backButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            backButton.autoRepeat = false;
            backButton.autoSize = "none";
            backButton.data = "";
            backButton.enabled = true;
            backButton.enableInitCallback = false;
            backButton.focusable = true;
            backButton.label = "_back";
            backButton.selected = false;
            backButton.toggle = false;
            backButton.visible = true;
            try
            {
                backButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_searchBar_MainListContainer_searchBar_0() : *
        {
            try
            {
                searchBar["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            searchBar.actAsButton = true;
            searchBar.defaultText = "";
            searchBar.displayAsPassword = false;
            searchBar.editable = true;
            searchBar.enabled = true;
            searchBar.enableInitCallback = false;
            searchBar.focusable = true;
            searchBar.maxChars = 0;
            searchBar.text = "";
            searchBar.visible = false;
            try
            {
                searchBar["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_serverScrollingList_MainListContainer_scrollingList_0() : *
        {
            try
            {
                serverScrollingList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            serverScrollingList.enabled = true;
            serverScrollingList.enableInitCallback = false;
            serverScrollingList.focusable = true;
            serverScrollingList.itemRendererName = "ServerItemRenderer";
            serverScrollingList.itemRendererInstanceName = "";
            serverScrollingList.margin = 0;
            serverScrollingList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            serverScrollingList.rowHeight = 0;
            serverScrollingList.scrollBar = "serverListScrollBar";
            serverScrollingList.visible = true;
            serverScrollingList.wrapping = "stick";
            try
            {
                serverScrollingList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
