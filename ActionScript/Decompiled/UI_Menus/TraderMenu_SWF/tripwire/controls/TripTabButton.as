package tripwire.controls
{
    import flash.events.MouseEvent;
    import scaleform.clik.controls.Button;
    import scaleform.gfx.Extensions;
    
    public class TripTabButton extends Button
    {
         
        
        public var tabClickSoundEffect = "";
        
        public var tabOverSoundEffect = "";
        
        public function TripTabButton()
        {
            super();
        }
        
        override protected function handlePress(param1:uint = 0) : void
        {
            super.handlePress(param1);
            if(Extensions.gfxProcessSound != null && enabled == true)
            {
                Extensions.gfxProcessSound(this,"UI",this.tabClickSoundEffect);
            }
        }
        
        override protected function handleMousePress(param1:MouseEvent) : void
        {
            super.handleMousePress(param1);
            if(Extensions.gfxProcessSound != null && enabled == true)
            {
                Extensions.gfxProcessSound(this,"UI",this.tabClickSoundEffect);
            }
        }
        
        override protected function handleMouseRollOver(param1:MouseEvent) : void
        {
            super.handleMouseRollOver(param1);
            if(Extensions.gfxProcessSound != null && enabled == true && selected == false)
            {
                Extensions.gfxProcessSound(this,"UI",this.tabOverSoundEffect);
            }
        }
    }
}
