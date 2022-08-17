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
        
        override public function setData(param1:Object) : void
        {
            super.setData(param1);
            if(param1 != null)
            {
                if(param1 as String == null)
                {
                    label = !!param1.label ? param1.label : "";
                }
                visible = true;
            }
            else
            {
                visible = false;
            }
        }
        
        override protected function handlePress(param1:uint = 0) : void
        {
            super.handlePress(param1);
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"ButtonSoundTheme",this.clickSoundEffect);
            }
        }
        
        override protected function handleMousePress(param1:MouseEvent) : void
        {
            super.handleMousePress(param1);
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"ButtonSoundTheme",this.clickSoundEffect);
            }
        }
        
        override protected function handleMouseRollOver(param1:MouseEvent) : void
        {
            super.handleMouseRollOver(param1);
            if(!selected)
            {
                this.highlightButton();
            }
        }
        
        override protected function handleMouseRollOut(param1:MouseEvent) : void
        {
            super.handleMouseRollOut(param1);
            if(!selected)
            {
                this.unhighlightButton();
            }
        }
        
        override public function set selected(param1:Boolean) : void
        {
            super.selected = param1;
            if(param1)
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