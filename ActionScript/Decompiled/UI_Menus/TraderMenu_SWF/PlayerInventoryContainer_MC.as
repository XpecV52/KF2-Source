package
{
    import tripwire.containers.trader.TraderPlayerInventoryContainer;
    
    public dynamic class PlayerInventoryContainer_MC extends TraderPlayerInventoryContainer
    {
         
        
        public function PlayerInventoryContainer_MC()
        {
            super();
            this.__setProp_autoFillButton_PlayerInventoryContainer_MC_AutoFillButton_0();
            this.__setProp_infoList_PlayerInventoryContainer_MC_InfoList_0();
            this.__setProp_fillButtonList_PlayerInventoryContainer_MC_FillList_0();
            this.__setProp_magList_PlayerInventoryContainer_MC_MagList_0();
        }
        
        function __setProp_autoFillButton_PlayerInventoryContainer_MC_AutoFillButton_0() : *
        {
            try
            {
                autoFillButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            autoFillButton.autoRepeat = false;
            autoFillButton.autoSize = "none";
            autoFillButton.buttonValue = "";
            autoFillButton.data = "";
            autoFillButton.enabled = true;
            autoFillButton.enableInitCallback = false;
            autoFillButton.focusable = false;
            autoFillButton.label = "";
            autoFillButton.selected = false;
            autoFillButton.toggle = false;
            autoFillButton.visible = true;
            try
            {
                autoFillButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_infoList_PlayerInventoryContainer_MC_InfoList_0() : *
        {
            try
            {
                infoList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            infoList.enabled = true;
            infoList.enableInitCallback = false;
            infoList.focusable = true;
            infoList.itemRendererName = "InventoryItemContainer";
            infoList.itemRendererInstanceName = "";
            infoList.margin = 0;
            infoList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            infoList.rowHeight = 0;
            infoList.scrollBar = "playerScrollBar";
            infoList.visible = true;
            infoList.wrapping = "normal";
            try
            {
                infoList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_fillButtonList_PlayerInventoryContainer_MC_FillList_0() : *
        {
            try
            {
                fillButtonList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            fillButtonList.enabled = true;
            fillButtonList.enableInitCallback = false;
            fillButtonList.focusable = false;
            fillButtonList.itemRendererName = "FillAmmoButtonContainer";
            fillButtonList.itemRendererInstanceName = "";
            fillButtonList.margin = 0;
            fillButtonList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            fillButtonList.rowHeight = 0;
            fillButtonList.scrollBar = "playerScrollBar";
            fillButtonList.visible = true;
            fillButtonList.wrapping = "normal";
            try
            {
                fillButtonList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_magList_PlayerInventoryContainer_MC_MagList_0() : *
        {
            try
            {
                magList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            magList.enabled = true;
            magList.enableInitCallback = false;
            magList.focusable = false;
            magList.itemRendererName = "MagAmmoButtonContainer";
            magList.itemRendererInstanceName = "";
            magList.margin = 0;
            magList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            magList.rowHeight = 0;
            magList.scrollBar = "playerScrollBar";
            magList.visible = true;
            magList.wrapping = "normal";
            try
            {
                magList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
