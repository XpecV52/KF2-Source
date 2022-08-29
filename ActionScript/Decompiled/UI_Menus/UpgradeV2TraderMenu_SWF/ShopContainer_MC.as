package
{
    import tripwire.containers.trader.TraderShopContainer;
    
    public dynamic class ShopContainer_MC extends TraderShopContainer
    {
         
        
        public function ShopContainer_MC()
        {
            super();
            this.__setProp_shopList_ShopContainer_MC_ShopList_0();
            this.__setProp_promptsDisplay_ShopContainer_MC_prompts_0();
        }
        
        function __setProp_shopList_ShopContainer_MC_ShopList_0() : *
        {
            try
            {
                shopList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            shopList.enabled = true;
            shopList.enableInitCallback = false;
            shopList.focusable = true;
            shopList.itemRendererName = "ShopWeaponItemContainer";
            shopList.itemRendererInstanceName = "";
            shopList.margin = 0;
            shopList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            shopList.rowHeight = 0;
            shopList.scrollBar = "shopScrollBar";
            shopList.visible = true;
            shopList.wrapping = "wrap";
            try
            {
                shopList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_promptsDisplay_ShopContainer_MC_prompts_0() : *
        {
            try
            {
                promptsDisplay["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            promptsDisplay.bUseWidthForBoundry = true;
            promptsDisplay.enabled = true;
            promptsDisplay.enableInitCallback = false;
            promptsDisplay.promptSpacing = 40;
            promptsDisplay.visible = false;
            try
            {
                promptsDisplay["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
