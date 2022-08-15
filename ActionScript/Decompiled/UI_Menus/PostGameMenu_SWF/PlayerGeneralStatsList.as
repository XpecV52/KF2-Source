package
{
    import flash.display.MovieClip;
    
    public dynamic class PlayerGeneralStatsList extends MovieClip
    {
         
        
        public var playerGeneralStatsList:StatsScrollingList;
        
        public var playerStatRenderer_1:PlayerStat;
        
        public var playerStatRenderer_2:PlayerStat;
        
        public var playerStatRenderer_3:PlayerStat;
        
        public var playerStatRenderer_4:PlayerStat;
        
        public var playerStatRenderer_5:PlayerStat;
        
        public var playerStatRenderer_6:PlayerStat;
        
        public function PlayerGeneralStatsList()
        {
            super();
            this.__setProp_playerGeneralStatsList_PlayerGeneralStatsList_Layer1_0();
        }
        
        function __setProp_playerGeneralStatsList_PlayerGeneralStatsList_Layer1_0() : *
        {
            try
            {
                this.playerGeneralStatsList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.playerGeneralStatsList.enabled = true;
            this.playerGeneralStatsList.enableInitCallback = false;
            this.playerGeneralStatsList.focusable = true;
            this.playerGeneralStatsList.itemRendererName = "PlayerStat";
            this.playerGeneralStatsList.itemRendererInstanceName = "playerStatRenderer_";
            this.playerGeneralStatsList.margin = 0;
            this.playerGeneralStatsList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            this.playerGeneralStatsList.rowHeight = 0;
            this.playerGeneralStatsList.scrollBar = "";
            this.playerGeneralStatsList.visible = true;
            this.playerGeneralStatsList.wrapping = "normal";
            try
            {
                this.playerGeneralStatsList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
