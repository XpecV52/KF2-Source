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
        
        private var _buttonState:int;
        
        public var PlusIcon:MovieClip;
        
        public var AmmoIcon:MovieClip;
        
        public var hitMC:MovieClip;
        
        public var BG:MovieClip;
        
        public function TraderPlayerAmmoItemRenderer()
        {
            super();
            preventAutosizing = true;
            this.controllerIconVisibility = false;
            clickSoundEffect = "TRADER_MAGFILL_BUTTON_CLICK";
            overSoundEffect = "TRADER_MAGFILL_BUTTON_ROLLOVER";
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
            hitArea = this.hitMC;
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
        
        public function get buttonState() : int
        {
            return this._buttonState;
        }
        
        public function set buttonState(param1:int) : void
        {
            this._buttonState = param1;
            if(this.buttonIcon.visible)
            {
                this.controllerIconVisibility = bManagerUsingGamepad;
            }
            if(param1 == 0)
            {
                enabled = true;
                mouseEnabled = true;
                selectable = true;
                alpha = 1;
            }
            else if(param1 == 1)
            {
                enabled = false;
                alpha = 0.32;
                setState("up");
                mouseEnabled = true;
                selectable = false;
            }
            else
            {
                enabled = false;
                mouseEnabled = true;
                selectable = false;
                alpha = 1;
            }
        }
        
        public function set controllerIconVisibility(param1:Boolean) : void
        {
            if(this.buttonState != 0)
            {
                this.buttonIcon.visible = false;
                this.PlusIcon.visible = true;
                this.AmmoIcon.visible = true;
            }
            else
            {
                if(param1)
                {
                    trace("MAG/FILL ICONS SHOWN: " + this.index);
                }
                this.buttonIcon.visible = param1;
                this.PlusIcon.visible = !param1;
                this.AmmoIcon.visible = !param1;
            }
        }
        
        public function set bgVisibility(param1:Boolean) : void
        {
            this.BG.visible = param1;
        }
        
        override protected function highlightButton() : *
        {
        }
        
        override protected function unhighlightButton() : *
        {
        }
    }
}
