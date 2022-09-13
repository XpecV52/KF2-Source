package tripwire.controls.store
{
    import flash.display.MovieClip;
    import tripwire.controls.TripListItemRenderer;
    import tripwire.controls.TripUILoader;
    
    public class StoreListItemRenderer extends TripListItemRenderer
    {
         
        
        public var itemPriceLayer:MovieClip;
        
        public var imageLoader:TripUILoader;
        
        public function StoreListItemRenderer()
        {
            super();
            preventAutosizing = true;
            defaultColor = 14538703;
        }
        
        override public function set data(param1:Object) : void
        {
            super.data = param1;
            if(data)
            {
                visible = true;
                this.itemPriceLayer.itemPriceText.text = data.price;
                if(data.itemPriceBase && data.itemPriceBase != "")
                {
                    this.itemPriceLayer.itemBasePriceText.text = data.itemPriceBase;
                    this.itemPriceLayer.itemBasePriceText.visible = true;
                    this.itemPriceLayer.ItemBasePriceCrossout.visible = true;
                }
                else
                {
                    this.itemPriceLayer.itemBasePriceText.visible = false;
                    this.itemPriceLayer.ItemBasePriceCrossout.visible = false;
                }
                if(data.imageURL && data.imageURL != "")
                {
                    this.imageLoader.source = data.imageURL;
                }
            }
            else
            {
                visible = false;
            }
        }
        
        override protected function updateText() : void
        {
            super.updateText();
            if(data)
            {
                this.itemPriceLayer.itemPriceText.text = data.price;
                if(data.itemPriceBase && data.itemPriceBase != "")
                {
                    this.itemPriceLayer.itemBasePriceText.text = data.itemPriceBase;
                    this.itemPriceLayer.itemBasePriceText.visible = true;
                    this.itemPriceLayer.ItemBasePriceCrossout.visible = true;
                }
                else
                {
                    this.itemPriceLayer.itemBasePriceText.visible = false;
                    this.itemPriceLayer.ItemBasePriceCrossout.visible = false;
                }
                if(data.imageURL && data.imageURL != "")
                {
                    this.imageLoader.source = data.imageURL;
                }
            }
        }
    }
}
