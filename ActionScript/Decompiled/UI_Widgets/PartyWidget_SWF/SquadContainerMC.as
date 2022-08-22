package
{
    import tripwire.widgets.PartyWidget;
    
    public dynamic class SquadContainerMC extends PartyWidget
    {
         
        
        public function SquadContainerMC()
        {
            super();
            this.__setProp_promptsDisplay_SquadContainerMC_prompts_0();
            this.__setProp_leaveButton_SquadContainerMC_LeaveButton_0();
            this.__setProp_readyButton_SquadContainerMC_ReadyButton_0();
            this.__setProp_createPartyButton_SquadContainerMC_CreatePartyButton_0();
            this.__setProp_optionsList0_SquadContainerMC_optionList0_0();
        }
        
        function __setProp_promptsDisplay_SquadContainerMC_prompts_0() : *
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
            promptsDisplay.promptSpacing = 50;
            promptsDisplay.visible = true;
            try
            {
                promptsDisplay["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_leaveButton_SquadContainerMC_LeaveButton_0() : *
        {
            try
            {
                leaveButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            leaveButton.autoRepeat = false;
            leaveButton.autoSize = "none";
            leaveButton.data = "";
            leaveButton.enabled = true;
            leaveButton.enableInitCallback = false;
            leaveButton.focusable = true;
            leaveButton.label = "LEAVE GAME";
            leaveButton.selected = false;
            leaveButton.toggle = false;
            leaveButton.visible = true;
            try
            {
                leaveButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_readyButton_SquadContainerMC_ReadyButton_0() : *
        {
            try
            {
                readyButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            readyButton.autoRepeat = false;
            readyButton.autoSize = "none";
            readyButton.clickSoundEffect = "ReadyButton_Selected";
            readyButton.data = "";
            readyButton.enabled = true;
            readyButton.enableInitCallback = false;
            readyButton.focusable = true;
            readyButton.label = "READY UP";
            readyButton.selected = false;
            readyButton.toggle = true;
            readyButton.visible = true;
            try
            {
                readyButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_createPartyButton_SquadContainerMC_CreatePartyButton_0() : *
        {
            try
            {
                createPartyButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            createPartyButton.autoRepeat = false;
            createPartyButton.autoSize = "none";
            createPartyButton.data = "";
            createPartyButton.enabled = true;
            createPartyButton.enableInitCallback = false;
            createPartyButton.focusable = true;
            createPartyButton.label = "text";
            createPartyButton.selected = false;
            createPartyButton.toggle = false;
            createPartyButton.visible = true;
            try
            {
                createPartyButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_optionsList0_SquadContainerMC_optionList0_0() : *
        {
            try
            {
                optionsList0["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            optionsList0.enabled = true;
            optionsList0.enableInitCallback = false;
            optionsList0.focusable = true;
            optionsList0.itemRendererName = "DefaultTripListItemRenderer";
            optionsList0.itemRendererInstanceName = "";
            optionsList0.margin = 0;
            optionsList0.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            optionsList0.rowHeight = 40;
            optionsList0.scrollBar = "";
            optionsList0.visible = false;
            optionsList0.wrapping = "stick";
            try
            {
                optionsList0["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
