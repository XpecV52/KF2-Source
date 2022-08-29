package tripwire.controls.trader
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import scaleform.gfx.Extensions;
    import scaleform.gfx.TextFieldEx;
    import tripwire.controls.TripButton;
    
    public class TraderAutofillButton extends TripButton
    {
         
        
        public var buttonIcon:MovieClip;
        
        public var valueTextField:TextField;
        
        public var bUsingGamepad:Boolean;
        
        private var _buttonValue:String;
        
        private var _buttonState:int;
        
        public var ArrowIcon:MovieClip;
        
        public function TraderAutofillButton()
        {
            super();
            clickSoundEffect = "TRADER_MAGFILL_BUTTON_CLICK";
            overSoundEffect = "TRADER_MAGFILL_BUTTON_ROLLOVER";
            TextFieldEx.setTextAutoSize(textField,"shrink");
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
        }
        
        override protected function updateText() : void
        {
            super.updateText();
            TextFieldEx.setTextAutoSize(textField,"shrink");
            if(this.valueTextField != null && this.buttonValue != null)
            {
                this.valueTextField.text = this.buttonValue;
            }
        }
        
        public function get buttonState() : int
        {
            return this._buttonState;
        }
        
        public function set buttonState(param1:int) : *
        {
            this._buttonState = param1;
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
                selected = focused == 1;
            }
            else
            {
                selected = false;
            }
        }
        
        override protected function highlightButton() : *
        {
            if(!this.bUsingGamepad)
            {
            }
            if(Extensions.gfxProcessSound != null && enabled == true)
            {
                Extensions.gfxProcessSound(this,"UI",overSoundEffect);
            }
        }
        
        override protected function unhighlightButton() : *
        {
            if(!this.bUsingGamepad)
            {
            }
        }
    }
}
