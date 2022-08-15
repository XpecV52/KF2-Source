package tripwire.controls
{
    import flash.display.MovieClip;
    
    public class TitleButton extends TripButton
    {
         
        
        public var highlightColor:uint = 16503487;
        
        public var defaultColor:uint = 12234399;
        
        public var disabledColor:uint = 8743272;
        
        public var hitbox2:MovieClip;
        
        public const hitboxZ:int = 32;
        
        public function TitleButton()
        {
            super();
            doAnimations = true;
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
        
        override protected function highlightButton() : *
        {
            super.highlightButton();
            textField.textColor = this.highlightColor;
            this.hitbox2.z = this.hitboxZ;
        }
        
        override protected function unhighlightButton() : *
        {
            super.unhighlightButton();
            textField.textColor = this.defaultColor;
            this.hitbox2.z = 0;
        }
        
        override public function set enabled(param1:Boolean) : void
        {
            super.enabled = param1;
            if(!param1)
            {
                textField.textColor = this.disabledColor;
            }
        }
    }
}
