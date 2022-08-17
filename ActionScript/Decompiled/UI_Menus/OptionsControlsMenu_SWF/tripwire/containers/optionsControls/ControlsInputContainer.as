package tripwire.containers.optionsControls
{
    import flash.events.FocusEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.CheckBox;
    import scaleform.clik.controls.Slider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.events.SliderEvent;
    import scaleform.clik.ui.InputDetails;
    import tripwire.containers.TripContainer;
    import tripwire.controls.SliderOption;
    import tripwire.controls.TripCheckBox;
    
    public class ControlsInputContainer extends TripContainer
    {
         
        
        public var sensitivitySliderOption:SliderOption;
        
        public var zoomSensitivitySliderOption:SliderOption;
        
        public var invertYCheckBox:TripCheckBox;
        
        public var mouseSmoothingCheckBox:TripCheckBox;
        
        public var controllerSensitivitySliderOption:SliderOption;
        
        public var controllerZoomSensitivitySliderOption:SliderOption;
        
        public var controllerInvertYCheckBox:TripCheckBox;
        
        public var aimAssistZoomLockOnCheckBox:TripCheckBox;
        
        public var aimAssistRotationCheckBox:TripCheckBox;
        
        public var aimAssistSlowDownCheckBox:TripCheckBox;
        
        public var forceFeedbackCheckBox:TripCheckBox;
        
        public var controllerTextField:TextField;
        
        public var sectionTextField:TextField;
        
        public function ControlsInputContainer()
        {
            super();
            this.sensitivitySliderOption.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderValueChanged,false,0,true);
            this.zoomSensitivitySliderOption.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderValueChanged,false,0,true);
            this.invertYCheckBox.addEventListener(ButtonEvent.CLICK,this.onCheckBoxClick,false,0,true);
            this.mouseSmoothingCheckBox.addEventListener(ButtonEvent.CLICK,this.onCheckBoxClick,false,0,true);
            this.controllerSensitivitySliderOption.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderValueChanged,false,0,true);
            this.controllerZoomSensitivitySliderOption.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderValueChanged,false,0,true);
            this.controllerInvertYCheckBox.addEventListener(ButtonEvent.CLICK,this.onCheckBoxClick,false,0,true);
            this.aimAssistZoomLockOnCheckBox.addEventListener(ButtonEvent.CLICK,this.onCheckBoxClick,false,0,true);
            this.aimAssistRotationCheckBox.addEventListener(ButtonEvent.CLICK,this.onCheckBoxClick,false,0,true);
            this.aimAssistSlowDownCheckBox.addEventListener(ButtonEvent.CLICK,this.onCheckBoxClick,false,0,true);
            this.forceFeedbackCheckBox.addEventListener(ButtonEvent.CLICK,this.onCheckBoxClick,false,0,true);
            defaultFirstElement = this.sensitivitySliderOption;
            this.sensitivitySliderOption.tabIndex = 1;
            this.zoomSensitivitySliderOption.tabIndex = 2;
            this.invertYCheckBox.tabIndex = 3;
            this.mouseSmoothingCheckBox.tabIndex = 4;
            this.controllerSensitivitySliderOption.tabIndex = 5;
            this.controllerZoomSensitivitySliderOption.tabIndex = 6;
            this.controllerInvertYCheckBox.tabIndex = 7;
            this.aimAssistZoomLockOnCheckBox.tabIndex = 8;
            this.aimAssistRotationCheckBox.tabIndex = 9;
            this.aimAssistSlowDownCheckBox.tabIndex = 10;
            this.forceFeedbackCheckBox.tabIndex = 11;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.sensitivitySliderOption.label = !!param1.sensitivityLabel ? param1.sensitivityLabel : "";
            this.invertYCheckBox.label = !!param1.invertedLabel ? param1.invertedLabel : "";
            this.sectionTextField.text = !!param1.Mouse ? param1.Mouse : "";
            this.controllerSensitivitySliderOption.label = !!param1.controllerSensitivityLabel ? param1.controllerSensitivityLabel : "";
            this.controllerInvertYCheckBox.label = !!param1.controllerInvertedLabel ? param1.controllerInvertedLabel : "";
            this.sensitivitySliderOption.label = !!param1.sensitivityLabel ? param1.sensitivityLabel : "";
            this.zoomSensitivitySliderOption.label = !!param1.zoomSensitivityLabel ? param1.zoomSensitivityLabel : "";
            this.invertYCheckBox.label = !!param1.invertedLabel ? param1.invertedLabel : "";
            this.mouseSmoothingCheckBox.label = !!param1.mouseSmoothingLabel ? param1.mouseSmoothingLabel : "";
            this.controllerSensitivitySliderOption.label = !!param1.controllerSensitivityLabel ? param1.controllerSensitivityLabel : "";
            this.controllerZoomSensitivitySliderOption.label = !!param1.controllerZoomSensitivityLabel ? param1.controllerZoomSensitivityLabel : "";
            this.controllerInvertYCheckBox.label = !!param1.controllerInvertedLabel ? param1.controllerInvertedLabel : "";
            this.aimAssistZoomLockOnCheckBox.label = !!param1.aimAssistLockOnLabel ? param1.aimAssistLockOnLabel : "";
            this.aimAssistRotationCheckBox.label = !!param1.aimAssistRotationLabel ? param1.aimAssistRotationLabel : "";
            this.aimAssistSlowDownCheckBox.label = !!param1.aimAssistSlowDownLabel ? param1.aimAssistSlowDownLabel : "";
            this.forceFeedbackCheckBox.label = !!param1.forceFeedbackLabel ? param1.forceFeedbackLabel : "";
            this.controllerTextField.text = !!param1.controllerString ? param1.controllerString : "";
        }
        
        public function set initializeOptions(param1:Object) : void
        {
            this.sensitivitySliderOption.sliderValue = !!param1.sensitivityValue ? int(param1.sensitivityValue) : 0;
            this.sensitivitySliderOption.slider.minimum = !!param1.sensitivityValueMin ? Number(param1.sensitivityValueMin) : Number(0);
            this.sensitivitySliderOption.slider.maximum = !!param1.sensitivityValueMax ? Number(param1.sensitivityValueMax) : Number(1);
            this.zoomSensitivitySliderOption.sliderValue = !!param1.zoomSensitivityValue ? int(param1.zoomSensitivityValue) : 0;
            this.zoomSensitivitySliderOption.slider.minimum = !!param1.zoomSensitivityValueMin ? Number(param1.zoomSensitivityValueMin) : Number(0);
            this.zoomSensitivitySliderOption.slider.maximum = !!param1.zoomSensitivityValueMax ? Number(param1.zoomSensitivityValueMax) : Number(1);
            this.mouseSmoothingCheckBox.selected = !!param1.mouseSmoothingValue ? Boolean(param1.mouseSmoothingValue) : false;
            this.invertYCheckBox.selected = !!param1.invertedValue ? Boolean(param1.invertedValue) : false;
            this.controllerSensitivitySliderOption.sliderValue = !!param1.controllerSensitivityValue ? int(param1.controllerSensitivityValue) : 0;
            this.controllerSensitivitySliderOption.slider.minimum = !!param1.controllerSensitivityValueMin ? Number(param1.controllerSensitivityValueMin) : Number(0);
            this.controllerSensitivitySliderOption.slider.maximum = !!param1.controllerSensitivityValueMax ? Number(param1.controllerSensitivityValueMax) : Number(1);
            this.controllerZoomSensitivitySliderOption.sliderValue = !!param1.controllerZoomSensitivityValue ? int(param1.controllerZoomSensitivityValue) : 0;
            this.controllerZoomSensitivitySliderOption..slider.minimum = !!param1.controllerZoomSensitivityValueMin ? Number(param1.controllerZoomSensitivityValueMin) : Number(0);
            this.controllerZoomSensitivitySliderOption.slider.maximum = !!param1.controllerZoomSensitivityValueMax ? Number(param1.controllerZoomSensitivityValueMax) : Number(1);
            this.aimAssistZoomLockOnCheckBox.selected = !!param1.aimAssistLockOnValue ? Boolean(param1.aimAssistLockOnValue) : false;
            this.aimAssistRotationCheckBox.selected = !!param1.aimAssistRotationValue ? Boolean(param1.aimAssistRotationValue) : false;
            this.aimAssistSlowDownCheckBox.selected = !!param1.aimAssistSlowDownValue ? Boolean(param1.aimAssistSlowDownValue) : false;
            this.forceFeedbackCheckBox.selected = !!param1.forceFeedbackValue ? Boolean(param1.forceFeedbackValue) : false;
            this.controllerInvertYCheckBox.selected = !!param1.controllerInvertedValue ? Boolean(param1.controllerInvertedValue) : false;
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
        }
        
        private function onSliderValueChanged(param1:SliderEvent) : void
        {
            var _loc2_:Slider = null;
            _loc2_ = param1.currentTarget as Slider;
            switch(_loc2_)
            {
                case this.sensitivitySliderOption.slider:
                    ExternalInterface.call("Callback_MouseSensitivity",param1.value);
                    break;
                case this.zoomSensitivitySliderOption.slider:
                    ExternalInterface.call("Callback_MouseZoomSensitivity",param1.value);
                    break;
                case this.controllerSensitivitySliderOption.slider:
                    ExternalInterface.call("Callback_ControllerSensitivity",param1.value);
                    break;
                case this.controllerZoomSensitivitySliderOption.slider:
                    ExternalInterface.call("Callback_ControllerZoomSensitivity",param1.value);
            }
        }
        
        private function onCheckBoxClick(param1:ButtonEvent) : void
        {
            var _loc2_:CheckBox = null;
            _loc2_ = param1.currentTarget as CheckBox;
            switch(_loc2_)
            {
                case this.invertYCheckBox:
                    ExternalInterface.call("Callback_InvertChanged",_loc2_.selected);
                    break;
                case this.mouseSmoothingCheckBox:
                    ExternalInterface.call("Callback_MouseSmoothingChanged",_loc2_.selected);
                    break;
                case this.controllerInvertYCheckBox:
                    ExternalInterface.call("Callback_ControllerInvertChanged",_loc2_.selected);
                    break;
                case this.aimAssistZoomLockOnCheckBox:
                    ExternalInterface.call("Callback_AimAssistZoomLockOnChanged",_loc2_.selected);
                    break;
                case this.aimAssistRotationCheckBox:
                    ExternalInterface.call("Callback_AimAssistRotationChanged",_loc2_.selected);
                    break;
                case this.aimAssistSlowDownCheckBox:
                    ExternalInterface.call("Callback_AimAssistSlowDownChanged",_loc2_.selected);
                    break;
                case this.forceFeedbackCheckBox:
                    ExternalInterface.call("Callback_ForceFeedbackChanged",_loc2_.selected);
            }
        }
        
        override protected function openAnimation() : *
        {
            alpha = 1;
            visible = true;
            _bReadyForInput = true;
            mouseEnabled = mouseChildren = true;
        }
        
        override protected function closeAnimation() : *
        {
            mouseEnabled = mouseChildren = false;
            _bReadyForInput = false;
            visible = false;
        }
        
        override public function selectContainer() : void
        {
            visible = true;
            tabEnabled = true;
            tabChildren = true;
            bSelected = true;
            addEventListener(FocusEvent.FOCUS_IN,onFocusIn,false,0,true);
            if(stage)
            {
                stage.addEventListener(InputEvent.INPUT,handleInput,false,0,true);
            }
        }
        
        override protected function pushToBackAnimation() : *
        {
        }
    }
}
