package tripwire.controls
{
    import flash.events.MouseEvent;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.Slider;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.Extensions;
    
    public class TripSlider extends Slider
    {
         
        
        public var snapMax:Number = 5;
        
        private var _defaultSnapInterval:Number;
        
        public function TripSlider()
        {
            super();
            this._defaultSnapInterval = snapInterval;
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
        
        override public function handleInput(param1:InputEvent) : void
        {
            if(param1.isDefaultPrevented())
            {
                return;
            }
            var _loc2_:InputDetails = param1.details;
            var _loc3_:* = _loc2_.controllerIndex;
            var _loc4_:Boolean = _loc2_.value == InputValue.KEY_DOWN || _loc2_.value == InputValue.KEY_HOLD;
            switch(_loc2_.navEquivalent)
            {
                case NavigationCode.RIGHT:
                    if(_loc4_)
                    {
                        if(_loc2_.value == InputValue.KEY_HOLD && snapInterval < this.snapMax)
                        {
                            snapInterval += 1;
                        }
                        this.value = value + _snapInterval;
                        param1.handled = true;
                    }
                    else
                    {
                        snapInterval = this._defaultSnapInterval;
                    }
                    break;
                case NavigationCode.LEFT:
                    if(_loc4_)
                    {
                        if(_loc2_.value == InputValue.KEY_HOLD && snapInterval < this.snapMax)
                        {
                            snapInterval += 1;
                        }
                        this.value = value - _snapInterval;
                        param1.handled = true;
                    }
                    else
                    {
                        snapInterval = this._defaultSnapInterval;
                    }
                    break;
                case NavigationCode.HOME:
                    if(!_loc4_)
                    {
                        this.value = minimum;
                        param1.handled = true;
                    }
                    break;
                case NavigationCode.END:
                    if(!_loc4_)
                    {
                        this.value = maximum;
                        param1.handled = true;
                    }
            }
        }
    }
}
