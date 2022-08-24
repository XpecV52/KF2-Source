package tripwire.menus
{
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.Button;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.events.SliderEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.Extensions;
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
        
        public var masterVolumeSlider:SliderOption;
        
        public var sFxSlider:SliderOption;
        
        public var dialogSlider:SliderOption;
        
        public var musicSlider:SliderOption;
        
        public var voipVolumeSlider:SliderOption;
        
        public var defaultButton:TripButton;
        
        public var configureMicrophoneButton:Button;
        
        public var screenSizeButton:Button;
        
        public var pushToTalkBox:TripCheckBox;
        
        public var vocalsCheckBox:TripCheckBox;
        
        public var minimalDialogueCheckBox:TripCheckBox;
        
        public var controllerSoundCheckBox:TripCheckBox;
        
        private const voIPSliderInterval:Number = 0.1;
        
        public var genericSliderSoundEffect:String = "GEN_Click";
        
        public var musicSliderSoundEffect:String = "MUSIC_Click";
        
        public var sfxSliderSoundEffect:String = "SFX_Click";
        
        public var voSliderSoundEffect:String = "VO_Click";
        
        public var voipSliderSoundEffect:String = "VOIP_Click";
        
        public function OptionsAudioMenu()
        {
            super();
            enableInitCallback = true;
            this.setTabIndex();
            defaultFirstElement = this.masterVolumeSlider;
            sectionHeader = this.header;
            defaultNumPrompts = 3;
        }
        
        public function setTabIndex() : *
        {
            var _loc1_:Boolean = bManagerConsoleBuild;
            var _loc2_:int = 1;
            this.masterVolumeSlider.tabIndex = _loc2_++;
            this.sFxSlider.tabIndex = _loc2_++;
            this.dialogSlider.tabIndex = _loc2_++;
            this.musicSlider.tabIndex = _loc2_++;
            if(!_loc1_)
            {
                this.voipVolumeSlider.tabIndex = _loc2_++;
                this.pushToTalkBox.tabIndex = _loc2_++;
            }
            this.vocalsCheckBox.tabIndex = _loc2_++;
            this.minimalDialogueCheckBox.tabIndex = _loc2_++;
            if(_loc1_)
            {
                this.controllerSoundCheckBox.tabIndex = _loc2_++;
            }
            this.configureMicrophoneButton.tabIndex = _loc2_++;
            if(this.screenSizeButton)
            {
                this.screenSizeButton.tabIndex = _loc2_++;
            }
            this.closeButton.tabIndex = _loc2_++;
            if(!_loc1_)
            {
                this.defaultButton.tabIndex = _loc2_++;
            }
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.masterVolumeSlider.textField.text = !!param1.master ? param1.master : "mast";
            this.dialogSlider.textField.text = !!param1.dialog ? param1.dialog : "dia";
            this.musicSlider.textField.text = !!param1.music ? param1.music : "mus";
            this.sFxSlider.textField.text = !!param1.sFx ? param1.sFx : "sfx.";
            this.sectionTextField.text = !!param1.sectionName ? param1.sectionName : "";
            this.optionsTextField.text = !!param1.options ? param1.options : "";
            this.header.text = !!param1.header ? param1.header : "";
            this.configureMicrophoneButton.label = !!param1.configureMic ? param1.configureMic : "";
            if(this.screenSizeButton)
            {
                this.screenSizeButton.label = !!param1.screenSize ? param1.screenSize : "";
            }
            this.vocalsCheckBox.label = !!param1.vocals ? param1.vocals : "";
            this.closeButton.label = !!param1.close ? param1.close : "";
            this.minimalDialogueCheckBox.label = !!param1.battleChatter ? param1.battleChatter : "";
            if(!bManagerConsoleBuild)
            {
                this.voipVolumeSlider.textField.text = !!param1.voipVolume ? param1.voipVolume : "vp";
                this.pushToTalkBox.label = !!param1.pushToTalk ? param1.pushToTalk : "";
                this.defaultButton.label = !!param1.resetDefault ? param1.resetDefault : "";
            }
            else
            {
                this.controllerSoundCheckBox.label = !!param1.controllerSound ? param1.controllerSound : "";
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.openContainer();
        }
        
        override public function openContainer(param1:Boolean = true) : void
        {
            super.openContainer();
            this.masterVolumeSlider.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged,false,0,true);
            this.dialogSlider.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged,false,0,true);
            this.musicSlider.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged,false,0,true);
            this.sFxSlider.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged,false,0,true);
            this.configureMicrophoneButton.addEventListener(ButtonEvent.PRESS,this.onConfigureMic,false,0,true);
            if(this.screenSizeButton)
            {
                this.screenSizeButton.addEventListener(ButtonEvent.PRESS,this.onScreenSize,false,0,true);
            }
            this.vocalsCheckBox.addEventListener(Event.SELECT,this.onVocalsChanged,false,0,true);
            this.minimalDialogueCheckBox.addEventListener(Event.SELECT,this.onBattleChatterChanged,false,0,true);
            this.closeButton.addEventListener(ButtonEvent.PRESS,this.onButtonClick,false,0,true);
            this.closeButton.visible = !bManagerUsingGamepad;
            if(!bManagerConsoleBuild)
            {
                this.voipVolumeSlider.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged,false,0,true);
                this.pushToTalkBox.addEventListener(Event.SELECT,this.onPushToTalkChanged,false,0,true);
                this.defaultButton.addEventListener(ButtonEvent.PRESS,this.onButtonClick,false,0,true);
                this.defaultButton.visible = !bManagerUsingGamepad;
            }
            else
            {
                this.controllerSoundCheckBox.addEventListener(Event.SELECT,this.onControllerSoundChanged,false,0,true);
            }
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            this.masterVolumeSlider.slider.removeEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged);
            this.dialogSlider.slider.removeEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged);
            this.musicSlider.slider.removeEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged);
            this.sFxSlider.slider.removeEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged);
            this.configureMicrophoneButton.removeEventListener(ButtonEvent.PRESS,this.onConfigureMic);
            if(this.screenSizeButton)
            {
                this.screenSizeButton.removeEventListener(ButtonEvent.PRESS,this.onScreenSize);
            }
            this.vocalsCheckBox.removeEventListener(Event.SELECT,this.onVocalsChanged);
            this.minimalDialogueCheckBox.removeEventListener(Event.SELECT,this.onBattleChatterChanged);
            this.closeButton.removeEventListener(ButtonEvent.PRESS,this.onButtonClick);
            if(!bManagerConsoleBuild)
            {
                this.voipVolumeSlider.slider.removeEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged);
                this.pushToTalkBox.removeEventListener(ButtonEvent.PRESS,this.onPushToTalkChanged);
                this.defaultButton.removeEventListener(ButtonEvent.PRESS,this.onButtonClick);
            }
            else
            {
                this.controllerSoundCheckBox.removeEventListener(Event.SELECT,this.onControllerSoundChanged);
            }
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.closeButton.visible = !bManagerUsingGamepad;
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
        
        public function set masterVolume(param1:Number) : void
        {
            this.masterVolumeSlider.sliderValue = param1;
        }
        
        public function set dialogVolume(param1:Number) : void
        {
            this.dialogSlider.sliderValue = param1;
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
        
        public function set controllerSound(param1:Boolean) : void
        {
            this.controllerSoundCheckBox.selected = param1;
        }
        
        protected function onButtonClick(param1:ButtonEvent) : void
        {
            if(param1.target == this.closeButton)
            {
                this.goBackToOptionsSelection();
            }
            else if(param1.target == this.defaultButton)
            {
                ExternalInterface.call("CallBack_ResetAudioOptions");
            }
        }
        
        public function playSound(param1:String = "") : void
        {
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"UI",param1);
            }
        }
        
        protected function onSliderChanged(param1:SliderEvent) : void
        {
            if(bManagerConsoleBuild)
            {
                switch(param1.target)
                {
                    case this.musicSlider.slider:
                        this.playSound(this.musicSliderSoundEffect);
                        ExternalInterface.call("Callback_MusicVolumeChanged",param1.value);
                        break;
                    case this.sFxSlider.slider:
                        this.playSound(this.sfxSliderSoundEffect);
                        ExternalInterface.call("Callback_SFxVolumeChanged",param1.value);
                        break;
                    case this.masterVolumeSlider.slider:
                        this.playSound(this.genericSliderSoundEffect);
                        ExternalInterface.call("Callback_MasterVolumeChanged",param1.value);
                        break;
                    case this.dialogSlider.slider:
                        this.playSound(this.voSliderSoundEffect);
                        ExternalInterface.call("Callback_DialogVolumeChanged",param1.value);
                }
            }
            else
            {
                switch(param1.target)
                {
                    case this.musicSlider.slider:
                        this.playSound(this.musicSliderSoundEffect);
                        ExternalInterface.call("Callback_MusicVolumeChanged",param1.value);
                        break;
                    case this.sFxSlider.slider:
                        this.playSound(this.sfxSliderSoundEffect);
                        ExternalInterface.call("Callback_SFxVolumeChanged",param1.value);
                        break;
                    case this.masterVolumeSlider.slider:
                        this.playSound(this.genericSliderSoundEffect);
                        ExternalInterface.call("Callback_MasterVolumeChanged",param1.value);
                        break;
                    case this.dialogSlider.slider:
                        this.playSound(this.voSliderSoundEffect);
                        ExternalInterface.call("Callback_DialogVolumeChanged",param1.value);
                        break;
                    case this.voipVolumeSlider.slider:
                        this.playSound(this.voipSliderSoundEffect);
                        ExternalInterface.call("Callback_VOIPVolumeChanged",param1.value);
                }
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
        
        private function onScreenSize(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_ScreenSizePress");
        }
        
        private function onControllerSoundChanged(param1:Event) : void
        {
            ExternalInterface.call("Callback_ConfigureControllerSound",this.controllerSoundCheckBox.selected);
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            this.goBackToOptionsSelection();
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            super.handleInput(param1);
            if(param1.handled)
            {
                return;
            }
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_X:
                        ExternalInterface.call("CallBack_ResetAudioOptions");
                        param1.handled = true;
                }
            }
        }
    }
}
