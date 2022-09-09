package
{
    import tripwire.popups.OptionMicPopup;
    
    public dynamic class OptionMicMC extends OptionMicPopup
    {
         
        
        public function OptionMicMC()
        {
            super();
            this.__setProp_devicesDropDown_OptionMicMC_Option_layer_0();
        }
        
        function __setProp_devicesDropDown_OptionMicMC_Option_layer_0() : *
        {
            try
            {
                devicesDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            devicesDropDown.autoSize = "none";
            devicesDropDown.dropdown = "$DropDownScrollingList";
            devicesDropDown.enabled = true;
            devicesDropDown.enableInitCallback = false;
            devicesDropDown.focusable = true;
            devicesDropDown.itemRenderer = "DefaultTripListItemRenderer";
            devicesDropDown.menuDirection = "down";
            devicesDropDown.menuMargin = 0;
            devicesDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            devicesDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            devicesDropDown.menuRowCount = 7;
            devicesDropDown.menuWidth = -1;
            devicesDropDown.menuWrapping = "stick";
            devicesDropDown.scrollBar = "ListScrollBar";
            devicesDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            devicesDropDown.visible = true;
            try
            {
                devicesDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
