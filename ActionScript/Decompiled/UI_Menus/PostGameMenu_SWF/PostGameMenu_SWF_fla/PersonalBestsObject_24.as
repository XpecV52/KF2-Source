package PostGameMenu_SWF_fla
{
    import flash.display.MovieClip;
    
    public dynamic class PersonalBestsObject_24 extends MovieClip
    {
         
        
        public var awardList:TeamAwardsScrollList;
        
        public var personalBest_1:PersonalBest;
        
        public var personalBest_2:PersonalBest;
        
        public var personalBest_3:PersonalBest;
        
        public var personalBest_4:PersonalBest;
        
        public var personalBest_5:PersonalBest;
        
        public var personalBest_6:PersonalBest;
        
        public var personalBest_7:PersonalBest;
        
        public var personalBest_8:PersonalBest;
        
        public function PersonalBestsObject_24()
        {
            super();
            this.__setProp_awardList_PersonalBestsObject_NoAwards_0();
        }
        
        function __setProp_awardList_PersonalBestsObject_NoAwards_0() : *
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
            this.awardList.itemRendererInstanceName = "personalBest_";
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
