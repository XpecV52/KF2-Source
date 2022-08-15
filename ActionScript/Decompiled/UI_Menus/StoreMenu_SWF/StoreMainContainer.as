package
{
    import tripwire.containers.store.StoreMainContainer;
    
    public dynamic class StoreMainContainer extends tripwire.containers.store.StoreMainContainer
    {
         
        
        public function StoreMainContainer()
        {
            super();
            this.__setProp_storeItemScrollingList_StoreMainContainer_mc_scrollingList_0();
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
            storeItemScrollingList.wrapping = "normal";
            try
            {
                storeItemScrollingList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
