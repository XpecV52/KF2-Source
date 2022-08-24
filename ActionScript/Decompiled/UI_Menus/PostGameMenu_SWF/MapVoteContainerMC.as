package
{
    import tripwire.containers.postGame.MapVoteContainer;
    
    public dynamic class MapVoteContainerMC extends MapVoteContainer
    {
         
        
        public function MapVoteContainerMC()
        {
            super();
            this.__setProp_currentVotesList_MapVoteContainerMC_topVoteList_0();
            this.__setProp_mapVoteList_MapVoteContainerMC_scrollingList_0();
        }
        
        function __setProp_currentVotesList_MapVoteContainerMC_topVoteList_0() : *
        {
            try
            {
                currentVotesList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            currentVotesList.enabled = true;
            currentVotesList.enableInitCallback = false;
            currentVotesList.focusable = false;
            currentVotesList.itemRendererName = "";
            currentVotesList.itemRendererInstanceName = "mapVote_";
            currentVotesList.margin = 0;
            currentVotesList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            currentVotesList.rowHeight = 0;
            currentVotesList.scrollBar = "";
            currentVotesList.visible = true;
            currentVotesList.wrapping = "stick";
            try
            {
                currentVotesList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_mapVoteList_MapVoteContainerMC_scrollingList_0() : *
        {
            try
            {
                mapVoteList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            mapVoteList.enabled = true;
            mapVoteList.enableInitCallback = false;
            mapVoteList.focusable = true;
            mapVoteList.itemRendererName = "";
            mapVoteList.itemRendererInstanceName = "mapChoice_";
            mapVoteList.margin = 0;
            mapVoteList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            mapVoteList.rowHeight = 0;
            mapVoteList.scrollBar = "scollBar";
            mapVoteList.visible = true;
            mapVoteList.wrapping = "stick";
            try
            {
                mapVoteList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
