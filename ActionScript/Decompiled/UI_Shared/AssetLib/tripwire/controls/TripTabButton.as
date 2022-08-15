package tripwire.controls
{
    import flash.events.MouseEvent;
    import scaleform.clik.controls.Button;
    import scaleform.gfx.Extensions;
    
    public class TripTabButton extends Button
    {
         
        
        public function TripTabButton()
        {
            super();
        }
        
        override protected function handlePress(param1:uint = 0) : void
        {
            super.handlePress(param1);
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"ButtonSoundTheme","Tab_Selected");
            }
        }
        
        override protected function handleMousePress(param1:MouseEvent) : void
        {
            super.handleMousePress(param1);
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"ButtonSoundTheme","Tab_Selected");
            }
        }
    }
}
