package
{
    import tripwire.containers.StartMatchMakingContainer;
    
    public dynamic class MatchMakingContainerMC extends StartMatchMakingContainer
    {
         
        
        public function MatchMakingContainerMC()
        {
            super();
            this.__setProp_lengthList_MatchMakingContainerMC_LengthList_0();
            this.__setProp_backButton_MatchMakingContainerMC_LengthList_0();
            this.__setProp_difficultyList_MatchMakingContainerMC_DifficultyList_0();
            this.__setProp_modeList_MatchMakingContainerMC_ModeList_0();
            this.__setProp_findGameButton_MatchMakingContainerMC_Buttons_0();
        }
        
        function __setProp_lengthList_MatchMakingContainerMC_LengthList_0() : *
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
            lengthList.itemRendererName = "ListItemRenderer";
            lengthList.itemRendererInstanceName = "";
            lengthList.margin = 0;
            lengthList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            lengthList.rowHeight = 0;
            lengthList.scrollBar = "ScrollBar";
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
        
        function __setProp_backButton_MatchMakingContainerMC_LengthList_0() : *
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
            backButton.label = "<<BACK";
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
        
        function __setProp_difficultyList_MatchMakingContainerMC_DifficultyList_0() : *
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
            difficultyList.itemRendererName = "ListItemRenderer";
            difficultyList.itemRendererInstanceName = "";
            difficultyList.margin = 0;
            difficultyList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            difficultyList.rowHeight = 0;
            difficultyList.scrollBar = "ScrollBar";
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
        
        function __setProp_modeList_MatchMakingContainerMC_ModeList_0() : *
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
            modeList.itemRendererName = "ListItemRenderer";
            modeList.itemRendererInstanceName = "";
            modeList.margin = 0;
            modeList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            modeList.rowHeight = 0;
            modeList.scrollBar = "ScrollBar";
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
        
        function __setProp_findGameButton_MatchMakingContainerMC_Buttons_0() : *
        {
            try
            {
                findGameButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            findGameButton.autoRepeat = false;
            findGameButton.autoSize = "left";
            findGameButton.data = "";
            findGameButton.enabled = true;
            findGameButton.enableInitCallback = false;
            findGameButton.focusable = true;
            findGameButton.label = "LAUNCH GAME";
            findGameButton.selected = false;
            findGameButton.toggle = false;
            findGameButton.visible = true;
            try
            {
                findGameButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
