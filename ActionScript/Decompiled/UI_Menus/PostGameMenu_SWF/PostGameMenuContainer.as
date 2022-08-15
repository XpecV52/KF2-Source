package
{
    import tripwire.menus.PostGameMenu;
    
    public dynamic class PostGameMenuContainer extends PostGameMenu
    {
         
        
        public function PostGameMenuContainer()
        {
            super();
            this.__setProp_playerSlotList_PostGameMenuContainer_PlayerSlotList_0();
            this.__setProp_topButtonBar_PostGameMenuContainer_TabsContainer_0();
        }
        
        function __setProp_playerSlotList_PostGameMenuContainer_PlayerSlotList_0() : *
        {
            try
            {
                playerSlotList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            playerSlotList.enabled = true;
            playerSlotList.enableInitCallback = false;
            playerSlotList.focusable = true;
            playerSlotList.itemRendererName = "PlayerSlot";
            playerSlotList.itemRendererInstanceName = "PlayerSlot_";
            playerSlotList.margin = 0;
            playerSlotList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            playerSlotList.rowHeight = 0;
            playerSlotList.scrollBar = "";
            playerSlotList.visible = true;
            playerSlotList.wrapping = "normal";
            try
            {
                playerSlotList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_topButtonBar_PostGameMenuContainer_TabsContainer_0() : *
        {
            try
            {
                topButtonBar["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            topButtonBar.autoSize = "none";
            topButtonBar.buttonWidth = 254;
            topButtonBar.direction = "horizontal";
            topButtonBar.enabled = true;
            topButtonBar.enableInitCallback = false;
            topButtonBar.focusable = true;
            topButtonBar.itemRendererName = "InteriorBaseButton";
            topButtonBar.spacing = 8;
            topButtonBar.visible = true;
            try
            {
                topButtonBar["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
