package
{
    import tripwire.containers.serverBrowser.ServerBrowserFilterContainer;
    
    public dynamic class ServerBrowserFilterContainer extends tripwire.containers.serverBrowser.ServerBrowserFilterContainer
    {
         
        
        public function ServerBrowserFilterContainer()
        {
            super();
            this.__setProp_gameModeButton_ServerBrowserContainer_buttons_0();
            this.__setProp_mapButton_ServerBrowserContainer_buttons_0();
            this.__setProp_difficultyButton_ServerBrowserContainer_buttons_0();
            this.__setProp_lengthButton_ServerBrowserContainer_buttons_0();
            this.__setProp_pingButton_ServerBrowserContainer_buttons_0();
            this.__setProp_resetButton_ServerBrowserContainer_buttons_0();
            this.__setProp_applyButton_ServerBrowserContainer_buttons_0();
            this.__setProp_pingScrollingList_ServerBrowserContainer_PingList_0();
            this.__setProp_lengthScrollingList_ServerBrowserContainer_LengthList_0();
            this.__setProp_difficultyScrollingList_ServerBrowserContainer_DifficultyList_0();
            this.__setProp_mapScrollingList_ServerBrowserContainer_MapList_0();
            this.__setProp_gameModeScrollingList_ServerBrowserContainer_GameModelist_0();
            this.__setProp_backButton_ServerBrowserContainer_backButton_0();
            this.__setProp_titleText_ServerBrowserContainer_header_0();
        }
        
        function __setProp_gameModeButton_ServerBrowserContainer_buttons_0() : *
        {
            try
            {
                gameModeButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            gameModeButton.autoRepeat = false;
            gameModeButton.autoSize = "none";
            gameModeButton.data = "";
            gameModeButton.enabled = true;
            gameModeButton.enableInitCallback = false;
            gameModeButton.focusable = true;
            gameModeButton.label = "-";
            gameModeButton.selected = false;
            gameModeButton.toggle = false;
            gameModeButton.visible = true;
            try
            {
                gameModeButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_mapButton_ServerBrowserContainer_buttons_0() : *
        {
            try
            {
                mapButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            mapButton.autoRepeat = false;
            mapButton.autoSize = "none";
            mapButton.data = "";
            mapButton.enabled = true;
            mapButton.enableInitCallback = false;
            mapButton.focusable = true;
            mapButton.label = "-";
            mapButton.selected = false;
            mapButton.toggle = false;
            mapButton.visible = true;
            try
            {
                mapButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_difficultyButton_ServerBrowserContainer_buttons_0() : *
        {
            try
            {
                difficultyButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            difficultyButton.autoRepeat = false;
            difficultyButton.autoSize = "none";
            difficultyButton.data = "";
            difficultyButton.enabled = true;
            difficultyButton.enableInitCallback = false;
            difficultyButton.focusable = true;
            difficultyButton.label = "-";
            difficultyButton.selected = false;
            difficultyButton.toggle = false;
            difficultyButton.visible = true;
            try
            {
                difficultyButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_lengthButton_ServerBrowserContainer_buttons_0() : *
        {
            try
            {
                lengthButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            lengthButton.autoRepeat = false;
            lengthButton.autoSize = "none";
            lengthButton.data = "";
            lengthButton.enabled = true;
            lengthButton.enableInitCallback = false;
            lengthButton.focusable = true;
            lengthButton.label = "-";
            lengthButton.selected = false;
            lengthButton.toggle = false;
            lengthButton.visible = true;
            try
            {
                lengthButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_pingButton_ServerBrowserContainer_buttons_0() : *
        {
            try
            {
                pingButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            pingButton.autoRepeat = false;
            pingButton.autoSize = "none";
            pingButton.data = "";
            pingButton.enabled = true;
            pingButton.enableInitCallback = false;
            pingButton.focusable = true;
            pingButton.label = "-";
            pingButton.selected = false;
            pingButton.toggle = false;
            pingButton.visible = true;
            try
            {
                pingButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_resetButton_ServerBrowserContainer_buttons_0() : *
        {
            try
            {
                resetButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            resetButton.autoRepeat = false;
            resetButton.autoSize = "none";
            resetButton.data = "";
            resetButton.enabled = true;
            resetButton.enableInitCallback = false;
            resetButton.focusable = true;
            resetButton.label = "RESET";
            resetButton.selected = false;
            resetButton.toggle = false;
            resetButton.visible = true;
            try
            {
                resetButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_applyButton_ServerBrowserContainer_buttons_0() : *
        {
            try
            {
                applyButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            applyButton.autoRepeat = false;
            applyButton.autoSize = "none";
            applyButton.data = "";
            applyButton.enabled = true;
            applyButton.enableInitCallback = false;
            applyButton.focusable = true;
            applyButton.label = "APPLY";
            applyButton.selected = false;
            applyButton.toggle = false;
            applyButton.visible = true;
            try
            {
                applyButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_pingScrollingList_ServerBrowserContainer_PingList_0() : *
        {
            try
            {
                pingScrollingList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            pingScrollingList.enabled = true;
            pingScrollingList.enableInitCallback = false;
            pingScrollingList.focusable = true;
            pingScrollingList.itemRendererName = "DefaultTripListItemRenderer";
            pingScrollingList.itemRendererInstanceName = "";
            pingScrollingList.margin = 0;
            pingScrollingList.inspectablePadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":1
            };
            pingScrollingList.rowHeight = 0;
            pingScrollingList.scrollBar = "";
            pingScrollingList.visible = true;
            pingScrollingList.wrapping = "stick";
            try
            {
                pingScrollingList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_lengthScrollingList_ServerBrowserContainer_LengthList_0() : *
        {
            try
            {
                lengthScrollingList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            lengthScrollingList.enabled = true;
            lengthScrollingList.enableInitCallback = false;
            lengthScrollingList.focusable = true;
            lengthScrollingList.itemRendererName = "DefaultTripListItemRenderer";
            lengthScrollingList.itemRendererInstanceName = "";
            lengthScrollingList.margin = 0;
            lengthScrollingList.inspectablePadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":1
            };
            lengthScrollingList.rowHeight = 0;
            lengthScrollingList.scrollBar = "";
            lengthScrollingList.visible = true;
            lengthScrollingList.wrapping = "stick";
            try
            {
                lengthScrollingList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_difficultyScrollingList_ServerBrowserContainer_DifficultyList_0() : *
        {
            try
            {
                difficultyScrollingList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            difficultyScrollingList.enabled = true;
            difficultyScrollingList.enableInitCallback = false;
            difficultyScrollingList.focusable = true;
            difficultyScrollingList.itemRendererName = "DefaultTripListItemRenderer";
            difficultyScrollingList.itemRendererInstanceName = "";
            difficultyScrollingList.margin = 0;
            difficultyScrollingList.inspectablePadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":1
            };
            difficultyScrollingList.rowHeight = 0;
            difficultyScrollingList.scrollBar = "";
            difficultyScrollingList.visible = true;
            difficultyScrollingList.wrapping = "stick";
            try
            {
                difficultyScrollingList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_mapScrollingList_ServerBrowserContainer_MapList_0() : *
        {
            try
            {
                mapScrollingList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            mapScrollingList.enabled = true;
            mapScrollingList.enableInitCallback = false;
            mapScrollingList.focusable = true;
            mapScrollingList.itemRendererName = "DefaultTripListItemRenderer";
            mapScrollingList.itemRendererInstanceName = "";
            mapScrollingList.margin = 0;
            mapScrollingList.inspectablePadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":1
            };
            mapScrollingList.rowHeight = 0;
            mapScrollingList.scrollBar = "ListScrollBar";
            mapScrollingList.visible = true;
            mapScrollingList.wrapping = "stick";
            try
            {
                mapScrollingList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_gameModeScrollingList_ServerBrowserContainer_GameModelist_0() : *
        {
            try
            {
                gameModeScrollingList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            gameModeScrollingList.enabled = true;
            gameModeScrollingList.enableInitCallback = false;
            gameModeScrollingList.focusable = true;
            gameModeScrollingList.itemRendererName = "DefaultTripListItemRenderer";
            gameModeScrollingList.itemRendererInstanceName = "";
            gameModeScrollingList.margin = 0;
            gameModeScrollingList.inspectablePadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":1
            };
            gameModeScrollingList.rowHeight = 0;
            gameModeScrollingList.scrollBar = "";
            gameModeScrollingList.visible = true;
            gameModeScrollingList.wrapping = "stick";
            try
            {
                gameModeScrollingList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_backButton_ServerBrowserContainer_backButton_0() : *
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
            backButton.label = "";
            backButton.selected = false;
            backButton.toggle = false;
            backButton.visible = false;
            try
            {
                backButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_titleText_ServerBrowserContainer_header_0() : *
        {
            try
            {
                titleText["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            titleText.autoSize = "none";
            titleText.enabled = true;
            titleText.enableInitCallback = false;
            titleText.text = "label";
            titleText.visible = true;
            try
            {
                titleText["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
