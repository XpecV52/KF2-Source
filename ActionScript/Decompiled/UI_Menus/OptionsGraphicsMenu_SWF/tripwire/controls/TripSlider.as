package tripwire.controls
{
    import flash.events.MouseEvent;
    import scaleform.clik.controls.Slider;
    import scaleform.gfx.Extensions;
    
    public class TripSlider extends Slider
    {
         
        
        public function TripSlider()
        {
            super();
        }
        
        override protected function endDrag(param1:MouseEvent) : void
        {
            super.endDrag(param1);
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"ButtonSoundTheme","Button_Selected");
            }
        }
        
        override public function set value(param1:Number) : void
        {
            super.value = param1;
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"ButtonSoundTheme","Button_Selected");
            }
        }
    }
}
