package tripwire.controls
{
    import flash.events.FocusEvent;
    import flash.events.MouseEvent;
    import scaleform.clik.controls.CheckBox;
    import scaleform.gfx.Extensions;
    import tripwire.managers.MenuManager;
    
    public class TripCheckBox extends CheckBox
    {
         
        
        private var _key:int = -1;
        
        public var clickSoundEffect:String = "SHARED_BUTTON_CLICK";
        
        public var overSoundEffect:String = "SHARED_BUTTON_MOUSEOVER";
        
        public function TripCheckBox()
        {
            super();
            addEventListener(FocusEvent.FOCUS_IN,this.handleFocusIn,false,0,true);
        }
        
        public function set Key(param1:int) : void
        {
            this._key = param1;
        }
        
        public function get Key() : int
        {
            return this._key;
        }
        
        override protected function handleMouseRelease(param1:MouseEvent) : void
        {
            super.handleMouseRelease(param1);
            if(Extensions.gfxProcessSound != null && enabled)
            {
                Extensions.gfxProcessSound(this,"UI",this.clickSoundEffect);
            }
        }
        
        override protected function handleRelease(param1:uint = 0) : void
        {
            super.handleRelease(param1);
            if(Extensions.gfxProcessSound != null && enabled)
            {
                Extensions.gfxProcessSound(this,"UI",this.clickSoundEffect);
            }
        }
        
        override protected function handleMouseRollOver(param1:MouseEvent) : void
        {
            super.handleMouseRollOver(param1);
            if(Extensions.gfxProcessSound != null && enabled)
            {
                Extensions.gfxProcessSound(this,"UI",this.overSoundEffect);
            }
        }
        
        protected function handleFocusIn(param1:FocusEvent) : *
        {
            if(!enabled)
            {
                return;
            }
            addEventListener(FocusEvent.FOCUS_OUT,this.handleFocusOut,false,0,true);
            removeEventListener(FocusEvent.FOCUS_IN,this.handleFocusIn);
            if(Extensions.gfxProcessSound != null && enabled == true && MenuManager.manager.bUsingGamepad)
            {
                Extensions.gfxProcessSound(this,"UI",this.overSoundEffect);
            }
        }
        
        protected function handleFocusOut(param1:FocusEvent) : *
        {
            if(!enabled)
            {
                return;
            }
            addEventListener(FocusEvent.FOCUS_IN,this.handleFocusIn,false,0,true);
            removeEventListener(FocusEvent.FOCUS_OUT,this.handleFocusOut);
        }
    }
}
