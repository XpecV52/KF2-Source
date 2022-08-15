package
{
    import tripwire.containers.GearListContainer;
    
    public dynamic class ListContainerMC extends GearListContainer
    {
         
        
        public function ListContainerMC()
        {
            super();
            this.__setProp_tileList_ListContainerMC_List_0();
            this.__setProp_backButton_ListContainerMC_BackButton_0();
        }
        
        function __setProp_tileList_ListContainerMC_List_0() : *
        {
            try
            {
                tileList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            tileList.columnWidth = 0;
            tileList.direction = "vertical";
            tileList.enabled = true;
            tileList.enableInitCallback = false;
            tileList.externalColumnCount = 0;
            tileList.focusable = true;
            tileList.itemRendererName = "TileRendererMC";
            tileList.itemRendererInstanceName = "";
            tileList.margin = 0;
            tileList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            tileList.rowHeight = 0;
            tileList.scrollBar = "scrollBarMC";
            tileList.visible = true;
            tileList.wrapping = "normal";
            try
            {
                tileList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_backButton_ListContainerMC_BackButton_0() : *
        {
            try
            {
                backButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            backButton.autoRepeat = false;
            backButton.autoSize = "none";
            backButton.data = "";
            backButton.enabled = true;
            backButton.enableInitCallback = false;
            backButton.focusable = true;
            backButton.label = "BACK";
            backButton.selected = false;
            backButton.toggle = false;
            backButton.visible = true;
            try
            {
                backButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
