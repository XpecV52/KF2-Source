package tripwire.containers.trader
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripUILoaderQueue;
    
    public class UpgradeV2TraderItemStatsContainer extends TripContainer
    {
         
        
        public var primaryAmmoValue:TextField;
        
        public var secondaryAmmoValue:TextField;
        
        public var primaryAmmoUpgradeValue:TextField;
        
        public var secondaryAmmoUpgradeValue:TextField;
        
        public var upgradePrimaryAmmoChevron:MovieClip;
        
        public var upgradeSecondaryAmmoChevron:MovieClip;
        
        public var weightValue:TextField;
        
        public var weightIcon:MovieClip;
        
        public var favoriteButton:TripButton;
        
        public var upgradeButton:TripButton;
        
        public var favoriteControllerIcon:MovieClip;
        
        public var upgradeTextField:TextField;
        
        public var DoshIcon:MovieClip;
        
        public var upgradeCostTextField:TextField;
        
        public var weightNextValue:TextField;
        
        public var upgradeChevron:MovieClip;
        
        public var primaryAmmoLoader:TripUILoaderQueue;
        
        public var secondaryAmmoLoader:TripUILoaderQueue;
        
        public function UpgradeV2TraderItemStatsContainer()
        {
            super();
            this.upgradeButton.focusable = false;
        }
    }
}
