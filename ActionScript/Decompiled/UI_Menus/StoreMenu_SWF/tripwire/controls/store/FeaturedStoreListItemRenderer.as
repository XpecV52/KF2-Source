package tripwire.controls.store
{
    import flash.display.MovieClip;
    
    public class FeaturedStoreListItemRenderer extends StoreListItemRenderer
    {
         
        
        public var featuredTagMC:MovieClip;
        
        public var featuredTagOnlySaleMC:MovieClip;
        
        public function FeaturedStoreListItemRenderer()
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
                if(data.itemOnSale && data.itemOnSale != "0")
                {
                    if(data.discountRate && data.discountRate != "")
                    {
                        this.featuredTagMC.visible = true;
                        this.featuredTagMC.textField.visible = true;
                        this.featuredTagMC.textField.text = "-" + data.discountRate + "%";
                        this.featuredTagOnlySaleMC.visible = false;
                    }
                    else
                    {
                        this.featuredTagOnlySaleMC.visible = true;
                        this.featuredTagMC.visible = false;
                        this.featuredTagMC.textField.visible = false;
                    }
                }
                else
                {
                    this.featuredTagMC.visible = false;
                    this.featuredTagMC.textField.visible = false;
                    this.featuredTagOnlySaleMC.visible = false;
                }
                if(data.imageURLLarge && data.imageURLLarge != "")
                {
                    imageLoader.source = data.imageURLLarge;
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
                if(data.itemOnSale && data.itemOnSale != "0")
                {
                    if(data.discountRate && data.discountRate != "")
                    {
                        this.featuredTagMC.visible = true;
                        this.featuredTagMC.textField.visible = true;
                        this.featuredTagMC.textField.text = "-" + data.discountRate + "%";
                        this.featuredTagOnlySaleMC.visible = false;
                    }
                    else
                    {
                        this.featuredTagOnlySaleMC.visible = true;
                        this.featuredTagMC.visible = false;
                        this.featuredTagMC.textField.visible = false;
                    }
                }
                else
                {
                    this.featuredTagMC.visible = false;
                    this.featuredTagMC.textField.visible = false;
                    this.featuredTagOnlySaleMC.visible = false;
                }
            }
        }
    }
}
