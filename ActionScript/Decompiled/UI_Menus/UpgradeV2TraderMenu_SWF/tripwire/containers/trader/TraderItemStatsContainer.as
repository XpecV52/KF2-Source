package tripwire.containers.trader
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripButton;
    
    public class TraderItemStatsContainer extends TripContainer
    {
         
        
        public var damageTitle:TextField;
        
        public var fireRateTitle:TextField;
        
        public var penetrationTitle:TextField;
        
        public var accuracyTitle:TextField;
        
        public var ammoTitle:TextField;
        
        public var magTitle:TextField;
        
        public var damageValue:TextField;
        
        public var fireRateValue:TextField;
        
        public var penetrationValue:TextField;
        
        public var accuracyValue:TextField;
        
        public var ammoCapacity:TextField;
        
        public var magSizeValue:TextField;
        
        public var descriptionTextField:TextField;
        
        public var weightValue:TextField;
        
        public var weightIcon:MovieClip;
        
        public var damageBar:MovieClip;
        
        public var fireRateBar:MovieClip;
        
        public var penetrationBar:MovieClip;
        
        public var accuracyBar:MovieClip;
        
        public var damageUpBar:MovieClip;
        
        public var fireRateUpBar:MovieClip;
        
        public var penetrationUpBar:MovieClip;
        
        public var accuracyUpBar:MovieClip;
        
        public var damageBarBG:MovieClip;
        
        public var fireRateBarBG:MovieClip;
        
        public var penetrationBarBG:MovieClip;
        
        public var accuracyBarBG:MovieClip;
        
        public var favoriteButton:TripButton;
        
        public var upgradeButton:TripButton;
        
        public var favoriteControllerIcon:MovieClip;
        
        public var upgradeFrame:MovieClip;
        
        public var upgradeTextField:TextField;
        
        public var DoshIcon:MovieClip;
        
        public var upgradeCostTextField:TextField;
        
        public var upgradeWeightPlusIcon:MovieClip;
        
        public var upgradeWeightIcon:MovieClip;
        
        public var upgradeWeightTextField:TextField;
        
        public function TraderItemStatsContainer()
        {
            super();
            this.upgradeButton.focusable = false;
        }
    }
}
