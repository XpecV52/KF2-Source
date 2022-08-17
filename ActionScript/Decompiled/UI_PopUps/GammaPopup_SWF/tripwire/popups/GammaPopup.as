package tripwire.popups
{
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.SliderEvent;
    import scaleform.clik.managers.FocusHandler;
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
        
        public var mainSlider:TripSlider;
        
        public function GammaPopup()
        {
            super();
            this.mainSlider.addEventListener(SliderEvent.VALUE_CHANGE,this.onGammaSliderChanged);
            this.DefaultButton.addEventListener(ButtonEvent.PRESS,this.onResetGamma);
            this.ApplyButton.addEventListener(ButtonEvent.PRESS,this.onApplyGamma);
            defaultFirstElement = currentElement = this.mainSlider;
        }
        
        override public function setTabIndex() : void
        {
            super.setTabIndex();
            this.mainSlider.tabIndex = 1;
            this.ApplyButton.tabIndex = 2;
            this.DefaultButton.tabIndex = 3;
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
            ExternalInterface.call("Callback_GammaChanged",param1.value);
        }
        
        public function set imagePath(param1:String) : void
        {
            this.GammaImageLoader.source = param1;
        }
        
        override public function setPopupText(param1:String, param2:String, param3:String, param4:String, param5:String) : *
        {
            this.gammaDescriptionTxt.text = param2;
            this.DefaultButton.label = param3;
            this.ApplyButton.label = param4;
            FocusHandler.getInstance().setFocus(currentElement);
        }
    }
}
