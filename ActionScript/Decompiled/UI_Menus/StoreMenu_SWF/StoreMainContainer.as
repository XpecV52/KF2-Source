package
{
    import tripwire.containers.store.StoreMainContainer;
    
    public dynamic class StoreMainContainer extends tripwire.containers.store.StoreMainContainer
    {
         
        
        public function StoreMainContainer()
        {
            super();
            this.__setProp_storeItemScrollingList_StoreMainContainer_mc_scrollingList_0();
            this.__setProp_storeItemFeaturedScrollingList_StoreMainContainer_mc_scrollingListfeatured_0();
        }
        
        function __setProp_storeItemScrollingList_StoreMainContainer_mc_scrollingList_0() : *
        {
            try
            {
                storeItemScrollingList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            storeItemScrollingList.columnWidth = 0;
            storeItemScrollingList.direction = "vertical";
            storeItemScrollingList.enabled = true;
            storeItemScrollingList.enableInitCallback = false;
            storeItemScrollingList.externalColumnCount = 0;
            storeItemScrollingList.focusable = true;
            storeItemScrollingList.itemRendererName = "StoreItem_MC";
            storeItemScrollingList.itemRendererInstanceName = "";
            storeItemScrollingList.margin = 0;
            storeItemScrollingList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            storeItemScrollingList.rowHeight = 0;
            storeItemScrollingList.scrollBar = "scrollbar";
            storeItemScrollingList.visible = true;
            storeItemScrollingList.wrapping = "stick";
            try
            {
                storeItemScrollingList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_storeItemFeaturedScrollingList_StoreMainContainer_mc_scrollingListfeatured_0() : *
        {
            try
            {
                storeItemFeaturedScrollingList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            storeItemFeaturedScrollingList.columnWidth = 0;
            storeItemFeaturedScrollingList.direction = "vertical";
            storeItemFeaturedScrollingList.enabled = true;
            storeItemFeaturedScrollingList.enableInitCallback = false;
            storeItemFeaturedScrollingList.externalColumnCount = 0;
            storeItemFeaturedScrollingList.focusable = true;
            storeItemFeaturedScrollingList.itemRendererName = "";
            storeItemFeaturedScrollingList.itemRendererInstanceName = "featuredItem_";
            storeItemFeaturedScrollingList.margin = 0;
            storeItemFeaturedScrollingList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            storeItemFeaturedScrollingList.rowHeight = 0;
            storeItemFeaturedScrollingList.scrollBar = "scrollbar";
            storeItemFeaturedScrollingList.visible = true;
            storeItemFeaturedScrollingList.wrapping = "stick";
            try
            {
                storeItemFeaturedScrollingList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
