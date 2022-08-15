package tripwire.controls.trader
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import tripwire.controls.TripListItemRenderer;
    
    public class TraderPlayerAmmoItemRenderer extends TripListItemRenderer
    {
         
        
        public var buttonIcon:MovieClip;
        
        public var valueTextField:TextField;
        
        private var _buttonValue:String;
        
        public var PlusIcon:MovieClip;
        
        public var AmmoIcon:MovieClip;
        
        public function TraderPlayerAmmoItemRenderer()
        {
            super();
            preventAutosizing = true;
            this.controllerIconVisibility = false;
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
        
        override public function set selected(param1:Boolean) : void
        {
        }
        
        override protected function updateText() : void
        {
            super.updateText();
            if(this.valueTextField != null && this.buttonValue != null)
            {
                this.valueTextField.text = this.buttonValue;
            }
        }
        
        override public function setData(param1:Object) : void
        {
            if(param1)
            {
                super.setData(param1);
                this.buttonValue = !!param1.buttonValue ? param1.buttonValue : "0";
                this.buttonState = !!param1.buttonState ? int(param1.buttonState) : 0;
                visible = true;
            }
            else
            {
                visible = false;
            }
        }
        
        public function set buttonState(param1:int) : void
        {
            if(param1 == 0)
            {
                enabled = true;
                mouseEnabled = true;
                selectable = true;
                alpha = 1;
            }
            else if(param1 == 1)
            {
                enabled = true;
                alpha = 0.32;
                mouseEnabled = false;
                selectable = false;
            }
            else
            {
                enabled = false;
                selectable = false;
                alpha = 1;
            }
        }
        
        public function set controllerIconVisibility(param1:Boolean) : void
        {
            this.buttonIcon.visible = param1;
            this.PlusIcon.visible = !param1;
            this.AmmoIcon.visible = !param1;
        }
        
        override protected function highlightButton() : *
        {
        }
        
        override protected function unhighlightButton() : *
        {
        }
    }
}
