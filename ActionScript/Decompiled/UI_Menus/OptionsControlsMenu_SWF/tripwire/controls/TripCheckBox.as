package tripwire.controls
{
    import flash.events.MouseEvent;
    import scaleform.clik.controls.CheckBox;
    import scaleform.gfx.Extensions;
    
    public class TripCheckBox extends CheckBox
    {
         
        
        private var _key:int = -1;
        
        public function TripCheckBox()
        {
            super();
        }
        
        public function set Key(param1:int) : void
        {
            this._key = param1;
        }
        
        public function get Key() : int
        {
            return this._key;
        }
        
        override protected function handleMousePress(param1:MouseEvent) : void
        {
            super.handleMousePress(param1);
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"ButtonSoundTheme","Button_Selected");
            }
        }
        
        override protected function handlePress(param1:uint = 0) : void
        {
            super.handlePress(param1);
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"ButtonSoundTheme","Button_Selected");
            }
        }
    }
}
