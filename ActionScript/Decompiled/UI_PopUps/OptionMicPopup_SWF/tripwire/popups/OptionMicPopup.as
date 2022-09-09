package tripwire.popups
{
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import flash.utils.Timer;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.events.SliderEvent;
    import tripwire.controls.SliderOption;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripDropDownMenu;
    
    public class OptionMicPopup extends BasePopup
    {
         
        
        public var title:TextField;
        
        public var acceptButton:TripButton;
        
        public var declineButton:TripButton;
        
        public var checkMicButton:TripButton;
        
        public var stopMicButton:TripButton;
        
        public var devicesTextField:TextField;
        
        public var devicesDropDown:TripDropDownMenu;
        
        public var micVolumeSlider:SliderOption;
        
        public var sliderTextField:TextField;
        
        public var refreshButton:TripButton;
        
        public function OptionMicPopup()
        {
            super();
        }
        
        override public function openPopup() : void
        {
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.openPopup();
            this.acceptButton.addEventListener(ButtonEvent.PRESS,this.onBtnAcceptClick,false,0,true);
            this.declineButton.addEventListener(ButtonEvent.PRESS,this.onBtnDeclineClick,false,0,true);
            this.devicesDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onDeviceChanged,false,0,true);
            this.refreshButton.addEventListener(ButtonEvent.PRESS,this.onRefreshButtonClick,false,0,true);
            this.micVolumeSlider.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged,false,0,true);
            this.checkMicButton.addEventListener(ButtonEvent.PRESS,this.onCheckMicClick,false,0,true);
            this.stopMicButton.addEventListener(ButtonEvent.PRESS,this.onStopMicClick,false,0,true);
            this.startTimer();
        }
        
        public function set setTextLocalized(param1:Object) : *
        {
            this.devicesTextField.text = param1.devicesTextField;
            this.micVolumeSlider.textField.text = "";
            this.sliderTextField.text = param1.sliderTextField;
            this.checkMicButton.label = param1.checkMicButton;
            this.stopMicButton.label = param1.stopMicButton;
            this.refreshButton.label = param1.refreshButton;
            this.stopMicButton.visible = false;
        }
        
        override public function setPopupText(param1:String, param2:String, param3:String, param4:String, param5:String) : *
        {
            this.title.text = param1;
            this.acceptButton.label = param3;
            this.declineButton.label = param4;
        }
        
        public function set fillDevicesList(param1:Array) : void
        {
            if(param1)
            {
                this.devicesDropDown.dataProvider = new DataProvider(param1);
            }
        }
        
        public function set selectDevices(param1:Number) : void
        {
            this.devicesDropDown.selectedIndex = param1;
        }
        
        public function set setMicVolume(param1:Number) : void
        {
            this.micVolumeSlider.sliderValue = param1;
        }
        
        private function onBtnAcceptClick(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_onBtnAcceptClick");
        }
        
        private function onBtnDeclineClick(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_onBtnDeclineClick");
        }
        
        private function onDeviceChanged(param1:ListEvent) : void
        {
            ExternalInterface.call("Callback_DeviceSelect",param1.index);
        }
        
        private function onRefreshButtonClick(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_onRefreshButtonClick");
        }
        
        private function onSliderChanged(param1:SliderEvent) : void
        {
            ExternalInterface.call("Callback_MicVolumeChanged",param1.value);
        }
        
        private function onCheckMicClick(param1:ButtonEvent) : void
        {
            this.checkMicButton.visible = false;
            this.stopMicButton.visible = true;
            ExternalInterface.call("Callback_onCheckMicClick");
        }
        
        private function onStopMicClick(param1:ButtonEvent) : void
        {
            this.checkMicButton.visible = true;
            this.stopMicButton.visible = false;
            ExternalInterface.call("Callback_onStopMicClick");
        }
        
        private function startTimer() : *
        {
            var _loc1_:Timer = new Timer(50,1);
            _loc1_.addEventListener("timer",this.timerHandler);
            _loc1_.start();
        }
        
        private function timerHandler(param1:TimerEvent) : *
        {
            ExternalInterface.call("Callback_onRefreshButtonClick");
        }
    }
}
