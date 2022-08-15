package
{
    import tripwire.containers.StartOptionsContainer;
    
    public dynamic class GameOptionsContainerMC extends StartOptionsContainer
    {
         
        
        public function GameOptionsContainerMC()
        {
            super();
            this.__setProp_privacyList_GameOptionsContainerMC_PrivacyList_0();
            this.__setProp_inProgressList_GameOptionsContainerMC_inprogress_0();
            this.__setProp_serverTypeList_GameOptionsContainerMC_serverType_0();
            this.__setProp_lengthList_GameOptionsContainerMC_LengthList_0();
            this.__setProp_difficultyList_GameOptionsContainerMC_DifficultyList_0();
            this.__setProp_mapList_GameOptionsContainerMC_MapList_0();
            this.__setProp_modeList_GameOptionsContainerMC_ModeList_0();
            this.__setProp_mutatorButton_GameOptionsContainerMC_MutatorButton_0();
            this.__setProp_modeButton_GameOptionsContainerMC_Buttons_0();
            this.__setProp_mapButton_GameOptionsContainerMC_Buttons_0();
            this.__setProp_difficultyButton_GameOptionsContainerMC_Buttons_0();
            this.__setProp_lengthButton_GameOptionsContainerMC_Buttons_0();
            this.__setProp_serverTypeButton_GameOptionsContainerMC_Buttons_0();
            this.__setProp_startGameButton_GameOptionsContainerMC_Buttons_0();
            this.__setProp_inProgressButton_GameOptionsContainerMC_Buttons_0();
            this.__setProp_privacyButton_GameOptionsContainerMC_Buttons_0();
            this.__setProp_backButton_GameOptionsContainerMC_Buttons_0();
        }
        
        function __setProp_privacyList_GameOptionsContainerMC_PrivacyList_0() : *
        {
            try
            {
                privacyList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            privacyList.enabled = true;
            privacyList.enableInitCallback = false;
            privacyList.focusable = true;
            privacyList.itemRendererName = "DefaultTripListItemRenderer";
            privacyList.itemRendererInstanceName = "";
            privacyList.margin = 0;
            privacyList.inspectablePadding = {
                "top":2.5,
                "right":8,
                "bottom":8,
                "left":-1.5
            };
            privacyList.rowHeight = 0;
            privacyList.scrollBar = "ListScrollBar";
            privacyList.visible = true;
            privacyList.wrapping = "stick";
            try
            {
                privacyList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_inProgressList_GameOptionsContainerMC_inprogress_0() : *
        {
            try
            {
                inProgressList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            inProgressList.enabled = true;
            inProgressList.enableInitCallback = false;
            inProgressList.focusable = true;
            inProgressList.itemRendererName = "DefaultTripListItemRenderer";
            inProgressList.itemRendererInstanceName = "";
            inProgressList.margin = 0;
            inProgressList.inspectablePadding = {
                "top":2.5,
                "right":8,
                "bottom":8,
                "left":-1.5
            };
            inProgressList.rowHeight = 0;
            inProgressList.scrollBar = "ListScrollBar";
            inProgressList.visible = true;
            inProgressList.wrapping = "stick";
            try
            {
                inProgressList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_serverTypeList_GameOptionsContainerMC_serverType_0() : *
        {
            try
            {
                serverTypeList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            serverTypeList.enabled = true;
            serverTypeList.enableInitCallback = false;
            serverTypeList.focusable = true;
            serverTypeList.itemRendererName = "DefaultTripListItemRenderer";
            serverTypeList.itemRendererInstanceName = "";
            serverTypeList.margin = 0;
            serverTypeList.inspectablePadding = {
                "top":2.5,
                "right":8,
                "bottom":8,
                "left":-1.5
            };
            serverTypeList.rowHeight = 0;
            serverTypeList.scrollBar = "ListScrollBar";
            serverTypeList.visible = true;
            serverTypeList.wrapping = "stick";
            try
            {
                serverTypeList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_lengthList_GameOptionsContainerMC_LengthList_0() : *
        {
            try
            {
                lengthList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            lengthList.enabled = true;
            lengthList.enableInitCallback = false;
            lengthList.focusable = true;
            lengthList.itemRendererName = "DefaultTripListItemRenderer";
            lengthList.itemRendererInstanceName = "";
            lengthList.margin = 0;
            lengthList.inspectablePadding = {
                "top":2.5,
                "right":8,
                "bottom":8,
                "left":-1.5
            };
            lengthList.rowHeight = 0;
            lengthList.scrollBar = "ListScrollBar";
            lengthList.visible = true;
            lengthList.wrapping = "stick";
            try
            {
                lengthList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_difficultyList_GameOptionsContainerMC_DifficultyList_0() : *
        {
            try
            {
                difficultyList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            difficultyList.enabled = true;
            difficultyList.enableInitCallback = false;
            difficultyList.focusable = true;
            difficultyList.itemRendererName = "DefaultTripListItemRenderer";
            difficultyList.itemRendererInstanceName = "";
            difficultyList.margin = 0;
            difficultyList.inspectablePadding = {
                "top":2.5,
                "right":8,
                "bottom":8,
                "left":-1.5
            };
            difficultyList.rowHeight = 0;
            difficultyList.scrollBar = "ListScrollBar";
            difficultyList.visible = true;
            difficultyList.wrapping = "stick";
            try
            {
                difficultyList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_mapList_GameOptionsContainerMC_MapList_0() : *
        {
            try
            {
                mapList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            mapList.enabled = true;
            mapList.enableInitCallback = false;
            mapList.focusable = true;
            mapList.itemRendererName = "DefaultTripListItemRenderer";
            mapList.itemRendererInstanceName = "";
            mapList.margin = 0;
            mapList.inspectablePadding = {
                "top":2.5,
                "right":8,
                "bottom":8,
                "left":-1.5
            };
            mapList.rowHeight = 0;
            mapList.scrollBar = "ListScrollBar";
            mapList.visible = true;
            mapList.wrapping = "stick";
            try
            {
                mapList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_modeList_GameOptionsContainerMC_ModeList_0() : *
        {
            try
            {
                modeList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            modeList.enabled = true;
            modeList.enableInitCallback = false;
            modeList.focusable = true;
            modeList.itemRendererName = "DefaultTripListItemRenderer";
            modeList.itemRendererInstanceName = "";
            modeList.margin = 0;
            modeList.inspectablePadding = {
                "top":2.5,
                "right":8,
                "bottom":8,
                "left":-1.5
            };
            modeList.rowHeight = 0;
            modeList.scrollBar = "ListScrollBar";
            modeList.visible = true;
            modeList.wrapping = "stick";
            try
            {
                modeList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_mutatorButton_GameOptionsContainerMC_MutatorButton_0() : *
        {
            try
            {
                mutatorButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            mutatorButton.autoRepeat = false;
            mutatorButton.autoSize = "left";
            mutatorButton.data = "";
            mutatorButton.enabled = true;
            mutatorButton.enableInitCallback = false;
            mutatorButton.focusable = true;
            mutatorButton.label = "Mutators";
            mutatorButton.selected = false;
            mutatorButton.toggle = false;
            mutatorButton.visible = true;
            try
            {
                mutatorButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_modeButton_GameOptionsContainerMC_Buttons_0() : *
        {
            try
            {
                modeButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            modeButton.autoRepeat = false;
            modeButton.autoSize = "none";
            modeButton.data = "";
            modeButton.enabled = true;
            modeButton.enableInitCallback = false;
            modeButton.focusable = true;
            modeButton.infoString = "_info";
            modeButton.label = "_Game Mode";
            modeButton.selected = false;
            modeButton.toggle = false;
            modeButton.visible = true;
            try
            {
                modeButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_mapButton_GameOptionsContainerMC_Buttons_0() : *
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
            mapButton.infoString = "_info";
            mapButton.label = "_Starting Map";
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
        
        function __setProp_difficultyButton_GameOptionsContainerMC_Buttons_0() : *
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
            difficultyButton.infoString = "_info";
            difficultyButton.label = "_Difficulty";
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
        
        function __setProp_lengthButton_GameOptionsContainerMC_Buttons_0() : *
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
            lengthButton.infoString = "_info";
            lengthButton.label = "_length";
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
        
        function __setProp_serverTypeButton_GameOptionsContainerMC_Buttons_0() : *
        {
            try
            {
                serverTypeButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            serverTypeButton.autoRepeat = false;
            serverTypeButton.autoSize = "none";
            serverTypeButton.data = "";
            serverTypeButton.enabled = true;
            serverTypeButton.enableInitCallback = false;
            serverTypeButton.focusable = true;
            serverTypeButton.infoString = "_info";
            serverTypeButton.label = "_Server Type";
            serverTypeButton.selected = false;
            serverTypeButton.toggle = false;
            serverTypeButton.visible = true;
            try
            {
                serverTypeButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_startGameButton_GameOptionsContainerMC_Buttons_0() : *
        {
            try
            {
                startGameButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            startGameButton.autoRepeat = false;
            startGameButton.autoSize = "none";
            startGameButton.data = "";
            startGameButton.enabled = true;
            startGameButton.enableInitCallback = false;
            startGameButton.focusable = true;
            startGameButton.label = "_Play KF2";
            startGameButton.selected = false;
            startGameButton.toggle = false;
            startGameButton.visible = true;
            try
            {
                startGameButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_inProgressButton_GameOptionsContainerMC_Buttons_0() : *
        {
            try
            {
                inProgressButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            inProgressButton.autoRepeat = false;
            inProgressButton.autoSize = "none";
            inProgressButton.data = "";
            inProgressButton.enabled = true;
            inProgressButton.enableInitCallback = false;
            inProgressButton.focusable = true;
            inProgressButton.infoString = "_info";
            inProgressButton.label = "_In Progress";
            inProgressButton.selected = false;
            inProgressButton.toggle = false;
            inProgressButton.visible = true;
            try
            {
                inProgressButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_privacyButton_GameOptionsContainerMC_Buttons_0() : *
        {
            try
            {
                privacyButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            privacyButton.autoRepeat = false;
            privacyButton.autoSize = "none";
            privacyButton.data = "";
            privacyButton.enabled = true;
            privacyButton.enableInitCallback = false;
            privacyButton.focusable = true;
            privacyButton.infoString = "_info";
            privacyButton.label = "_Privacy";
            privacyButton.selected = false;
            privacyButton.toggle = false;
            privacyButton.visible = true;
            try
            {
                privacyButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_backButton_GameOptionsContainerMC_Buttons_0() : *
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
            backButton.label = "_Leave MatchMaking";
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
