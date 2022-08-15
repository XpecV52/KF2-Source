package tripwire.controls
{
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.ui.InputDetails;
    
    public class ControllerButton extends UIComponent
    {
         
        
        private var _bActive:Boolean = true;
        
        public function ControllerButton()
        {
            super();
        }
        
        public function get bActive() : *
        {
            return this._bActive;
        }
        
        public function set bActive(param1:Boolean) : *
        {
            this._bActive = param1;
        }
        
        public function SetGamepadInput(param1:Boolean) : void
        {
            if(this._bActive)
            {
                this.visible = param1;
            }
        }
        
        public function handleButtonInput(param1:InputDetails) : void
        {
            if(param1.value == InputValue.KEY_DOWN)
            {
                this.selected();
            }
            if(param1.value == InputValue.KEY_UP)
            {
                this.unselected();
            }
        }
        
        public function selected() : void
        {
        }
        
        public function unselected() : void
        {
        }
    }
}
