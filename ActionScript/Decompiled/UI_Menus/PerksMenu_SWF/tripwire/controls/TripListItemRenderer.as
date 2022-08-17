package tripwire.controls
{
    import flash.events.MouseEvent;
    import scaleform.clik.controls.ListItemRenderer;
    import scaleform.gfx.Extensions;
    
    public class TripListItemRenderer extends ListItemRenderer
    {
         
        
        public var clickSoundEffect:String = "Button_Selected";
        
        public var highlightColor:uint = 16503487;
        
        public var defaultColor:uint = 12234399;
        
        public var disabledColor:uint = 8743272;
        
        public function TripListItemRenderer()
        {
            super();
        }
        
        override public function setData(data:Object) : void
        {
            super.setData(data);
            if(data != null)
            {
                if(data as String == null)
                {
                    label = !!data.label ? data.label : "";
                }
                visible = true;
            }
            else
            {
                visible = false;
            }
        }
        
        override protected function handlePress(controllerIndex:uint = 0) : void
        {
            super.handlePress(controllerIndex);
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"ButtonSoundTheme",this.clickSoundEffect);
            }
        }
        
        override protected function handleMousePress(event:MouseEvent) : void
        {
            super.handleMousePress(event);
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"ButtonSoundTheme",this.clickSoundEffect);
            }
        }
        
        override protected function handleMouseRollOver(event:MouseEvent) : void
        {
            super.handleMouseRollOver(event);
            if(!selected)
            {
                this.highlightButton();
            }
        }
        
        override protected function handleMouseRollOut(event:MouseEvent) : void
        {
            super.handleMouseRollOut(event);
            if(!selected)
            {
                this.unhighlightButton();
            }
        }
        
        override public function set selected(value:Boolean) : void
        {
            super.selected = value;
            if(value)
            {
                this.highlightButton();
            }
            else
            {
                this.unhighlightButton();
            }
        }
        
        protected function highlightButton() : *
        {
            if(textField != null)
            {
                textField.textColor = this.highlightColor;
            }
        }
        
        protected function unhighlightButton() : *
        {
            if(textField != null)
            {
                textField.textColor = this.defaultColor;
            }
        }
    }
}
