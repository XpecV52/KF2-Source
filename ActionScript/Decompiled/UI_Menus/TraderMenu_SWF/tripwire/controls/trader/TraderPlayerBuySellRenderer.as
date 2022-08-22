package tripwire.controls.trader
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.text.TextField;
    import scaleform.gfx.TextFieldEx;
    import tripwire.controls.TripListItemRenderer;
    
    public class TraderPlayerBuySellRenderer extends TripListItemRenderer
    {
         
        
        public var controllerIcon:MovieClip;
        
        public var valueTextField:TextField;
        
        private var _buttonValue:String;
        
        public var PlusIcon:MovieClip;
        
        public var AmmoIcon:MovieClip;
        
        public var hitMC:MovieClip;
        
        public var arrow:MovieClip;
        
        public var BG:MovieClip;
        
        public function TraderPlayerBuySellRenderer()
        {
            super();
            preventAutosizing = true;
            constraintsDisabled = true;
            TextFieldEx.setTextAutoSize(textField,"shrink");
            TextFieldEx.setVerticalAlign(textField,"center");
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
            if(this.valueTextField)
            {
                this.valueTextField.text = param1;
            }
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
                this.enabled = param1.buttonState;
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
                this.enabled = true;
                mouseEnabled = true;
                selectable = true;
                alpha = 1;
            }
            else if(param1 == 1)
            {
                this.enabled = true;
                alpha = 0.32;
                mouseEnabled = false;
                selectable = false;
            }
            else
            {
                this.enabled = false;
                selectable = false;
                alpha = 1;
            }
        }
        
        override public function set enabled(param1:Boolean) : void
        {
            super.enabled = param1;
            mouseEnabled = true;
            this.bgVisibility = !!bManagerUsingGamepad ? false : true;
            if(!param1)
            {
                this.controllerIconVisibility = false;
            }
        }
        
        override protected function handleMouseRollOver(param1:MouseEvent) : void
        {
            if(!enabled)
            {
                dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OVER));
            }
            super.handleMouseRollOver(param1);
        }
        
        public function set controllerIconVisibility(param1:Boolean) : void
        {
            this.controllerIcon.visible = !!enabled ? Boolean(param1) : false;
        }
        
        public function set bgVisibility(param1:Boolean) : void
        {
            this.arrow.visible = param1;
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
