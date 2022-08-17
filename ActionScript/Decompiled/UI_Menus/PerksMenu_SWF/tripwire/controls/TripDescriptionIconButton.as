package tripwire.controls
{
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.controls.UILoader;
    
    public class TripDescriptionIconButton extends TripButton
    {
         
        
        public var descriptionTextfield:TextField;
        
        public var iconLoader:UILoader;
        
        public var activeIndicator:MovieClip;
        
        public var tier:int = 0;
        
        public var iconColor:Color;
        
        public var baseColor:uint = 12234399;
        
        public var highlightColor:uint = 16503487;
        
        public var disabledColor:uint = 5393734;
        
        public function TripDescriptionIconButton()
        {
            this.iconColor = new Color();
            super();
            preventAutosizing = true;
        }
        
        public function setData(data:Object) : void
        {
            this.unhighlightButton();
            this.icon = !!data.iconSource ? data.iconSource : "";
            this.TitleText = !!data.label ? data.label : "";
            this.DescriptionText = !!data.description ? data.description : "";
        }
        
        override protected function addedToStage(e:Event) : void
        {
            super.addedToStage(e);
            this.active = false;
        }
        
        public function set icon(value:String) : void
        {
            if(value != null && value != "")
            {
                this.iconLoader.source = value;
            }
        }
        
        public function set TitleText(value:String) : void
        {
            label = value;
        }
        
        public function set DescriptionText(value:String) : void
        {
            this.descriptionTextfield.text = value;
        }
        
        public function set active(value:*) : void
        {
            this.activeIndicator.visible = value;
            this.unhighlightButton();
        }
        
        override protected function highlightButton() : *
        {
            if(enabled)
            {
                this.iconColor.setTint(this.highlightColor,1);
                this.iconLoader.transform.colorTransform = this.iconColor;
                textField.textColor = this.highlightColor;
                this.descriptionTextfield.textColor = this.highlightColor;
            }
        }
        
        override protected function unhighlightButton() : *
        {
            if(enabled)
            {
                if(!this.activeIndicator.visible)
                {
                    this.iconColor.setTint(this.baseColor,1);
                    this.iconLoader.transform.colorTransform = this.iconColor;
                    textField.textColor = this.baseColor;
                    this.descriptionTextfield.textColor = this.baseColor;
                }
                else
                {
                    this.highlightButton();
                }
            }
        }
        
        override public function set enabled(value:Boolean) : void
        {
            super.enabled = value;
            if(!value)
            {
                this.iconColor.setTint(this.disabledColor,1);
                this.iconLoader.transform.colorTransform = this.iconColor;
                textField.textColor = this.disabledColor;
                this.descriptionTextfield.textColor = this.disabledColor;
            }
        }
    }
}
