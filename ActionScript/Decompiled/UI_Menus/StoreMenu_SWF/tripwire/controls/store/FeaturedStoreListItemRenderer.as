package tripwire.controls.store
{
    import flash.display.MovieClip;
    
    public class FeaturedStoreListItemRenderer extends StoreListItemRenderer
    {
         
        
        public var featuredTagMC:MovieClip;
        
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
                if(data.featureText && data.featureText != "")
                {
                    this.featuredTagMC.textField.visible = true;
                    this.featuredTagMC.textField.text = data.featureText;
                }
                else
                {
                    this.featuredTagMC.visible = false;
                    this.featuredTagMC.textField.visible = false;
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
    }
}
