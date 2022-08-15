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
        
        public function setData(param1:Object) : void
        {
            this.unhighlightButton();
            this.icon = !!param1.iconSource ? param1.iconSource : "";
            this.TitleText = !!param1.label ? param1.label : "";
            this.DescriptionText = !!param1.description ? param1.description : "";
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.active = false;
        }
        
        public function set icon(param1:String) : void
        {
            if(param1 != null && param1 != "")
            {
                this.iconLoader.source = param1;
            }
        }
        
        public function set TitleText(param1:String) : void
        {
            label = param1;
        }
        
        public function set DescriptionText(param1:String) : void
        {
            this.descriptionTextfield.text = param1;
        }
        
        public function set active(param1:*) : void
        {
            this.activeIndicator.visible = param1;
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
        
        override public function set enabled(param1:Boolean) : void
        {
            super.enabled = param1;
            if(!param1)
            {
                this.iconColor.setTint(this.disabledColor,1);
                this.iconLoader.transform.colorTransform = this.iconColor;
                textField.textColor = this.disabledColor;
                this.descriptionTextfield.textColor = this.disabledColor;
            }
        }
    }
}
