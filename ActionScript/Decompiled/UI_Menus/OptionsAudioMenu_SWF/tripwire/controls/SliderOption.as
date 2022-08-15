package tripwire.controls
{
    import flash.text.TextField;
    import scaleform.clik.controls.Button;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.events.SliderEvent;
    
    public class SliderOption extends UIComponent
    {
         
        
        public var valueTextField:TextField;
        
        public var textField:TextField;
        
        public var slider:TripSlider;
        
        public var backgroundButton:Button;
        
        public function SliderOption()
        {
            super();
            this.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.sliderValueChanged,false,0,true);
            addEventListener(InputEvent.INPUT,this.pushSliderInput,false,0,true);
            this.slider.snapping = true;
            this.slider.snapInterval = 1;
        }
        
        public function set label(param1:String) : void
        {
            this.textField.text = param1;
        }
        
        public function set sliderValue(param1:int) : void
        {
            this.slider.value = param1;
        }
        
        protected function sliderValueChanged(param1:SliderEvent) : void
        {
            if(this.valueTextField)
            {
                this.valueTextField.text = param1.value.toString();
            }
        }
        
        public function pushSliderInput(param1:InputEvent) : void
        {
            this.slider.handleInput(param1);
        }
        
        override protected function changeFocus() : void
        {
            this.backgroundButton.selected = focused == 1 ? true : false;
        }
    }
}
