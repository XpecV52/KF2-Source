package tripwire.controls.store
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import tripwire.controls.TripListItemRenderer;
    import tripwire.controls.TripUILoader;
    
    public class StoreListItemRenderer extends TripListItemRenderer
    {
         
        
        public var itemPriceText:TextField;
        
        public var itemPriceBaseText:TextField;
        
        public var imageLoader:TripUILoader;
        
        public var crossPrice:MovieClip;
        
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
                this.itemPriceText.text = data.price;
                if(data.itemPriceBase && data.itemPriceBase != "")
                {
                    this.itemPriceBaseText.text = data.itemPriceBase;
                    this.itemPriceBaseText.visible = true;
                    this.crossPrice.visible = true;
                }
                else
                {
                    this.itemPriceBaseText.visible = false;
                    this.crossPrice.visible = false;
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
                this.itemPriceText.text = data.price;
                if(data.itemPriceBase && data.itemPriceBase != "")
                {
                    this.itemPriceBaseText.text = data.itemPriceBase;
                    this.itemPriceBaseText.visible = true;
                    this.crossPrice.visible = true;
                }
                else
                {
                    this.itemPriceBaseText.visible = false;
                    this.crossPrice.visible = false;
                }
            }
        }
    }
}
