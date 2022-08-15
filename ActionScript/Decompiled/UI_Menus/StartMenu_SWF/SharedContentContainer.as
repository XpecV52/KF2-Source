package
{
    import tripwire.containers.SharedContentListContainer;
    
    public dynamic class SharedContentContainer extends SharedContentListContainer
    {
         
        
        public function SharedContentContainer()
        {
            super();
            this.__setProp_sharedContentList_SharedContentContainer_list_0();
        }
        
        function __setProp_sharedContentList_SharedContentContainer_list_0() : *
        {
            try
            {
                sharedContentList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            sharedContentList.enabled = true;
            sharedContentList.enableInitCallback = false;
            sharedContentList.focusable = true;
            sharedContentList.itemRendererName = "SharedItemListItemRenderer";
            sharedContentList.itemRendererInstanceName = "sharedItem_";
            sharedContentList.margin = 0;
            sharedContentList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            sharedContentList.rowHeight = 0;
            sharedContentList.scrollBar = "listScrollBar";
            sharedContentList.visible = true;
            sharedContentList.wrapping = "normal";
            try
            {
                sharedContentList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
