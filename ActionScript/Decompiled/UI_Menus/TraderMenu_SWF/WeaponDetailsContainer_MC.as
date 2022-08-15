package
{
    import tripwire.containers.trader.TraderItemDetailsContainer;
    
    public dynamic class WeaponDetailsContainer_MC extends TraderItemDetailsContainer
    {
         
        
        public function WeaponDetailsContainer_MC()
        {
            super();
            this.__setProp_buySellButton_WeaponDetailsContainer_MC_BuySellButton_0();
        }
        
        function __setProp_buySellButton_WeaponDetailsContainer_MC_BuySellButton_0() : *
        {
            try
            {
                buySellButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            buySellButton.autoRepeat = false;
            buySellButton.autoSize = "none";
            buySellButton.buttonValue = "";
            buySellButton.data = "";
            buySellButton.enabled = true;
            buySellButton.enableInitCallback = false;
            buySellButton.focusable = false;
            buySellButton.label = "";
            buySellButton.selected = false;
            buySellButton.toggle = false;
            buySellButton.visible = true;
            try
            {
                buySellButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
