package
{
    import flash.display.MovieClip;
    
    public dynamic class TeamAwardsObject extends MovieClip
    {
         
        
        public var awardList:TeamAwardsScrollList;
        
        public var teamAward_1:TeamAward;
        
        public var teamAward_2:TeamAward;
        
        public var teamAward_3:TeamAward;
        
        public var teamAward_4:TeamAward;
        
        public var teamAward_5:TeamAward;
        
        public var teamAward_6:TeamAward;
        
        public var teamAward_7:TeamAward;
        
        public var teamAward_8:TeamAward;
        
        public function TeamAwardsObject()
        {
            super();
            this.__setProp_awardList_TeamAwardsObject_ListMC_0();
        }
        
        function __setProp_awardList_TeamAwardsObject_ListMC_0() : *
        {
            try
            {
                this.awardList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.awardList.enabled = true;
            this.awardList.enableInitCallback = false;
            this.awardList.focusable = true;
            this.awardList.itemRendererName = "";
            this.awardList.itemRendererInstanceName = "teamAward_";
            this.awardList.margin = 0;
            this.awardList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            this.awardList.rowHeight = 0;
            this.awardList.scrollBar = "";
            this.awardList.visible = true;
            this.awardList.wrapping = "stick";
            try
            {
                this.awardList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
