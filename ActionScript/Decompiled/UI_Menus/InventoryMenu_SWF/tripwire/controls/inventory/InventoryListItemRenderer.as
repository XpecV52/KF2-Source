package tripwire.controls.inventory
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import scaleform.clik.controls.ListItemRenderer;
    import scaleform.clik.controls.UILoader;
    
    public class InventoryListItemRenderer extends ListItemRenderer
    {
         
        
        public var imageLoader:UILoader;
        
        public var itemCountText:TextField;
        
        public var activeIndicator:MovieClip;
        
        public var itemCountBG:MovieClip;
        
        public var _itemCount:int;
        
        public function InventoryListItemRenderer()
        {
            super();
        }
        
        override public function set data(param1:Object) : void
        {
            super.data = param1;
            if(data)
            {
                visible = true;
                if(data.iconURLSmall && data.iconURLSmall != "")
                {
                    this.imageLoader.source = data.iconURLSmall;
                }
                if(this.activeIndicator != null)
                {
                    this.activeIndicator.visible = !!data.active ? Boolean(data.active) : false;
                }
                this.itemCount = !!data.count ? int(data.count) : 0;
            }
            else
            {
                visible = false;
            }
        }
        
        public function set itemCount(param1:int) : void
        {
            this._itemCount = param1;
            if(this.itemCountText == null)
            {
                return;
            }
            this.itemCountText.visible = param1 > 1;
            this.itemCountBG.visible = param1 > 1;
            if(param1 == 0)
            {
                this.itemCountText.text = "";
                this.itemCountBG.visible = false;
            }
            else
            {
                this.itemCountText.text = this._itemCount.toString();
            }
        }
        
        override protected function updateText() : void
        {
            super.updateText();
            if(data)
            {
                this.itemCount = this._itemCount;
            }
        }
    }
}
