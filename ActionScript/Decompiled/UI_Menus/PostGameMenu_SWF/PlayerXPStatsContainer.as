package
{
    import tripwire.containers.postGame.PlayerXPStatsContainer;
    
    public dynamic class PlayerXPStatsContainer extends tripwire.containers.postGame.PlayerXPStatsContainer
    {
         
        
        public function PlayerXPStatsContainer()
        {
            super();
            this.__setProp_scrollBar_PlayerXPContainer_scrollBar_0();
            this.__setProp_perkXPList_PlayerXPContainer_TileList_0();
        }
        
        function __setProp_scrollBar_PlayerXPContainer_scrollBar_0() : *
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
            scrollBar.scrollTarget = "";
            scrollBar.trackMode = "scrollPage";
            scrollBar.visible = false;
            try
            {
                scrollBar["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_perkXPList_PlayerXPContainer_TileList_0() : *
        {
            try
            {
                perkXPList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            perkXPList.columnWidth = 0;
            perkXPList.direction = "horizontal";
            perkXPList.enabled = true;
            perkXPList.enableInitCallback = false;
            perkXPList.externalColumnCount = 0;
            perkXPList.focusable = true;
            perkXPList.itemRendererName = "PerkXPObject";
            perkXPList.itemRendererInstanceName = "perkXP";
            perkXPList.margin = 0;
            perkXPList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            perkXPList.rowHeight = 0;
            perkXPList.scrollBar = "scrollBar";
            perkXPList.visible = true;
            perkXPList.wrapping = "normal";
            try
            {
                perkXPList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
