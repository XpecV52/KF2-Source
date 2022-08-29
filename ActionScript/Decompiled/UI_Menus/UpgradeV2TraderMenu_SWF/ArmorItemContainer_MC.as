package
{
    import tripwire.controls.trader.TraderArmorItem;
    
    public dynamic class ArmorItemContainer_MC extends TraderArmorItem
    {
         
        
        public function ArmorItemContainer_MC()
        {
            super();
            this.__setProp_fillButton_ArmorItemContainer_MC_FillAmmoButton_0();
        }
        
        function __setProp_fillButton_ArmorItemContainer_MC_FillAmmoButton_0() : *
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
    }
}
