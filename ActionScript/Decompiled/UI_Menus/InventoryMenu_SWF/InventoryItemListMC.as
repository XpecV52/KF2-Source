package
{
    import tripwire.containers.inventory.InventoryItemListContainer;
    
    public dynamic class InventoryItemListMC extends InventoryItemListContainer
    {
         
        
        public function InventoryItemListMC()
        {
            super();
            this.__setProp_inventoryItemScrollingList_InventoryItemListMC_ItemArea_0();
        }
        
        function __setProp_inventoryItemScrollingList_InventoryItemListMC_ItemArea_0() : *
        {
            try
            {
                inventoryItemScrollingList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            inventoryItemScrollingList.columnWidth = 0;
            inventoryItemScrollingList.direction = "vertical";
            inventoryItemScrollingList.enabled = true;
            inventoryItemScrollingList.enableInitCallback = false;
            inventoryItemScrollingList.externalColumnCount = 0;
            inventoryItemScrollingList.focusable = true;
            inventoryItemScrollingList.itemRendererName = "TileRendererMC";
            inventoryItemScrollingList.itemRendererInstanceName = "";
            inventoryItemScrollingList.margin = 0;
            inventoryItemScrollingList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            inventoryItemScrollingList.rowHeight = 0;
            inventoryItemScrollingList.scrollBar = "scrollbar";
            inventoryItemScrollingList.visible = true;
            inventoryItemScrollingList.wrapping = "stick";
            try
            {
                inventoryItemScrollingList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
