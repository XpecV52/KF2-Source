package tripwire.containers.optionsControls
{
    import flash.events.FocusEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.CheckBox;
    import scaleform.clik.controls.Slider;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.events.SliderEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.Extensions;
    import tripwire.containers.TripContainer;
    import tripwire.controls.SliderOption;
    import tripwire.controls.TripButton;
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
        
        public var sensitivityMinimumText:TextField;
        
        public var sensitivityMaximumText:TextField;
        
        public var zoomSensitivityMinimumText:TextField;
        
        public var zoomSensitivityMaximumText:TextField;
        
        public var controllerSensitivityMinimumText:TextField;
        
        public var controllerSensitivityMaximumText:TextField;
        
        public var controllerZoomSensitivityMinimumText:TextField;
        
        public var controllerZoomSensitivityMaximumText:TextField;
        
        public var sensitivityValueText:TextField;
        
        public var zoomSensitivityValueText:TextField;
        
        public var controllerSensitivityValueText:TextField;
        
        public var controllerZoomSensitivityValueText:TextField;
        
        public var defaultButton:TripButton;
        
        public var bOptionsInit;
        
        public var genericSliderSoundEffect:String = "GEN_Click";
        
        public function ControlsInputContainer()
        {
            super();
            if(!bManagerConsoleBuild)
            {
                this.sensitivitySliderOption.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderValueChanged,false,0,true);
                this.zoomSensitivitySliderOption.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderValueChanged,false,0,true);
                this.invertYCheckBox.addEventListener(ButtonEvent.CLICK,this.onCheckBoxClick,false,0,true);
                this.mouseSmoothingCheckBox.addEventListener(ButtonEvent.CLICK,this.onCheckBoxClick,false,0,true);
                this.defaultButton.addEventListener(ButtonEvent.CLICK,this.onButtonClick,false,0,true);
                this.forceFeedbackCheckBox.addEventListener(ButtonEvent.CLICK,this.onCheckBoxClick,false,0,true);
            }
            this.controllerSensitivitySliderOption.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderValueChanged,false,0,true);
            this.controllerZoomSensitivitySliderOption.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderValueChanged,false,0,true);
            this.controllerInvertYCheckBox.addEventListener(ButtonEvent.CLICK,this.onCheckBoxClick,false,0,true);
            this.aimAssistZoomLockOnCheckBox.addEventListener(ButtonEvent.CLICK,this.onCheckBoxClick,false,0,true);
            this.aimAssistRotationCheckBox.addEventListener(ButtonEvent.CLICK,this.onCheckBoxClick,false,0,true);
            this.aimAssistSlowDownCheckBox.addEventListener(ButtonEvent.CLICK,this.onCheckBoxClick,false,0,true);
            defaultFirstElement = !!bManagerConsoleBuild ? this.controllerSensitivitySliderOption : this.sensitivitySliderOption;
            var _loc1_:int = 1;
            if(!bManagerConsoleBuild)
            {
                this.sensitivitySliderOption.tabIndex = _loc1_++;
                this.zoomSensitivitySliderOption.tabIndex = _loc1_++;
                this.invertYCheckBox.tabIndex = _loc1_++;
                this.mouseSmoothingCheckBox.tabIndex = _loc1_++;
                this.forceFeedbackCheckBox.tabIndex = _loc1_++;
            }
            this.controllerSensitivitySliderOption.tabIndex = _loc1_++;
            this.controllerZoomSensitivitySliderOption.tabIndex = _loc1_++;
            this.controllerInvertYCheckBox.tabIndex = _loc1_++;
            this.aimAssistZoomLockOnCheckBox.tabIndex = _loc1_++;
            this.aimAssistRotationCheckBox.tabIndex = _loc1_++;
            this.aimAssistSlowDownCheckBox.tabIndex = _loc1_++;
            if(!bManagerConsoleBuild && this.defaultButton != null)
            {
                this.defaultButton.tabIndex = _loc1_++;
            }
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(!bManagerConsoleBuild)
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
                this.controllerTextField.text = !!param1.controllerString ? param1.controllerString : "";
                if(this.defaultButton != null)
                {
                    this.defaultButton.label = !!param1.resetDefault ? param1.resetDefault : "";
                }
                this.forceFeedbackCheckBox.label = !!param1.forceFeedbackLabel ? param1.forceFeedbackLabel : "";
            }
            this.controllerSensitivitySliderOption.label = !!param1.controllerSensitivityLabel ? param1.controllerSensitivityLabel : "";
            this.controllerZoomSensitivitySliderOption.label = !!param1.controllerZoomSensitivityLabel ? param1.controllerZoomSensitivityLabel : "";
            this.controllerInvertYCheckBox.label = !!param1.controllerInvertedLabel ? param1.controllerInvertedLabel : "";
            this.aimAssistZoomLockOnCheckBox.label = !!param1.aimAssistLockOnLabel ? param1.aimAssistLockOnLabel : "";
            this.aimAssistRotationCheckBox.label = !!param1.aimAssistRotationLabel ? param1.aimAssistRotationLabel : "";
            this.aimAssistSlowDownCheckBox.label = !!param1.aimAssistSlowDownLabel ? param1.aimAssistSlowDownLabel : "";
        }
        
        public function set initializeOptions(param1:Object) : void
        {
            if(!bManagerConsoleBuild)
            {
                this.sensitivitySliderOption.sliderValue = !!param1.sensitivityValue ? int(param1.sensitivityValue) : 0;
                this.sensitivitySliderOption.slider.minimum = !!param1.sensitivityValueMin ? Number(param1.sensitivityValueMin) : Number(0);
                this.sensitivitySliderOption.slider.maximum = !!param1.sensitivityValueMax ? Number(param1.sensitivityValueMax) : Number(1);
                this.sensitivityValueText.text = !!param1.sensitivityValue ? param1.sensitivityValue.toFixed(1).toString() : "0";
                this.zoomSensitivitySliderOption.sliderValue = !!param1.zoomSensitivityValue ? int(param1.zoomSensitivityValue) : 0;
                this.zoomSensitivitySliderOption.slider.minimum = !!param1.zoomSensitivityValueMin ? Number(param1.zoomSensitivityValueMin) : Number(0);
                this.zoomSensitivitySliderOption.slider.maximum = !!param1.zoomSensitivityValueMax ? Number(param1.zoomSensitivityValueMax) : Number(1);
                this.zoomSensitivityValueText.text = !!param1.zoomSensitivityValue ? param1.zoomSensitivityValue.toFixed(1).toString() : "0";
                this.sensitivityMinimumText.text = this.sensitivitySliderOption.slider.minimum.toFixed(0).toString();
                this.sensitivityMaximumText.text = this.sensitivitySliderOption.slider.maximum.toFixed(0).toString();
                this.zoomSensitivityMinimumText.text = this.zoomSensitivitySliderOption.slider.minimum.toFixed(0).toString();
                this.zoomSensitivityMaximumText.text = this.zoomSensitivitySliderOption.slider.maximum.toFixed(0).toString();
                this.mouseSmoothingCheckBox.selected = !!param1.mouseSmoothingValue ? Boolean(param1.mouseSmoothingValue) : false;
                this.invertYCheckBox.selected = !!param1.invertedValue ? Boolean(param1.invertedValue) : false;
                this.forceFeedbackCheckBox.selected = !!param1.forceFeedbackValue ? Boolean(param1.forceFeedbackValue) : false;
            }
            this.controllerSensitivitySliderOption.slider.minimum = param1.controllerSensitivityValueMin != undefined ? Number(param1.controllerSensitivityValueMin) : Number(0);
            this.controllerSensitivitySliderOption.slider.maximum = param1.controllerSensitivityValueMax != undefined ? Number(param1.controllerSensitivityValueMax) : Number(1);
            this.controllerSensitivitySliderOption.sliderValue = param1.controllerSensitivityValue != undefined ? int(param1.controllerSensitivityValue) : 0;
            this.controllerSensitivityValueText.text = param1.controllerSensitivityValue != undefined ? param1.controllerSensitivityValue.toFixed(1).toString() : "0";
            this.controllerZoomSensitivitySliderOption.slider.minimum = param1.controllerZoomSensitivityValueMin != undefined ? Number(param1.controllerZoomSensitivityValueMin) : Number(0);
            this.controllerZoomSensitivitySliderOption.slider.maximum = param1.controllerZoomSensitivityValueMax != undefined ? Number(param1.controllerZoomSensitivityValueMax) : Number(1);
            this.controllerZoomSensitivitySliderOption.sliderValue = param1.controllerZoomSensitivityValue != undefined ? int(param1.controllerZoomSensitivityValue) : 0;
            this.controllerZoomSensitivityValueText.text = param1.controllerZoomSensitivityValue != undefined ? param1.controllerZoomSensitivityValue.toFixed(1).toString() : "0";
            this.controllerSensitivityMinimumText.text = this.controllerSensitivitySliderOption.slider.minimum.toFixed(0).toString();
            this.controllerSensitivityMaximumText.text = this.controllerSensitivitySliderOption.slider.maximum.toFixed(0).toString();
            this.controllerZoomSensitivityMinimumText.text = this.controllerZoomSensitivitySliderOption.slider.minimum.toFixed(0).toString();
            this.controllerZoomSensitivityMaximumText.text = this.controllerZoomSensitivitySliderOption.slider.maximum.toFixed(0).toString();
            this.aimAssistZoomLockOnCheckBox.selected = !!param1.aimAssistLockOnValue ? Boolean(param1.aimAssistLockOnValue) : false;
            this.aimAssistRotationCheckBox.selected = !!param1.aimAssistRotationValue ? Boolean(param1.aimAssistRotationValue) : false;
            this.aimAssistSlowDownCheckBox.selected = !!param1.aimAssistSlowDownValue ? Boolean(param1.aimAssistSlowDownValue) : false;
            this.controllerInvertYCheckBox.selected = !!param1.controllerInvertedValue ? Boolean(param1.controllerInvertedValue) : false;
            this.bOptionsInit = true;
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
        }
        
        public function playSound(param1:String = "") : void
        {
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"UI",param1);
            }
        }
        
        private function onSliderValueChanged(param1:SliderEvent) : void
        {
            var _loc2_:Slider = null;
            if(!this.bOptionsInit)
            {
                return;
            }
            _loc2_ = param1.currentTarget as Slider;
            if(bManagerConsoleBuild)
            {
                switch(_loc2_)
                {
                    case this.controllerSensitivitySliderOption.slider:
                        this.playSound(this.genericSliderSoundEffect);
                        this.controllerSensitivityValueText.text = param1.value.toFixed(1).toString();
                        ExternalInterface.call("Callback_ControllerSensitivity",param1.value);
                        break;
                    case this.controllerZoomSensitivitySliderOption.slider:
                        this.playSound(this.genericSliderSoundEffect);
                        this.controllerZoomSensitivityValueText.text = param1.value.toFixed(1).toString();
                        ExternalInterface.call("Callback_ControllerZoomSensitivity",param1.value);
                }
            }
            else
            {
                switch(_loc2_)
                {
                    case this.sensitivitySliderOption.slider:
                        this.playSound(this.genericSliderSoundEffect);
                        this.sensitivityValueText.text = param1.value.toFixed(1).toString();
                        ExternalInterface.call("Callback_MouseSensitivity",param1.value);
                        break;
                    case this.zoomSensitivitySliderOption.slider:
                        this.playSound(this.genericSliderSoundEffect);
                        this.zoomSensitivityValueText.text = param1.value.toFixed(1).toString();
                        ExternalInterface.call("Callback_MouseZoomSensitivity",param1.value);
                        break;
                    case this.controllerSensitivitySliderOption.slider:
                        this.playSound(this.genericSliderSoundEffect);
                        this.controllerSensitivityValueText.text = param1.value.toFixed(1).toString();
                        ExternalInterface.call("Callback_ControllerSensitivity",param1.value);
                        break;
                    case this.controllerZoomSensitivitySliderOption.slider:
                        this.playSound(this.genericSliderSoundEffect);
                        this.controllerZoomSensitivityValueText.text = param1.value.toFixed(1).toString();
                        ExternalInterface.call("Callback_ControllerZoomSensitivity",param1.value);
                }
            }
        }
        
        private function onCheckBoxClick(param1:ButtonEvent) : void
        {
            var _loc2_:CheckBox = null;
            if(!this.bOptionsInit)
            {
                return;
            }
            _loc2_ = param1.currentTarget as CheckBox;
            if(bManagerConsoleBuild)
            {
                switch(_loc2_)
                {
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
                }
            }
            else
            {
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
        }
        
        override protected function openAnimation(param1:Boolean = true) : *
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
        
        protected function onButtonClick(param1:ButtonEvent) : void
        {
            if(param1.target == this.defaultButton)
            {
                ExternalInterface.call("CallBack_ResetInputOptions");
            }
        }
    }
}
