package
{
    import flash.display.MovieClip;
    
    public dynamic class TopWeaponContainer extends MovieClip
    {
         
        
        public var topWeaponList:StatsScrollingList;
        
        public var topWeapon_1:TopWeapon;
        
        public var topWeapon_2:TopWeapon;
        
        public var topWeapon_3:TopWeapon;
        
        public function TopWeaponContainer()
        {
            super();
            this.__setProp_topWeaponList_TopWeaponContainer_ScrollingList_0();
        }
        
        function __setProp_topWeaponList_TopWeaponContainer_ScrollingList_0() : *
        {
            try
            {
                this.topWeaponList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.topWeaponList.enabled = true;
            this.topWeaponList.enableInitCallback = false;
            this.topWeaponList.focusable = true;
            this.topWeaponList.itemRendererName = "TopWeapon";
            this.topWeaponList.itemRendererInstanceName = "topWeapon_";
            this.topWeaponList.margin = 0;
            this.topWeaponList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            this.topWeaponList.rowHeight = 0;
            this.topWeaponList.scrollBar = "";
            this.topWeaponList.visible = true;
            this.topWeaponList.wrapping = "normal";
            try
            {
                this.topWeaponList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
