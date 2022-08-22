package
{
    import tripwire.containers.trader.TraderPlayerInventoryContainer;
    
    public dynamic class PlayerInventoryContainer_MC extends TraderPlayerInventoryContainer
    {
         
        
        public function PlayerInventoryContainer_MC()
        {
            super();
            this.__setProp_infoList_PlayerInventoryContainer_MC_InfoList_0();
            this.__setProp_magList_PlayerInventoryContainer_MC_MagList_0();
            this.__setProp_fillButtonList_PlayerInventoryContainer_MC_FillList_0();
            this.__setProp_sellList_PlayerInventoryContainer_MC_SellList_0();
            this.__setProp_changePerkButton_PlayerInventoryContainer_MC_PlayerInfo_0();
            this.__setProp_autoFillButton_PlayerInventoryContainer_MC_AutoFillButton_0();
            this.__setProp_promptsDisplay_PlayerInventoryContainer_MC_prompts_0();
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
            infoList.itemRendererName = "";
            infoList.itemRendererInstanceName = "inventoryItem_";
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
        
        function __setProp_sellList_PlayerInventoryContainer_MC_SellList_0() : *
        {
            try
            {
                sellList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            sellList.enabled = true;
            sellList.enableInitCallback = false;
            sellList.focusable = false;
            sellList.itemRendererName = "SellButton_MC";
            sellList.itemRendererInstanceName = "";
            sellList.margin = 0;
            sellList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            sellList.rowHeight = 0;
            sellList.scrollBar = "playerScrollBar";
            sellList.visible = true;
            sellList.wrapping = "normal";
            try
            {
                sellList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_changePerkButton_PlayerInventoryContainer_MC_PlayerInfo_0() : *
        {
            try
            {
                changePerkButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            changePerkButton.autoRepeat = false;
            changePerkButton.autoSize = "none";
            changePerkButton.data = "";
            changePerkButton.enabled = true;
            changePerkButton.enableInitCallback = false;
            changePerkButton.focusable = false;
            changePerkButton.label = "";
            changePerkButton.selected = false;
            changePerkButton.toggle = false;
            changePerkButton.visible = true;
            try
            {
                changePerkButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
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
        
        function __setProp_promptsDisplay_PlayerInventoryContainer_MC_prompts_0() : *
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
