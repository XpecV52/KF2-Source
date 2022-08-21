package
{
    import tripwire.widgets.Scoreboard_VersusWidget;
    
    public dynamic class VersusScoreboard extends Scoreboard_VersusWidget
    {
         
        
        public function VersusScoreboard()
        {
            super();
            this.__setProp_PlayerScrollingList_VersusScoreboard_playerlist_0();
        }
        
        function __setProp_PlayerScrollingList_VersusScoreboard_playerlist_0() : *
        {
            try
            {
                PlayerScrollingList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            PlayerScrollingList.enabled = true;
            PlayerScrollingList.enableInitCallback = false;
            PlayerScrollingList.focusable = false;
            PlayerScrollingList.itemRendererName = "";
            PlayerScrollingList.itemRendererInstanceName = "PlayerScore";
            PlayerScrollingList.margin = 10;
            PlayerScrollingList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            PlayerScrollingList.rowHeight = 0;
            PlayerScrollingList.scrollBar = "";
            PlayerScrollingList.visible = true;
            PlayerScrollingList.wrapping = "normal";
            try
            {
                PlayerScrollingList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
