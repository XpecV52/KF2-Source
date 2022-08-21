package tripwire.controls
{
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.OptionStepper;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.ui.InputDetails;
    
    public class TripOptionStepper extends OptionStepper
    {
         
        
        public function TripOptionStepper()
        {
            super();
        }
        
        override protected function onNext(param1:Object) : void
        {
            if(_selectedIndex < _dataProvider.length - 1)
            {
                selectedIndex += 1;
            }
            else
            {
                selectedIndex = 0;
            }
            invalidateSelectedIndex();
        }
        
        override protected function onPrev(param1:Object) : void
        {
            if(_selectedIndex > 0)
            {
                selectedIndex = selectedIndex - 1;
            }
            else
            {
                selectedIndex = _dataProvider.length - 1;
            }
            invalidateSelectedIndex();
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
                        this.onNext(null);
                    }
                    param1.handled = true;
                    break;
                case NavigationCode.LEFT:
                    if(_loc4_)
                    {
                        this.onPrev(null);
                    }
                    param1.handled = true;
                    break;
                case NavigationCode.HOME:
                    if(!_loc4_)
                    {
                        selectedIndex = 0;
                    }
                    param1.handled = true;
                    break;
                case NavigationCode.END:
                    if(!_loc4_)
                    {
                        selectedIndex = _dataProvider.length - 1;
                    }
                    param1.handled = true;
            }
        }
    }
}
