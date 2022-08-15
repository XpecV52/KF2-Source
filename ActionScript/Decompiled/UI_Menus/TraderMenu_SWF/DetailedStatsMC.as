package
{
    import tripwire.containers.trader.TraderItemStatsContainer;
    
    public dynamic class DetailedStatsMC extends TraderItemStatsContainer
    {
         
        
        public function DetailedStatsMC()
        {
            super();
            this.__setProp_favoriteButton_DetailedStatsMC_Layer1_0();
        }
        
        function __setProp_favoriteButton_DetailedStatsMC_Layer1_0() : *
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
            favoriteButton.focusable = true;
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
