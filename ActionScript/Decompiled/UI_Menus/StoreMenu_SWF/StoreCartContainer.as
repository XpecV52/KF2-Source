package
{
    import tripwire.containers.store.StoreCartContainer;
    
    public dynamic class StoreCartContainer extends tripwire.containers.store.StoreCartContainer
    {
         
        
        public function StoreCartContainer()
        {
            super();
            this.__setProp_scrollingList_StoreCartContainer_MC_scrollingList_0();
        }
        
        function __setProp_scrollingList_StoreCartContainer_MC_scrollingList_0() : *
        {
            try
            {
                scrollingList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            scrollingList.enabled = true;
            scrollingList.enableInitCallback = false;
            scrollingList.focusable = true;
            scrollingList.itemRendererName = "StoreCartItemContainer";
            scrollingList.itemRendererInstanceName = "cartItem_";
            scrollingList.margin = 0;
            scrollingList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            scrollingList.rowHeight = 0;
            scrollingList.scrollBar = "scrollBar";
            scrollingList.visible = true;
            scrollingList.wrapping = "normal";
            try
            {
                scrollingList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
