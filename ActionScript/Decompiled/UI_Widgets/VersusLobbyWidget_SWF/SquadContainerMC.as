package
{
    import tripwire.widgets.VersusLobbyWidget;
    
    public dynamic class SquadContainerMC extends VersusLobbyWidget
    {
         
        
        public function SquadContainerMC()
        {
            super();
            this.__setProp_leaveButton_SquadContainerMC_LeaveButton_0();
            this.__setProp_switchTeamsButton_SquadContainerMC_SwitchTeams_0();
            this.__setProp_readyButton_SquadContainerMC_ReadyButton_0();
            this.__setProp_createPartyButton_SquadContainerMC_CreatePartyButton_0();
            this.__setProp_perksList11_SquadContainerMC_perkList11_0();
            this.__setProp_optionsList11_SquadContainerMC_optionList11_0();
            this.__setProp_perksList10_SquadContainerMC_perkList10_0();
            this.__setProp_optionsList10_SquadContainerMC_optionList10_0();
            this.__setProp_perksList9_SquadContainerMC_perkList9_0();
            this.__setProp_optionsList9_SquadContainerMC_optionList9_0();
            this.__setProp_perksList8_SquadContainerMC_perkList8_0();
            this.__setProp_optionsList8_SquadContainerMC_optionList8_0();
            this.__setProp_perksList7_SquadContainerMC_perkList7_0();
            this.__setProp_optionsList7_SquadContainerMC_optionList7_0();
            this.__setProp_perksList6_SquadContainerMC_perkList6_0();
            this.__setProp_optionsList6_SquadContainerMC_optionList6_0();
            this.__setProp_perksList5_SquadContainerMC_perkList5_0();
            this.__setProp_optionsList5_SquadContainerMC_optionList5_0();
            this.__setProp_perksList4_SquadContainerMC_perkList4_0();
            this.__setProp_optionsList4_SquadContainerMC_optionList4_0();
            this.__setProp_perksList3_SquadContainerMC_perkList3_0();
            this.__setProp_optionsList3_SquadContainerMC_optionList3_0();
            this.__setProp_perksList2_SquadContainerMC_perkList2_0();
            this.__setProp_optionsList2_SquadContainerMC_optionList2_0();
            this.__setProp_perksList1_SquadContainerMC_perkList1_0();
            this.__setProp_optionsList1_SquadContainerMC_optionList1_0();
            this.__setProp_perksList0_SquadContainerMC_perkList0_0();
            this.__setProp_optionsList0_SquadContainerMC_optionList0_0();
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
        
        function __setProp_switchTeamsButton_SquadContainerMC_SwitchTeams_0() : *
        {
            try
            {
                switchTeamsButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            switchTeamsButton.autoRepeat = false;
            switchTeamsButton.autoSize = "none";
            switchTeamsButton.data = "";
            switchTeamsButton.enabled = true;
            switchTeamsButton.enableInitCallback = false;
            switchTeamsButton.focusable = true;
            switchTeamsButton.label = "LEAVE GAME";
            switchTeamsButton.selected = false;
            switchTeamsButton.toggle = false;
            switchTeamsButton.visible = true;
            try
            {
                switchTeamsButton["componentInspectorSetting"] = false;
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
        
        function __setProp_perksList11_SquadContainerMC_perkList11_0() : *
        {
            try
            {
                perksList11["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            perksList11.enabled = true;
            perksList11.enableInitCallback = false;
            perksList11.focusable = true;
            perksList11.itemRendererName = "PerkDropdownRenderer";
            perksList11.itemRendererInstanceName = "";
            perksList11.margin = 0;
            perksList11.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":8,
                "left":0
            };
            perksList11.rowHeight = 40;
            perksList11.scrollBar = "";
            perksList11.visible = false;
            perksList11.wrapping = "stick";
            try
            {
                perksList11["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_optionsList11_SquadContainerMC_optionList11_0() : *
        {
            try
            {
                optionsList11["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            optionsList11.enabled = true;
            optionsList11.enableInitCallback = false;
            optionsList11.focusable = true;
            optionsList11.itemRendererName = "DefaultTripListItemRenderer";
            optionsList11.itemRendererInstanceName = "";
            optionsList11.margin = 0;
            optionsList11.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            optionsList11.rowHeight = 40;
            optionsList11.scrollBar = "";
            optionsList11.visible = false;
            optionsList11.wrapping = "stick";
            try
            {
                optionsList11["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_perksList10_SquadContainerMC_perkList10_0() : *
        {
            try
            {
                perksList10["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            perksList10.enabled = true;
            perksList10.enableInitCallback = false;
            perksList10.focusable = true;
            perksList10.itemRendererName = "PerkDropdownRenderer";
            perksList10.itemRendererInstanceName = "";
            perksList10.margin = 0;
            perksList10.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":8,
                "left":0
            };
            perksList10.rowHeight = 40;
            perksList10.scrollBar = "";
            perksList10.visible = false;
            perksList10.wrapping = "stick";
            try
            {
                perksList10["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_optionsList10_SquadContainerMC_optionList10_0() : *
        {
            try
            {
                optionsList10["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            optionsList10.enabled = true;
            optionsList10.enableInitCallback = false;
            optionsList10.focusable = true;
            optionsList10.itemRendererName = "DefaultTripListItemRenderer";
            optionsList10.itemRendererInstanceName = "";
            optionsList10.margin = 0;
            optionsList10.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            optionsList10.rowHeight = 40;
            optionsList10.scrollBar = "";
            optionsList10.visible = false;
            optionsList10.wrapping = "stick";
            try
            {
                optionsList10["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_perksList9_SquadContainerMC_perkList9_0() : *
        {
            try
            {
                perksList9["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            perksList9.enabled = true;
            perksList9.enableInitCallback = false;
            perksList9.focusable = true;
            perksList9.itemRendererName = "PerkDropdownRenderer";
            perksList9.itemRendererInstanceName = "";
            perksList9.margin = 0;
            perksList9.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":8,
                "left":0
            };
            perksList9.rowHeight = 40;
            perksList9.scrollBar = "";
            perksList9.visible = false;
            perksList9.wrapping = "stick";
            try
            {
                perksList9["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_optionsList9_SquadContainerMC_optionList9_0() : *
        {
            try
            {
                optionsList9["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            optionsList9.enabled = true;
            optionsList9.enableInitCallback = false;
            optionsList9.focusable = true;
            optionsList9.itemRendererName = "DefaultTripListItemRenderer";
            optionsList9.itemRendererInstanceName = "";
            optionsList9.margin = 0;
            optionsList9.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            optionsList9.rowHeight = 40;
            optionsList9.scrollBar = "";
            optionsList9.visible = false;
            optionsList9.wrapping = "stick";
            try
            {
                optionsList9["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_perksList8_SquadContainerMC_perkList8_0() : *
        {
            try
            {
                perksList8["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            perksList8.enabled = true;
            perksList8.enableInitCallback = false;
            perksList8.focusable = true;
            perksList8.itemRendererName = "PerkDropdownRenderer";
            perksList8.itemRendererInstanceName = "";
            perksList8.margin = 0;
            perksList8.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":8,
                "left":0
            };
            perksList8.rowHeight = 40;
            perksList8.scrollBar = "";
            perksList8.visible = false;
            perksList8.wrapping = "stick";
            try
            {
                perksList8["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_optionsList8_SquadContainerMC_optionList8_0() : *
        {
            try
            {
                optionsList8["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            optionsList8.enabled = true;
            optionsList8.enableInitCallback = false;
            optionsList8.focusable = true;
            optionsList8.itemRendererName = "DefaultTripListItemRenderer";
            optionsList8.itemRendererInstanceName = "";
            optionsList8.margin = 0;
            optionsList8.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            optionsList8.rowHeight = 40;
            optionsList8.scrollBar = "";
            optionsList8.visible = false;
            optionsList8.wrapping = "stick";
            try
            {
                optionsList8["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_perksList7_SquadContainerMC_perkList7_0() : *
        {
            try
            {
                perksList7["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            perksList7.enabled = true;
            perksList7.enableInitCallback = false;
            perksList7.focusable = true;
            perksList7.itemRendererName = "PerkDropdownRenderer";
            perksList7.itemRendererInstanceName = "";
            perksList7.margin = 0;
            perksList7.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":8,
                "left":0
            };
            perksList7.rowHeight = 40;
            perksList7.scrollBar = "";
            perksList7.visible = false;
            perksList7.wrapping = "stick";
            try
            {
                perksList7["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_optionsList7_SquadContainerMC_optionList7_0() : *
        {
            try
            {
                optionsList7["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            optionsList7.enabled = true;
            optionsList7.enableInitCallback = false;
            optionsList7.focusable = true;
            optionsList7.itemRendererName = "DefaultTripListItemRenderer";
            optionsList7.itemRendererInstanceName = "";
            optionsList7.margin = 0;
            optionsList7.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            optionsList7.rowHeight = 40;
            optionsList7.scrollBar = "";
            optionsList7.visible = false;
            optionsList7.wrapping = "stick";
            try
            {
                optionsList7["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_perksList6_SquadContainerMC_perkList6_0() : *
        {
            try
            {
                perksList6["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            perksList6.enabled = true;
            perksList6.enableInitCallback = false;
            perksList6.focusable = true;
            perksList6.itemRendererName = "PerkDropdownRenderer";
            perksList6.itemRendererInstanceName = "";
            perksList6.margin = 0;
            perksList6.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":8,
                "left":0
            };
            perksList6.rowHeight = 40;
            perksList6.scrollBar = "";
            perksList6.visible = false;
            perksList6.wrapping = "stick";
            try
            {
                perksList6["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_optionsList6_SquadContainerMC_optionList6_0() : *
        {
            try
            {
                optionsList6["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            optionsList6.enabled = true;
            optionsList6.enableInitCallback = false;
            optionsList6.focusable = true;
            optionsList6.itemRendererName = "DefaultTripListItemRenderer";
            optionsList6.itemRendererInstanceName = "";
            optionsList6.margin = 0;
            optionsList6.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            optionsList6.rowHeight = 40;
            optionsList6.scrollBar = "";
            optionsList6.visible = false;
            optionsList6.wrapping = "stick";
            try
            {
                optionsList6["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_perksList5_SquadContainerMC_perkList5_0() : *
        {
            try
            {
                perksList5["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            perksList5.enabled = true;
            perksList5.enableInitCallback = false;
            perksList5.focusable = true;
            perksList5.itemRendererName = "PerkDropdownRenderer";
            perksList5.itemRendererInstanceName = "";
            perksList5.margin = 0;
            perksList5.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":8,
                "left":0
            };
            perksList5.rowHeight = 40;
            perksList5.scrollBar = "";
            perksList5.visible = false;
            perksList5.wrapping = "stick";
            try
            {
                perksList5["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_optionsList5_SquadContainerMC_optionList5_0() : *
        {
            try
            {
                optionsList5["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            optionsList5.enabled = true;
            optionsList5.enableInitCallback = false;
            optionsList5.focusable = true;
            optionsList5.itemRendererName = "DefaultTripListItemRenderer";
            optionsList5.itemRendererInstanceName = "";
            optionsList5.margin = 0;
            optionsList5.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            optionsList5.rowHeight = 40;
            optionsList5.scrollBar = "";
            optionsList5.visible = false;
            optionsList5.wrapping = "stick";
            try
            {
                optionsList5["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_perksList4_SquadContainerMC_perkList4_0() : *
        {
            try
            {
                perksList4["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            perksList4.enabled = true;
            perksList4.enableInitCallback = false;
            perksList4.focusable = true;
            perksList4.itemRendererName = "PerkDropdownRenderer";
            perksList4.itemRendererInstanceName = "";
            perksList4.margin = 0;
            perksList4.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":8,
                "left":0
            };
            perksList4.rowHeight = 40;
            perksList4.scrollBar = "";
            perksList4.visible = false;
            perksList4.wrapping = "stick";
            try
            {
                perksList4["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_optionsList4_SquadContainerMC_optionList4_0() : *
        {
            try
            {
                optionsList4["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            optionsList4.enabled = true;
            optionsList4.enableInitCallback = false;
            optionsList4.focusable = true;
            optionsList4.itemRendererName = "DefaultTripListItemRenderer";
            optionsList4.itemRendererInstanceName = "";
            optionsList4.margin = 0;
            optionsList4.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            optionsList4.rowHeight = 40;
            optionsList4.scrollBar = "";
            optionsList4.visible = false;
            optionsList4.wrapping = "stick";
            try
            {
                optionsList4["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_perksList3_SquadContainerMC_perkList3_0() : *
        {
            try
            {
                perksList3["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            perksList3.enabled = true;
            perksList3.enableInitCallback = false;
            perksList3.focusable = true;
            perksList3.itemRendererName = "PerkDropdownRenderer";
            perksList3.itemRendererInstanceName = "";
            perksList3.margin = 0;
            perksList3.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":8,
                "left":0
            };
            perksList3.rowHeight = 40;
            perksList3.scrollBar = "";
            perksList3.visible = false;
            perksList3.wrapping = "stick";
            try
            {
                perksList3["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_optionsList3_SquadContainerMC_optionList3_0() : *
        {
            try
            {
                optionsList3["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            optionsList3.enabled = true;
            optionsList3.enableInitCallback = false;
            optionsList3.focusable = true;
            optionsList3.itemRendererName = "DefaultTripListItemRenderer";
            optionsList3.itemRendererInstanceName = "";
            optionsList3.margin = 0;
            optionsList3.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            optionsList3.rowHeight = 40;
            optionsList3.scrollBar = "";
            optionsList3.visible = false;
            optionsList3.wrapping = "stick";
            try
            {
                optionsList3["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_perksList2_SquadContainerMC_perkList2_0() : *
        {
            try
            {
                perksList2["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            perksList2.enabled = true;
            perksList2.enableInitCallback = false;
            perksList2.focusable = true;
            perksList2.itemRendererName = "PerkDropdownRenderer";
            perksList2.itemRendererInstanceName = "";
            perksList2.margin = 0;
            perksList2.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":8,
                "left":0
            };
            perksList2.rowHeight = 40;
            perksList2.scrollBar = "";
            perksList2.visible = false;
            perksList2.wrapping = "stick";
            try
            {
                perksList2["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_optionsList2_SquadContainerMC_optionList2_0() : *
        {
            try
            {
                optionsList2["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            optionsList2.enabled = true;
            optionsList2.enableInitCallback = false;
            optionsList2.focusable = true;
            optionsList2.itemRendererName = "DefaultTripListItemRenderer";
            optionsList2.itemRendererInstanceName = "";
            optionsList2.margin = 0;
            optionsList2.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            optionsList2.rowHeight = 40;
            optionsList2.scrollBar = "";
            optionsList2.visible = false;
            optionsList2.wrapping = "stick";
            try
            {
                optionsList2["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_perksList1_SquadContainerMC_perkList1_0() : *
        {
            try
            {
                perksList1["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            perksList1.enabled = true;
            perksList1.enableInitCallback = false;
            perksList1.focusable = true;
            perksList1.itemRendererName = "PerkDropdownRenderer";
            perksList1.itemRendererInstanceName = "";
            perksList1.margin = 0;
            perksList1.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":8,
                "left":0
            };
            perksList1.rowHeight = 40;
            perksList1.scrollBar = "";
            perksList1.visible = false;
            perksList1.wrapping = "stick";
            try
            {
                perksList1["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_optionsList1_SquadContainerMC_optionList1_0() : *
        {
            try
            {
                optionsList1["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            optionsList1.enabled = true;
            optionsList1.enableInitCallback = false;
            optionsList1.focusable = true;
            optionsList1.itemRendererName = "DefaultTripListItemRenderer";
            optionsList1.itemRendererInstanceName = "";
            optionsList1.margin = 0;
            optionsList1.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            optionsList1.rowHeight = 40;
            optionsList1.scrollBar = "";
            optionsList1.visible = false;
            optionsList1.wrapping = "stick";
            try
            {
                optionsList1["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_perksList0_SquadContainerMC_perkList0_0() : *
        {
            try
            {
                perksList0["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            perksList0.enabled = true;
            perksList0.enableInitCallback = false;
            perksList0.focusable = true;
            perksList0.itemRendererName = "PerkDropdownRenderer";
            perksList0.itemRendererInstanceName = "";
            perksList0.margin = 0;
            perksList0.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":8,
                "left":0
            };
            perksList0.rowHeight = 40;
            perksList0.scrollBar = "";
            perksList0.visible = false;
            perksList0.wrapping = "stick";
            try
            {
                perksList0["componentInspectorSetting"] = false;
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
