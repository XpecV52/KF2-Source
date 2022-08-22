package tripwire.controls.inventory
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.text.TextField;
    import scaleform.clik.controls.ListItemRenderer;
    import scaleform.clik.controls.UILoader;
    import scaleform.gfx.Extensions;
    import tripwire.managers.MenuManager;
    
    public class InventoryListItemRenderer extends ListItemRenderer
    {
         
        
        public var imageLoader:UILoader;
        
        public var itemCountText:TextField;
        
        public var activeIndicator:MovieClip;
        
        public var itemCountBG:MovieClip;
        
        public var _itemCount:int;
        
        public var overSoundEffect:String = "INVENTORY_ITEM_ROLLOVER";
        
        public var clickSoundEffect:String = "GEAR_ITEM_CLICK";
        
        public function InventoryListItemRenderer()
        {
            super();
        }
        
        override protected function handlePress(param1:uint = 0) : void
        {
            super.handlePress(param1);
            if(Extensions.gfxProcessSound != null && enabled == true)
            {
                Extensions.gfxProcessSound(this,"UI",this.clickSoundEffect);
            }
        }
        
        override protected function handleMousePress(param1:MouseEvent) : void
        {
            super.handleMousePress(param1);
            if(Extensions.gfxProcessSound != null && enabled == true)
            {
                Extensions.gfxProcessSound(this,"UI",this.clickSoundEffect);
            }
        }
        
        override protected function handleMouseRollOver(param1:MouseEvent) : void
        {
            super.handleMouseRollOver(param1);
            if(!selected)
            {
                if(Extensions.gfxProcessSound != null && enabled == true)
                {
                    Extensions.gfxProcessSound(this,"UI",this.overSoundEffect);
                }
            }
        }
        
        override public function set selected(param1:Boolean) : void
        {
            if(param1 && super.selected == false)
            {
                if(Extensions.gfxProcessSound != null && enabled == true && MenuManager.manager.bUsingGamepad)
                {
                    Extensions.gfxProcessSound(this,"UI",this.overSoundEffect);
                }
            }
            super.selected = param1;
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
