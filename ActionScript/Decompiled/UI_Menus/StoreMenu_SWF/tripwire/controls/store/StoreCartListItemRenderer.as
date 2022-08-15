package tripwire.controls.store
{
    import flash.text.TextField;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripListItemRenderer;
    
    public class StoreCartListItemRenderer extends TripListItemRenderer
    {
         
        
        public var itemNameText:TextField;
        
        public var itemPriceText:TextField;
        
        public var removeButton:TripButton;
        
        public function StoreCartListItemRenderer()
        {
            super();
        }
    }
}
