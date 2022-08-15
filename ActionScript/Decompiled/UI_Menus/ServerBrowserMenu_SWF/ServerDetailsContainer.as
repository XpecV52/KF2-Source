package
{
    import tripwire.containers.serverBrowser.ServerDetailsContainer;
    
    public dynamic class ServerDetailsContainer extends tripwire.containers.serverBrowser.ServerDetailsContainer
    {
         
        
        public function ServerDetailsContainer()
        {
            super();
            this.__setProp_favoriteButton_ServerDetailsContainer_favoritebutton_0();
            this.__setProp_playerList_ServerDetailsContainer_playerlist_0();
        }
        
        function __setProp_favoriteButton_ServerDetailsContainer_favoritebutton_0() : *
        {
            try
            {
                favoriteButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            favoriteButton.autoRepeat = false;
            favoriteButton.autoSize = "none";
            favoriteButton.clickSoundEffect = "FavoriteButton_Select";
            favoriteButton.data = "";
            favoriteButton.enabled = true;
            favoriteButton.enableInitCallback = false;
            favoriteButton.focusable = true;
            favoriteButton.label = "";
            favoriteButton.selected = false;
            favoriteButton.toggle = false;
            favoriteButton.visible = true;
            try
            {
                favoriteButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_playerList_ServerDetailsContainer_playerlist_0() : *
        {
            try
            {
                playerList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            playerList.enabled = true;
            playerList.enableInitCallback = false;
            playerList.focusable = false;
            playerList.itemRendererName = "PlayerItemRenderer";
            playerList.itemRendererInstanceName = "";
            playerList.margin = 0;
            playerList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            playerList.rowHeight = 0;
            playerList.scrollBar = "scrollBar";
            playerList.visible = true;
            playerList.wrapping = "normal";
            try
            {
                playerList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
