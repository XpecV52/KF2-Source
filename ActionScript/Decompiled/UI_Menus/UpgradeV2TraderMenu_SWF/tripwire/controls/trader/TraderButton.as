package tripwire.controls.trader
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import tripwire.controls.TripButton;
    
    public class TraderButton extends TripButton
    {
         
        
        public var valueTextField:TextField;
        
        public var cannotUseTextField:TextField;
        
        public var controllerIcon:MovieClip;
        
        public var doshIcon:MovieClip;
        
        private var _buttonValue:String;
        
        public function TraderButton()
        {
            super();
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
            if(this.valueTextField != null)
            {
                this.valueTextField.text = param1;
            }
            invalidateData();
            this.setUsableButtonVisability(enabled);
        }
        
        override protected function updateText() : void
        {
            super.updateText();
            if(this.valueTextField != null && this.buttonValue != null)
            {
                this.valueTextField.text = this.buttonValue;
            }
            this.setUsableButtonVisability(enabled);
        }
        
        public function setUsableButtonVisability(param1:Boolean) : *
        {
            if(this.cannotUseTextField != null)
            {
                this.cannotUseTextField.visible = !param1;
            }
            if(textField != null)
            {
                textField.visible = param1;
            }
            if(this.doshIcon != null)
            {
                this.doshIcon.visible = param1;
            }
            if(this.valueTextField != null)
            {
                this.valueTextField.visible = param1;
            }
        }
    }
}
