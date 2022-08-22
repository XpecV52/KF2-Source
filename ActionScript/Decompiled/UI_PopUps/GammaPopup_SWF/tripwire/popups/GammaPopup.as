package tripwire.popups
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.events.SliderEvent;
    import scaleform.clik.managers.FocusHandler;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.Extensions;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripSlider;
    import tripwire.controls.TripUILoader;
    
    public class GammaPopup extends BasePopup
    {
         
        
        public var ApplyButton:TripButton;
        
        public var DefaultButton:TripButton;
        
        public var BackButton:TripButton;
        
        public var GammaImageLoader:TripUILoader;
        
        public var gammaDescriptionTxt:TextField;
        
        public var applyButtonIcon:MovieClip;
        
        public var defaultButtonIcon:MovieClip;
        
        public var applyTextField:TextField;
        
        public var defaultTextField:TextField;
        
        public var mainSlider:TripSlider;
        
        public var genericSliderSoundEffect:String = "GEN_Click";
        
        public function GammaPopup()
        {
            super();
            this.mainSlider.addEventListener(SliderEvent.VALUE_CHANGE,this.onGammaSliderChanged);
            this.DefaultButton.addEventListener(ButtonEvent.PRESS,this.onResetGamma);
            this.ApplyButton.addEventListener(ButtonEvent.PRESS,this.onApplyGamma);
            defaultFirstElement = currentElement = this.mainSlider;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.updateControllerVisibility(bManagerUsingGamepad);
        }
        
        override public function setTabIndex() : void
        {
            super.setTabIndex();
            this.mainSlider.tabIndex = 1;
        }
        
        public function updateControllerVisibility(param1:Boolean) : void
        {
            if(param1)
            {
                this.mainSlider.focusable = true;
                FocusHandler.getInstance().setFocus(this.mainSlider);
            }
            else
            {
                this.mainSlider.focused = 0;
                this.mainSlider.focusable = false;
            }
            this.ApplyButton.visible = !param1;
            this.DefaultButton.visible = !param1;
            this.applyButtonIcon.visible = param1;
            this.defaultButtonIcon.visible = param1;
            this.applyTextField.visible = param1;
            this.defaultTextField.visible = param1;
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
        }
        
        private function onApplyGamma(param1:Event) : void
        {
            ExternalInterface.call("Callback_ClosedPopup");
        }
        
        private function onResetGamma(param1:Event) : void
        {
            ExternalInterface.call("Callback_DefaultGamma");
        }
        
        private function onGammaSliderChanged(param1:SliderEvent) : void
        {
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"UI",this.genericSliderSoundEffect);
            }
            ExternalInterface.call("Callback_GammaChanged",param1.value);
        }
        
        public function set imagePath(param1:String) : void
        {
            this.GammaImageLoader.source = param1;
        }
        
        override public function openPopup() : void
        {
            super.openPopup();
            this.updateControllerVisibility(bManagerUsingGamepad);
        }
        
        override public function setPopupText(param1:String, param2:String, param3:String, param4:String, param5:String) : *
        {
            this.gammaDescriptionTxt.text = param2;
            this.DefaultButton.label = param3;
            this.ApplyButton.label = param4;
            this.applyTextField.text = param4;
            this.defaultTextField.text = param3;
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            if(param1.handled)
            {
                return;
            }
            if(!_bReadyForInput)
            {
                return;
            }
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_A:
                        ExternalInterface.call("Callback_ClosedPopup");
                        param1.handled;
                        break;
                    case NavigationCode.GAMEPAD_X:
                        ExternalInterface.call("Callback_DefaultGamma");
                        param1.handled;
                }
            }
        }
    }
}
