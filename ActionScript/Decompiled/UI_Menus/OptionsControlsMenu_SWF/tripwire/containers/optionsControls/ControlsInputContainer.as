package tripwire.containers.optionsControls
{
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.SliderEvent;
    import scaleform.clik.ui.InputDetails;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripCheckBox;
    
    public class ControlsInputContainer extends TripContainer
    {
         
        
        public var sensitivitySliderOption:SliderOption;
        
        public var invertYCheckBox:TripCheckBox;
        
        public var controllerSensitivitySliderOption:SliderOption;
        
        public var controllerInvertYCheckBox:TripCheckBox;
        
        public var controllerTextField:TextField;
        
        public var sectionTextField:TextField;
        
        public function ControlsInputContainer()
        {
            super();
            this.sensitivitySliderOption.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSensitivityChanged,false,0,true);
            this.invertYCheckBox.addEventListener(ButtonEvent.CLICK,this.onInvertY,false,0,true);
            this.controllerSensitivitySliderOption.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onControllerSensitivityChanged,false,0,true);
            this.controllerInvertYCheckBox.addEventListener(ButtonEvent.CLICK,this.onControllerInvertY,false,0,true);
            defaultFirstElement = this.sensitivitySliderOption;
            this.invertYCheckBox.tabIndex = 1;
            this.sensitivitySliderOption.tabIndex = 2;
            this.controllerSensitivitySliderOption.tabIndex = 3;
            this.controllerInvertYCheckBox.tabIndex = 4;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.sensitivitySliderOption.label = !!param1.sensitivityLabel ? param1.sensitivityLabel : "";
            this.invertYCheckBox.label = !!param1.invertedLabel ? param1.invertedLabel : "";
            this.sectionTextField.text = !!param1.Mouse ? param1.Mouse : "";
            this.controllerSensitivitySliderOption.label = !!param1.controllerSensitivityLabel ? param1.controllerSensitivityLabel : "";
            this.controllerInvertYCheckBox.label = !!param1.controllerInvertedLabel ? param1.controllerInvertedLabel : "";
            this.controllerTextField.text = !!param1.controllerString ? param1.controllerString : "";
        }
        
        public function set initializeOptions(param1:Object) : void
        {
            this.sensitivitySliderOption.sliderValue = !!param1.sensitivityValue ? int(param1.sensitivityValue) : 0;
            this.invertYCheckBox.selected = !!param1.invertedValue ? Boolean(param1.invertedValue) : false;
            this.controllerSensitivitySliderOption.sliderValue = !!param1.controllerSensitivityValue ? int(param1.controllerSensitivityValue) : 0;
            this.controllerInvertYCheckBox.selected = !!param1.controllerInvertedValue ? Boolean(param1.controllerInvertedValue) : false;
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
        }
        
        private function onControllerSensitivityChanged(param1:SliderEvent) : void
        {
            ExternalInterface.call("Callback_ControllerSensitivity",param1.value);
        }
        
        private function onControllerInvertY(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_ControllerInvertChanged",this.controllerInvertYCheckBox.selected);
        }
        
        private function onSensitivityChanged(param1:SliderEvent) : void
        {
            ExternalInterface.call("Callback_MouseSensitivity",param1.value);
        }
        
        private function onInvertY(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_InvertChanged",this.invertYCheckBox.selected);
        }
        
        override protected function openAnimation() : *
        {
            alpha = 1;
            visible = true;
        }
        
        override protected function closeAnimation() : *
        {
            visible = false;
        }
        
        override protected function pushToBackAnimation() : *
        {
        }
    }
}
