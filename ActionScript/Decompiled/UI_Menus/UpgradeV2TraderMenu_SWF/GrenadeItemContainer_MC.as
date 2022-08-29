package
{
    import tripwire.controls.trader.TraderGrenadeItem;
    
    public dynamic class GrenadeItemContainer_MC extends TraderGrenadeItem
    {
         
        
        public function GrenadeItemContainer_MC()
        {
            super();
            this.__setProp_fillButton_GrenadeItemContainer_MC_FillAmmoButton_0();
            this.__setProp_magButton_GrenadeItemContainer_MC_MagAmmoButton_0();
        }
        
        function __setProp_fillButton_GrenadeItemContainer_MC_FillAmmoButton_0() : *
        {
            try
            {
                fillButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            fillButton.autoRepeat = false;
            fillButton.autoSize = "none";
            fillButton.buttonValue = "";
            fillButton.data = "";
            fillButton.enabled = true;
            fillButton.enableInitCallback = false;
            fillButton.focusable = false;
            fillButton.label = "";
            fillButton.selected = false;
            fillButton.toggle = false;
            fillButton.visible = true;
            try
            {
                fillButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_magButton_GrenadeItemContainer_MC_MagAmmoButton_0() : *
        {
            try
            {
                magButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            magButton.autoRepeat = false;
            magButton.autoSize = "none";
            magButton.buttonValue = "";
            magButton.data = "";
            magButton.enabled = true;
            magButton.enableInitCallback = false;
            magButton.focusable = false;
            magButton.label = "";
            magButton.selected = false;
            magButton.toggle = false;
            magButton.visible = true;
            try
            {
                magButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
