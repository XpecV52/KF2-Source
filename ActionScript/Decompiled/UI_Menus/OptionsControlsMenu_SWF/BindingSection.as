package
{
    import tripwire.containers.optionsControls.KeybindGroupContainer;
    
    public dynamic class BindingSection extends KeybindGroupContainer
    {
         
        
        public function BindingSection()
        {
            super();
            this.__setProp_commandList1_BindingSectionMC_Lists_0();
            this.__setProp_commandList2_BindingSectionMC_Lists_0();
            this.__setProp_bindList1_BindingSectionMC_Lists_0();
            this.__setProp_bindList2_BindingSectionMC_Lists_0();
        }
        
        function __setProp_commandList1_BindingSectionMC_Lists_0() : *
        {
            try
            {
                commandList1["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            commandList1.enabled = true;
            commandList1.enableInitCallback = false;
            commandList1.focusable = true;
            commandList1.itemRendererName = "CommandItemRenderer";
            commandList1.itemRendererInstanceName = "";
            commandList1.margin = 0;
            commandList1.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            commandList1.rowHeight = 0;
            commandList1.scrollBar = "";
            commandList1.visible = true;
            commandList1.wrapping = "normal";
            try
            {
                commandList1["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_commandList2_BindingSectionMC_Lists_0() : *
        {
            try
            {
                commandList2["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            commandList2.enabled = true;
            commandList2.enableInitCallback = false;
            commandList2.focusable = true;
            commandList2.itemRendererName = "CommandItemRenderer";
            commandList2.itemRendererInstanceName = "";
            commandList2.margin = 0;
            commandList2.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            commandList2.rowHeight = 0;
            commandList2.scrollBar = "";
            commandList2.visible = true;
            commandList2.wrapping = "normal";
            try
            {
                commandList2["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_bindList1_BindingSectionMC_Lists_0() : *
        {
            try
            {
                bindList1["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            bindList1.enabled = true;
            bindList1.enableInitCallback = false;
            bindList1.focusable = true;
            bindList1.itemRendererName = "BindItemRenderer";
            bindList1.itemRendererInstanceName = "";
            bindList1.margin = 0;
            bindList1.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            bindList1.rowHeight = 0;
            bindList1.scrollBar = "";
            bindList1.visible = true;
            bindList1.wrapping = "normal";
            try
            {
                bindList1["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_bindList2_BindingSectionMC_Lists_0() : *
        {
            try
            {
                bindList2["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            bindList2.enabled = true;
            bindList2.enableInitCallback = false;
            bindList2.focusable = true;
            bindList2.itemRendererName = "BindItemRenderer";
            bindList2.itemRendererInstanceName = "";
            bindList2.margin = 0;
            bindList2.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            bindList2.rowHeight = 0;
            bindList2.scrollBar = "";
            bindList2.visible = true;
            bindList2.wrapping = "normal";
            try
            {
                bindList2["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
