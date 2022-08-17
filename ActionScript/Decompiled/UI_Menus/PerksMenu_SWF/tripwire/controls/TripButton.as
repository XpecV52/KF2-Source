package tripwire.controls
{
    import flash.events.FocusEvent;
    import flash.events.MouseEvent;
    import scaleform.clik.controls.Button;
    import scaleform.gfx.Extensions;
    
    public class TripButton extends Button
    {
         
        
        private var _originalPositionZ:Number;
        
        private const AnimTime = 6;
        
        private const AnimHighlightOffsetZ = 32;
        
        private const AnimSelectedOffsetZ = 0;
        
        public var doAnimations:Boolean = false;
        
        public var clickSoundEffect:String = "Button_Selected";
        
        public function TripButton()
        {
            super();
            this._originalPositionZ = z;
            Extensions.enabled = true;
            addEventListener(FocusEvent.FOCUS_IN,this.handleFocusIn,false,0,true);
        }
        
        protected function handleFocusIn(e:FocusEvent) : *
        {
            addEventListener(FocusEvent.FOCUS_OUT,this.handleFocusOut,false,0,true);
            removeEventListener(FocusEvent.FOCUS_IN,this.handleFocusIn);
            if(!selected)
            {
                this.highlightButton();
            }
        }
        
        protected function handleFocusOut(e:FocusEvent) : *
        {
            addEventListener(FocusEvent.FOCUS_IN,this.handleFocusIn,false,0,true);
            removeEventListener(FocusEvent.FOCUS_OUT,this.handleFocusOut);
            if(!selected)
            {
                this.unhighlightButton();
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
        
        override protected function handleMousePress(event:MouseEvent) : void
        {
            super.handleMousePress(event);
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"ButtonSoundTheme",this.clickSoundEffect);
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
        
        override public function set selected(value:Boolean) : void
        {
            super.selected = value;
            if(!value)
            {
                this.unhighlightButton();
            }
        }
        
        protected function highlightButton() : *
        {
            if(!this.doAnimations)
            {
            }
        }
        
        protected function unhighlightButton() : *
        {
            if(!this.doAnimations)
            {
            }
        }
    }
}
