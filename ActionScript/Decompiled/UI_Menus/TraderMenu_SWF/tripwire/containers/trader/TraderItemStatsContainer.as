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
        
        public var favoriteButton:TripButton;
        
        public var favoriteTextField:TextField;
        
        public var favoriteControllerIcon:MovieClip;
        
        public var favoriteIcon:MovieClip;
        
        public function TraderItemStatsContainer()
        {
            super();
        }
    }
}
