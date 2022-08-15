package tripwire.menus
{
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.Button;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.SliderEvent;
    import scaleform.clik.ui.InputDetails;
    import tripwire.containers.SectionHeaderContainer;
    import tripwire.containers.TripContainer;
    import tripwire.controls.SliderOption;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripCheckBox;
    
    public class OptionsAudioMenu extends TripContainer
    {
         
        
        public var header:SectionHeaderContainer;
        
        public var closeButton:TripButton;
        
        public var sectionTextField:TextField;
        
        public var optionsTextField:TextField;
        
        public var musicSlider:SliderOption;
        
        public var sFxSlider:SliderOption;
        
        public var voipVolumeSlider:SliderOption;
        
        public var configureMicrophoneButton:Button;
        
        public var pushToTalkBox:TripCheckBox;
        
        public var vocalsCheckBox:TripCheckBox;
        
        public var minimalDialogueCheckBox:TripCheckBox;
        
        private const voIPSliderInterval:Number = 0.1;
        
        public function OptionsAudioMenu()
        {
            super();
            enableInitCallback = true;
            this.setTabIndex();
            defaultFirstElement = this.sFxSlider;
        }
        
        public function setTabIndex() : *
        {
            this.musicSlider.tabIndex = 1;
            this.sFxSlider.tabIndex = 2;
            this.voipVolumeSlider.tabIndex = 3;
            this.pushToTalkBox.tabIndex = 4;
            this.vocalsCheckBox.tabIndex = 5;
            this.minimalDialogueCheckBox.tabIndex = 6;
            this.configureMicrophoneButton.tabIndex = 7;
            this.closeButton.tabIndex = 8;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.sectionTextField.text = !!param1.sectionName ? param1.sectionName : "";
            this.optionsTextField.text = !!param1.options ? param1.options : "";
            this.musicSlider.textField.text = !!param1.music ? param1.music : "";
            this.sFxSlider.textField.text = !!param1.sFx ? param1.sFx : "";
            this.voipVolumeSlider.textField.text = !!param1.voipVolume ? param1.voipVolume : "";
            this.header.text = !!param1.header ? param1.header : "";
            this.configureMicrophoneButton.label = !!param1.configureMic ? param1.configureMic : "";
            this.pushToTalkBox.label = !!param1.pushToTalk ? param1.pushToTalk : "";
            this.vocalsCheckBox.label = !!param1.vocals ? param1.vocals : "";
            this.closeButton.label = !!param1.close ? param1.close : "";
            this.minimalDialogueCheckBox.label = !!param1.battleChatter ? param1.battleChatter : "";
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.openContainer();
        }
        
        override public function openContainer() : void
        {
            super.openContainer();
            this.musicSlider.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged,false,0,true);
            this.sFxSlider.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged,false,0,true);
            this.voipVolumeSlider.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged,false,0,true);
            this.configureMicrophoneButton.addEventListener(ButtonEvent.PRESS,this.onConfigureMic,false,0,true);
            this.pushToTalkBox.addEventListener(Event.SELECT,this.onPushToTalkChanged,false,0,true);
            this.vocalsCheckBox.addEventListener(Event.SELECT,this.onVocalsChanged,false,0,true);
            this.minimalDialogueCheckBox.addEventListener(Event.SELECT,this.onBattleChatterChanged,false,0,true);
            this.closeButton.addEventListener(ButtonEvent.PRESS,this.onButtonClick,false,0,true);
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            this.musicSlider.slider.removeEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged);
            this.sFxSlider.slider.removeEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged);
            this.voipVolumeSlider.slider.removeEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged);
            this.configureMicrophoneButton.removeEventListener(ButtonEvent.PRESS,this.onConfigureMic);
            this.pushToTalkBox.removeEventListener(ButtonEvent.PRESS,this.onPushToTalkChanged);
            this.vocalsCheckBox.removeEventListener(Event.SELECT,this.onVocalsChanged);
            this.minimalDialogueCheckBox.removeEventListener(Event.SELECT,this.onBattleChatterChanged);
            this.closeButton.removeEventListener(ButtonEvent.PRESS,this.onButtonClick);
        }
        
        public function setVOIPVolumeRange(param1:Number, param2:Number) : void
        {
            this.voipVolumeSlider.slider.snapInterval = this.voIPSliderInterval;
            this.voipVolumeSlider.slider.minimum = param1;
            this.voipVolumeSlider.slider.maximum = param2;
        }
        
        public function set bPushToTalk(param1:Boolean) : void
        {
            this.pushToTalkBox.selected = param1;
        }
        
        public function set battleChatter(param1:Boolean) : void
        {
            this.minimalDialogueCheckBox.selected = param1;
        }
        
        public function set vocalsEnabled(param1:Boolean) : void
        {
            this.vocalsCheckBox.selected = param1;
        }
        
        public function set voipVolume(param1:Number) : void
        {
            this.voipVolumeSlider.sliderValue = param1;
        }
        
        public function set musicVolume(param1:Number) : void
        {
            this.musicSlider.sliderValue = param1;
        }
        
        public function set sFxVolume(param1:Number) : void
        {
            this.sFxSlider.sliderValue = param1;
        }
        
        protected function onButtonClick(param1:ButtonEvent) : void
        {
            if(param1.target == this.closeButton)
            {
                this.goBackToOptionsSelection();
            }
        }
        
        protected function onSliderChanged(param1:SliderEvent) : void
        {
            switch(param1.target)
            {
                case this.musicSlider.slider:
                    ExternalInterface.call("Callback_MusicVolumeChanged",param1.value);
                    break;
                case this.voipVolumeSlider.slider:
                    ExternalInterface.call("Callback_VOIPVolumeChanged",param1.value);
                    break;
                case this.sFxSlider.slider:
                    ExternalInterface.call("Callback_SFxVolumeChanged",param1.value);
            }
        }
        
        protected function onPushToTalkChanged(param1:Event) : void
        {
            ExternalInterface.call("Callback_PushToTalkChanged",this.pushToTalkBox.selected);
        }
        
        protected function goBackToOptionsSelection() : void
        {
            this.closeContainer();
            ExternalInterface.call("Callback_CloseMenu");
        }
        
        private function onVocalsChanged(param1:Event) : void
        {
            ExternalInterface.call("Callback_ConfigureVocals",this.vocalsCheckBox.selected);
        }
        
        private function onBattleChatterChanged(param1:Event) : void
        {
            ExternalInterface.call("Callback_ConfigureBattleChatter",this.minimalDialogueCheckBox.selected);
        }
        
        private function onConfigureMic(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_ConfigureMicPress");
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            this.goBackToOptionsSelection();
        }
    }
}
