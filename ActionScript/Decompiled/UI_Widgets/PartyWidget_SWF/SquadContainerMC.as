package
{
    import tripwire.widgets.PartyWidget;
    
    public dynamic class SquadContainerMC extends PartyWidget
    {
         
        
        public function SquadContainerMC()
        {
            super();
            this.__setProp_leaveButton_SquadContainerMC_LeaveButton_0();
            this.__setProp_readyButton_SquadContainerMC_ReadyButton_0();
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
            this.__setProp_createPartyButton_SquadContainerMC_CreatePartyButton_0();
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
            perksList5.visible = true;
            perksList5.wrapping = "normal";
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
            optionsList5.wrapping = "normal";
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
            perksList4.visible = true;
            perksList4.wrapping = "normal";
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
            optionsList4.wrapping = "normal";
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
            perksList3.visible = true;
            perksList3.wrapping = "normal";
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
            perksList2.visible = true;
            perksList2.wrapping = "normal";
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
            optionsList2.wrapping = "normal";
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
            perksList1.visible = true;
            perksList1.wrapping = "normal";
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
            optionsList1.visible = true;
            optionsList1.wrapping = "normal";
            try
            {
                optionsList1["componentInspectorSetting"] = false;
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
            perksList0.visible = true;
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
