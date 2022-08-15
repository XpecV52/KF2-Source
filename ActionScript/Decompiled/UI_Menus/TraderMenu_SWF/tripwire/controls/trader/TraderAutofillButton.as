package tripwire.controls.trader
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import tripwire.controls.TripButton;
    
    public class TraderAutofillButton extends TripButton
    {
         
        
        public var buttonIcon:MovieClip;
        
        public var valueTextField:TextField;
        
        public var bUsingGamepad:Boolean;
        
        private var _buttonValue:String;
        
        public function TraderAutofillButton()
        {
            super();
            this.buttonIcon.visible = false;
        }
        
        public function get buttonValue() : String
        {
            return this._buttonValue;
        }
        
        public function set buttonValue(param1:String) : void
        {
            if(this._buttonValue == param1)
            {
                return;
            }
            this._buttonValue = param1;
            this.valueTextField.text = param1;
            invalidateData();
            this.buttonIcon.visible = false;
        }
        
        override protected function updateText() : void
        {
            super.updateText();
            if(this.valueTextField != null && this.buttonValue != null)
            {
                this.valueTextField.text = this.buttonValue;
            }
        }
        
        public function set buttonState(param1:int) : *
        {
            if(param1 == 0)
            {
                enabled = true;
                mouseEnabled = true;
                alpha = 1;
            }
            else if(param1 == 1)
            {
                enabled = true;
                alpha = 0.32;
                mouseEnabled = false;
            }
            else
            {
                enabled = false;
                alpha = 1;
            }
        }
        
        override protected function changeFocus() : void
        {
            if(this.bUsingGamepad)
            {
                this.buttonIcon.visible = focused == 1;
                selected = focused == 1;
            }
            else
            {
                this.buttonIcon.visible = false;
                selected = false;
            }
        }
        
        override protected function highlightButton() : *
        {
        }
        
        override protected function unhighlightButton() : *
        {
        }
    }
}
