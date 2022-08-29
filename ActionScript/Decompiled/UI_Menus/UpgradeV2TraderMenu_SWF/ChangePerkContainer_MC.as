package
{
    import tripwire.containers.trader.TraderPerkListContainer;
    
    public dynamic class ChangePerkContainer_MC extends TraderPerkListContainer
    {
         
        
        public function ChangePerkContainer_MC()
        {
            super();
            this.__setProp_perkList_ChangePerkContainer_MC_List_0();
        }
        
        function __setProp_perkList_ChangePerkContainer_MC_List_0() : *
        {
            try
            {
                perkList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            perkList.enabled = true;
            perkList.enableInitCallback = false;
            perkList.focusable = true;
            perkList.itemRendererName = "PerkItemRenderer";
            perkList.itemRendererInstanceName = "";
            perkList.margin = 0;
            perkList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            perkList.rowHeight = 0;
            perkList.scrollBar = "";
            perkList.visible = true;
            perkList.wrapping = "normal";
            try
            {
                perkList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
