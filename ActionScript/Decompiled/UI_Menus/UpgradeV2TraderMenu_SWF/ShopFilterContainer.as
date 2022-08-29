package
{
    import tripwire.containers.trader.TraderFilterContainer;
    
    public dynamic class ShopFilterContainer extends TraderFilterContainer
    {
         
        
        public function ShopFilterContainer()
        {
            super();
            this.__setProp_tabBar_ShopFilterContainer_MC_Tabs_0();
            this.__setProp_filterButtonBar_ShopFilterContainer_MC_Layer2_0();
        }
        
        function __setProp_tabBar_ShopFilterContainer_MC_Tabs_0() : *
        {
            try
            {
                tabBar["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            tabBar.autoSize = "none";
            tabBar.buttonWidth = 0;
            tabBar.direction = "horizontal";
            tabBar.enabled = true;
            tabBar.enableInitCallback = false;
            tabBar.focusable = true;
            tabBar.itemRendererName = "ShopTab";
            tabBar.spacing = 0;
            tabBar.visible = true;
            try
            {
                tabBar["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_filterButtonBar_ShopFilterContainer_MC_Layer2_0() : *
        {
            try
            {
                filterButtonBar["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            filterButtonBar.autoSize = "none";
            filterButtonBar.buttonWidth = 0;
            filterButtonBar.direction = "horizontal";
            filterButtonBar.enabled = true;
            filterButtonBar.enableInitCallback = false;
            filterButtonBar.focusable = false;
            filterButtonBar.itemRendererName = "FilterButton";
            filterButtonBar.spacing = 0;
            filterButtonBar.visible = true;
            try
            {
                filterButtonBar["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
