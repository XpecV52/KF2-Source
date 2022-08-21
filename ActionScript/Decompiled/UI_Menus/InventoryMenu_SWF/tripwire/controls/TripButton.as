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
        
        override public function get enabled() : Boolean
        {
            return super.enabled;
        }
        
        override public function set enabled(param1:Boolean) : void
        {
            super.enabled = param1;
            focusable = param1;
        }
        
        protected function handleFocusIn(param1:FocusEvent) : *
        {
            if(!this.enabled)
            {
                return;
            }
            addEventListener(FocusEvent.FOCUS_OUT,this.handleFocusOut,false,0,true);
            removeEventListener(FocusEvent.FOCUS_IN,this.handleFocusIn);
            if(!selected)
            {
                this.highlightButton();
            }
        }
        
        protected function handleFocusOut(param1:FocusEvent) : *
        {
            if(!this.enabled)
            {
                return;
            }
            addEventListener(FocusEvent.FOCUS_IN,this.handleFocusIn,false,0,true);
            removeEventListener(FocusEvent.FOCUS_OUT,this.handleFocusOut);
            if(!selected)
            {
                this.unhighlightButton();
            }
        }
        
        override protected function handleMouseRollOver(param1:MouseEvent) : void
        {
            if(!this.enabled)
            {
                return;
            }
            super.handleMouseRollOver(param1);
            if(!selected)
            {
                this.highlightButton();
            }
        }
        
        override protected function handleMouseRollOut(param1:MouseEvent) : void
        {
            if(!this.enabled)
            {
                return;
            }
            super.handleMouseRollOut(param1);
            if(!selected)
            {
                this.unhighlightButton();
            }
        }
        
        override protected function handleMousePress(param1:MouseEvent) : void
        {
            if(!this.enabled)
            {
                return;
            }
            super.handleMousePress(param1);
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"ButtonSoundTheme",this.clickSoundEffect);
            }
        }
        
        override protected function handlePress(param1:uint = 0) : void
        {
            if(!this.enabled)
            {
                return;
            }
            super.handlePress(param1);
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"ButtonSoundTheme",this.clickSoundEffect);
            }
        }
        
        override public function set selected(param1:Boolean) : void
        {
            super.selected = param1;
            if(!param1)
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
