package
{
    import tripwire.containers.inventory.InventoryItemListContainer;
    
    public dynamic class InventoryItemListMC extends InventoryItemListContainer
    {
         
        
        public function InventoryItemListMC()
        {
            super();
            this.__setProp_inventoryItemScrollingList_InventoryItemListMC_ItemArea_0();
            this.__setProp_filterDropdown_0_InventoryItemListMC_Filters_0();
            this.__setProp_filterDropdown_1_InventoryItemListMC_Filters_0();
            this.__setProp_filterDropdown_2_InventoryItemListMC_Filters_0();
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
            inventoryItemScrollingList.wrapping = "normal";
            try
            {
                inventoryItemScrollingList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_filterDropdown_0_InventoryItemListMC_Filters_0() : *
        {
            try
            {
                filterDropdown_0["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            filterDropdown_0.autoSize = "none";
            filterDropdown_0.dropdown = "$DropDownScrollingList";
            filterDropdown_0.enabled = true;
            filterDropdown_0.enableInitCallback = false;
            filterDropdown_0.focusable = true;
            filterDropdown_0.itemRenderer = "DefaultTripListItemRenderer";
            filterDropdown_0.menuDirection = "down";
            filterDropdown_0.menuMargin = 1;
            filterDropdown_0.inspectableMenuOffset = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            filterDropdown_0.inspectableMenuPadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            filterDropdown_0.menuRowCount = 8;
            filterDropdown_0.menuWidth = -1;
            filterDropdown_0.menuWrapping = "normal";
            filterDropdown_0.scrollBar = "DefaultScrollBar";
            filterDropdown_0.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            filterDropdown_0.visible = true;
            try
            {
                filterDropdown_0["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_filterDropdown_1_InventoryItemListMC_Filters_0() : *
        {
            try
            {
                filterDropdown_1["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            filterDropdown_1.autoSize = "none";
            filterDropdown_1.dropdown = "$DropDownScrollingList";
            filterDropdown_1.enabled = true;
            filterDropdown_1.enableInitCallback = false;
            filterDropdown_1.focusable = true;
            filterDropdown_1.itemRenderer = "DefaultTripListItemRenderer";
            filterDropdown_1.menuDirection = "down";
            filterDropdown_1.menuMargin = 1;
            filterDropdown_1.inspectableMenuOffset = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            filterDropdown_1.inspectableMenuPadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            filterDropdown_1.menuRowCount = 12;
            filterDropdown_1.menuWidth = -1;
            filterDropdown_1.menuWrapping = "normal";
            filterDropdown_1.scrollBar = "DefaultScrollBar";
            filterDropdown_1.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            filterDropdown_1.visible = true;
            try
            {
                filterDropdown_1["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_filterDropdown_2_InventoryItemListMC_Filters_0() : *
        {
            try
            {
                filterDropdown_2["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            filterDropdown_2.autoSize = "none";
            filterDropdown_2.dropdown = "$DropDownScrollingList";
            filterDropdown_2.enabled = true;
            filterDropdown_2.enableInitCallback = false;
            filterDropdown_2.focusable = true;
            filterDropdown_2.itemRenderer = "DefaultTripListItemRenderer";
            filterDropdown_2.menuDirection = "down";
            filterDropdown_2.menuMargin = 1;
            filterDropdown_2.inspectableMenuOffset = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            filterDropdown_2.inspectableMenuPadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            filterDropdown_2.menuRowCount = 12;
            filterDropdown_2.menuWidth = -1;
            filterDropdown_2.menuWrapping = "normal";
            filterDropdown_2.scrollBar = "DefaultScrollBar";
            filterDropdown_2.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            filterDropdown_2.visible = true;
            try
            {
                filterDropdown_2["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
