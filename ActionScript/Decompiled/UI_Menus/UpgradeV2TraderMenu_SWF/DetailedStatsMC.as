package
{
    import tripwire.containers.trader.UpgradeV2TraderItemStatsContainer;
    
    public dynamic class DetailedStatsMC extends UpgradeV2TraderItemStatsContainer
    {
         
        
        public function DetailedStatsMC()
        {
            super();
            this.__setProp_upgradeButton_DetailedStatsMC_upgradebutton_0();
            this.__setProp_favoriteButton_DetailedStatsMC_favbutton_0();
        }
        
        function __setProp_upgradeButton_DetailedStatsMC_upgradebutton_0() : *
        {
            try
            {
                upgradeButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            upgradeButton.autoRepeat = false;
            upgradeButton.autoSize = "none";
            upgradeButton.clickSoundEffect = "FavoriteButton_Select";
            upgradeButton.data = "";
            upgradeButton.enabled = true;
            upgradeButton.enableInitCallback = false;
            upgradeButton.focusable = false;
            upgradeButton.label = "";
            upgradeButton.selected = false;
            upgradeButton.toggle = false;
            upgradeButton.visible = true;
            try
            {
                upgradeButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_favoriteButton_DetailedStatsMC_favbutton_0() : *
        {
            try
            {
                favoriteButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            favoriteButton.autoRepeat = false;
            favoriteButton.autoSize = "none";
            favoriteButton.clickSoundEffect = "FavoriteButton_Select";
            favoriteButton.data = "";
            favoriteButton.enabled = true;
            favoriteButton.enableInitCallback = false;
            favoriteButton.focusable = false;
            favoriteButton.label = "";
            favoriteButton.selected = false;
            favoriteButton.toggle = false;
            favoriteButton.visible = true;
            try
            {
                favoriteButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
