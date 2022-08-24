package tripwire.menus
{
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
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
    
    public class OptionsGameSettingsMenu extends TripContainer
    {
         
        
        public var header:SectionHeaderContainer;
        
        public var closeButton:TripButton;
        
        public var sectionTextField:TextField;
        
        public var fovSlider:SliderOption;
        
        public var fovText:TextField;
        
        public var fovMinimumText:TextField;
        
        public var fovMaximumText:TextField;
        
        public var goreSlider:SliderOption;
        
        public var goreMinimumText:TextField;
        
        public var goreMediumText:TextField;
        
        public var goreMaximumText:TextField;
        
        public var goreTextOptions:Array;
        
        public var friendlyHudSlider:SliderOption;
        
        public var friendlyHudMinimumText:TextField;
        
        public var friendlyHudMaximumText:TextField;
        
        protected const FOVStepValue:Number = 1;
        
        public var crosshairCheckBox:TripCheckBox;
        
        public var classicWeaponSelectCheckBox:TripCheckBox;
        
        public var killTickerCheckBox:TripCheckBox;
        
        public var hideBossHealthBarCheckBox:TripCheckBox;
        
        public var showWelderInInvCheckBox:TripCheckBox;
        
        public var useAltAimOnDualCheckBox:TripCheckBox;
        
        public var antiMotionSicknessCheckBox:TripCheckBox;
        
        public var autoTurnOffCheckBox:TripCheckBox;
        
        public var reduceHighPitchNoiseCheckBox:TripCheckBox;
        
        public var disableAutoUpgradeCheckBox:TripCheckBox;
        
        public var toggleMixerCheckBox:TripCheckBox;
        
        public var defaultButton:TripButton;
        
        public var genericSliderSoundEffect:String = "GEN_Click";
        
        public function OptionsGameSettingsMenu()
        {
            super();
            enableInitCallback = true;
            this.setTabIndex();
            defaultFirstElement = this.fovSlider;
            sectionHeader = this.header;
            defaultNumPrompts = 3;
        }
        
        public function setTabIndex() : *
        {
            var _loc1_:int = 1;
            var _loc2_:Boolean = bManagerConsoleBuild;
            this.fovSlider.tabIndex = _loc1_++;
            this.goreSlider.tabIndex = _loc1_++;
            this.friendlyHudSlider.tabIndex = _loc1_++;
            this.crosshairCheckBox.tabIndex = _loc1_++;
            this.hideBossHealthBarCheckBox.tabIndex = _loc1_++;
            this.showWelderInInvCheckBox.tabIndex = _loc1_++;
            this.useAltAimOnDualCheckBox.tabIndex = _loc1_++;
            this.autoTurnOffCheckBox.tabIndex = _loc1_++;
            if(this.reduceHighPitchNoiseCheckBox != null)
            {
                this.reduceHighPitchNoiseCheckBox.tabIndex = _loc1_++;
            }
            if(this.antiMotionSicknessCheckBox != null)
            {
                this.antiMotionSicknessCheckBox.tabIndex = _loc1_++;
            }
            if(!_loc2_)
            {
                this.classicWeaponSelectCheckBox.tabIndex = _loc1_++;
            }
            this.killTickerCheckBox.tabIndex = _loc1_++;
            this.disableAutoUpgradeCheckBox.tabIndex = _loc1_++;
            if(this.toggleMixerCheckBox)
            {
                this.toggleMixerCheckBox.tabIndex = _loc1_++;
            }
            this.closeButton.tabIndex = _loc1_++;
            if(!_loc2_)
            {
                this.defaultButton.tabIndex = _loc1_++;
            }
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.fovSlider.textField.text = !!param1.fov ? param1.fov : "";
            this.friendlyHudSlider.textField.text = !!param1.friendlyHud ? param1.friendlyHud : "";
            if(param1.goreOptions != null)
            {
                this.goreOptions = param1.goreOptions;
            }
            this.goreSlider.textField.text = !!param1.gore ? param1.gore : "";
            this.crosshairCheckBox.label = !!param1.crosshair ? param1.crosshair : "";
            this.header.text = !!param1.header ? param1.header : "";
            this.closeButton.label = !!param1.close ? param1.close : "";
            if(!bManagerConsoleBuild)
            {
                this.classicWeaponSelectCheckBox.label = !!param1.classicWeaponSelect ? param1.classicWeaponSelect : "";
                this.defaultButton.label = !!param1.resetDefault ? param1.resetDefault : "";
            }
            this.hideBossHealthBarCheckBox.label = !!param1.hideBossHealthBar ? param1.hideBossHealthBar : "";
            this.showWelderInInvCheckBox.label = !!param1.showWelderInInv ? param1.showWelderInInv : "";
            this.useAltAimOnDualCheckBox.label = !!param1.useAltAimOnDual ? param1.useAltAimOnDual : "";
            this.autoTurnOffCheckBox.label = !!param1.autoTurnOff ? param1.autoTurnOff : "";
            if(this.reduceHighPitchNoiseCheckBox != null)
            {
                this.reduceHighPitchNoiseCheckBox.label = !!param1.reduceHighPitchNoise ? param1.reduceHighPitchNoise : "";
            }
            if(this.antiMotionSicknessCheckBox != null)
            {
                this.antiMotionSicknessCheckBox.label = !!param1.antiMotionSickness ? param1.antiMotionSickness : "";
            }
            if(this.toggleMixerCheckBox != null)
            {
                this.toggleMixerCheckBox.label = !!param1.enableMixer ? param1.enableMixer : "";
            }
            this.fovMinimumText.text = !!param1.normal ? param1.normal : "";
            this.fovMaximumText.text = !!param1.wider ? param1.wider : "";
            this.killTickerCheckBox.label = !!param1.killTicker ? param1.killTicker : "";
            this.disableAutoUpgradeCheckBox.label = !!param1.disableAutoUpgrade ? param1.disableAutoUpgrade : "";
        }
        
        public function set dataValues(param1:Object) : void
        {
            this.fov = !!param1.fov ? Number(param1.fov) : Number(0);
            this.gore = !!param1.gore ? Number(param1.gore) : Number(0);
            this.friendlyHudScale = !!param1.friendlyHud ? Number(param1.friendlyHud) : Number(0);
            this.crosshairCheckBox.selected = !!param1.crosshair ? Boolean(param1.crosshair) : false;
            if(!bManagerConsoleBuild)
            {
                this.classicWeaponSelectCheckBox.selected = !!param1.classicWeaponSelect ? Boolean(param1.classicWeaponSelect) : false;
            }
            this.killTickerCheckBox.selected = !!param1.killTicker ? Boolean(param1.killTicker) : false;
            this.disableAutoUpgradeCheckBox.selected = !!param1.disableAutoUpgrade ? Boolean(param1.disableAutoUpgrade) : false;
            this.hideBossHealthBarCheckBox.selected = !!param1.hideBossHealthBar ? Boolean(param1.hideBossHealthBar) : false;
            this.showWelderInInvCheckBox.selected = !!param1.showWelderInInv ? Boolean(param1.showWelderInInv) : false;
            this.useAltAimOnDualCheckBox.selected = !!param1.useAltAimOnDual ? Boolean(param1.useAltAimOnDual) : false;
            this.autoTurnOffCheckBox.selected = !!param1.autoTurnOff ? Boolean(param1.autoTurnOff) : false;
            if(this.reduceHighPitchNoiseCheckBox != null)
            {
                this.reduceHighPitchNoiseCheckBox.selected = !!param1.reduceHighPitchNoise ? Boolean(param1.reduceHighPitchNoise) : false;
            }
            if(this.antiMotionSicknessCheckBox != null)
            {
                this.antiMotionSicknessCheckBox.selected = !!param1.antiMotionSickness ? Boolean(param1.antiMotionSickness) : false;
            }
            if(this.toggleMixerCheckBox)
            {
                this.toggleMixerCheckBox.visible = !!param1.bDingo ? Boolean(param1.bDingo) : false;
                this.toggleMixerCheckBox.selected = !!param1.bMixerEnabled ? Boolean(param1.bMixerEnabled) : false;
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.openContainer();
            this.fovSlider.slider.snapInterval = this.FOVStepValue;
            this.closeButton.visible = !bManagerUsingGamepad;
            this.defaultButton.visible = !bManagerUsingGamepad;
            this.goreSlider.slider.lowSnapping = true;
            this.goreSlider.slider.snapInterval = 1;
        }
        
        override public function openContainer(param1:Boolean = true) : void
        {
            super.openContainer();
            this.fovSlider.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged,false,0,true);
            this.goreSlider.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged,false,0,true);
            this.friendlyHudSlider.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged,false,0,true);
            this.crosshairCheckBox.addEventListener(Event.SELECT,this.onCheckBoxClicked,false,0,true);
            if(!bManagerConsoleBuild)
            {
                this.classicWeaponSelectCheckBox.addEventListener(Event.SELECT,this.onCheckBoxClicked,false,0,true);
                this.defaultButton.addEventListener(ButtonEvent.PRESS,this.onButtonClick,false,0,true);
            }
            this.killTickerCheckBox.addEventListener(Event.SELECT,this.onCheckBoxClicked,false,0,true);
            this.disableAutoUpgradeCheckBox.addEventListener(Event.SELECT,this.onCheckBoxClicked,false,0,true);
            this.hideBossHealthBarCheckBox.addEventListener(Event.SELECT,this.onCheckBoxClicked,false,0,true);
            this.showWelderInInvCheckBox.addEventListener(Event.SELECT,this.onCheckBoxClicked,false,0,true);
            this.useAltAimOnDualCheckBox.addEventListener(Event.SELECT,this.onCheckBoxClicked,false,0,true);
            this.autoTurnOffCheckBox.addEventListener(Event.SELECT,this.onCheckBoxClicked,false,0,true);
            if(this.reduceHighPitchNoiseCheckBox != null)
            {
                this.reduceHighPitchNoiseCheckBox.addEventListener(Event.SELECT,this.onCheckBoxClicked,false,0,true);
            }
            if(this.antiMotionSicknessCheckBox != null)
            {
                this.antiMotionSicknessCheckBox.addEventListener(Event.SELECT,this.onCheckBoxClicked,false,0,true);
            }
            if(this.toggleMixerCheckBox)
            {
                this.toggleMixerCheckBox.addEventListener(Event.SELECT,this.onCheckBoxClicked,false,0,true);
            }
            this.closeButton.addEventListener(ButtonEvent.PRESS,this.onButtonClick,false,0,true);
        }
        
        public function onCheckBoxClicked(param1:Event) : void
        {
            switch(param1.target)
            {
                case this.toggleMixerCheckBox:
                    ExternalInterface.call("Callback_ToggleMixer",this.toggleMixerCheckBox.selected);
                    break;
                case this.disableAutoUpgradeCheckBox:
                    ExternalInterface.call("Callback_DisableAutoUpgradeChanged",this.disableAutoUpgradeCheckBox.selected);
                    break;
                case this.killTickerCheckBox:
                    ExternalInterface.call("Callback_KillTickerChanged",this.killTickerCheckBox.selected);
                    break;
                case this.classicWeaponSelectCheckBox:
                    ExternalInterface.call("Callback_WeaponSelectChanged",this.classicWeaponSelectCheckBox.selected);
                    break;
                case this.crosshairCheckBox:
                    ExternalInterface.call("Callback_ToggleCrosshair",this.crosshairCheckBox.selected);
                    break;
                case this.hideBossHealthBarCheckBox:
                    ExternalInterface.call("Callback_HideBossHealthBarChanged",this.hideBossHealthBarCheckBox.selected);
                    break;
                case this.showWelderInInvCheckBox:
                    ExternalInterface.call("Callback_bShowWelderInInvChanged",this.showWelderInInvCheckBox.selected);
                    break;
                case this.useAltAimOnDualCheckBox:
                    ExternalInterface.call("Callback_UseAltAimOnDualsChanged",this.useAltAimOnDualCheckBox.selected);
                    break;
                case this.antiMotionSicknessCheckBox:
                    ExternalInterface.call("Callback_AntiMotionSicknessChanged",this.antiMotionSicknessCheckBox.selected);
                    break;
                case this.autoTurnOffCheckBox:
                    ExternalInterface.call("Callback_AutoTurnOffChanged",this.autoTurnOffCheckBox.selected);
                    break;
                case this.reduceHighPitchNoiseCheckBox:
                    ExternalInterface.call("Callback_ReduceHighPitchNoiseChanged",this.reduceHighPitchNoiseCheckBox.selected);
            }
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            this.fovSlider.slider.removeEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged);
            this.goreSlider.slider.removeEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged);
            this.friendlyHudSlider.slider.removeEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged);
            this.crosshairCheckBox.removeEventListener(Event.SELECT,this.onCheckBoxClicked);
            if(!bManagerConsoleBuild)
            {
                this.classicWeaponSelectCheckBox.removeEventListener(Event.SELECT,this.onCheckBoxClicked);
                this.defaultButton.removeEventListener(ButtonEvent.PRESS,this.onButtonClick);
            }
            this.disableAutoUpgradeCheckBox.removeEventListener(Event.SELECT,this.onCheckBoxClicked);
            this.killTickerCheckBox.removeEventListener(Event.SELECT,this.onCheckBoxClicked);
            this.hideBossHealthBarCheckBox.removeEventListener(Event.SELECT,this.onCheckBoxClicked);
            this.showWelderInInvCheckBox.removeEventListener(Event.SELECT,this.onCheckBoxClicked);
            this.useAltAimOnDualCheckBox.removeEventListener(Event.SELECT,this.onCheckBoxClicked);
            this.autoTurnOffCheckBox.removeEventListener(Event.SELECT,this.onCheckBoxClicked);
            if(this.reduceHighPitchNoiseCheckBox != null)
            {
                this.reduceHighPitchNoiseCheckBox.removeEventListener(Event.SELECT,this.onCheckBoxClicked);
            }
            if(this.antiMotionSicknessCheckBox != null)
            {
                this.antiMotionSicknessCheckBox.removeEventListener(Event.SELECT,this.onCheckBoxClicked);
            }
            this.closeButton.removeEventListener(ButtonEvent.PRESS,this.onButtonClick);
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.closeButton.visible = !bManagerUsingGamepad;
            this.defaultButton.visible = !bManagerUsingGamepad;
            this.friendlyHudSlider.slider.focusable = this.fovSlider.slider.focusable = this.goreSlider.slider.focusable = bManagerUsingGamepad;
        }
        
        public function set goreOptions(param1:Array) : void
        {
            this.goreTextOptions = param1;
            this.goreSlider.slider.minimum = 0;
            this.goreSlider.slider.maximum = param1.length - 1;
            if(this.goreTextOptions.length > 2)
            {
                this.goreMinimumText.text = this.goreTextOptions[0];
                this.goreMediumText.text = this.goreTextOptions[1];
                this.goreMaximumText.text = this.goreTextOptions[2];
            }
        }
        
        public function set crosshair(param1:Boolean) : void
        {
            this.crosshairCheckBox.selected = param1;
        }
        
        public function set classicWeaponSelect(param1:Boolean) : void
        {
            this.classicWeaponSelectCheckBox.selected = param1;
        }
        
        public function setfovRange(param1:Number, param2:Number) : void
        {
            this.fovSlider.slider.minimum = param1 * 100;
            this.fovSlider.slider.maximum = param2 * 100;
        }
        
        public function set fov(param1:Number) : void
        {
            this.fovSlider.sliderValue = param1 * 100;
            this.updateFOVText();
        }
        
        public function setFriendlyHudRange(param1:Number, param2:Number) : void
        {
            this.friendlyHudSlider.slider.minimum = param1 * 100;
            this.friendlyHudSlider.slider.maximum = param2 * 100;
            this.friendlyHudMinimumText.text = param1.toString();
            this.friendlyHudMaximumText.text = param2.toString();
        }
        
        public function set friendlyHudScale(param1:Number) : void
        {
            this.friendlyHudSlider.sliderValue = param1 * 100;
        }
        
        public function set gore(param1:Number) : void
        {
            this.goreSlider.sliderValue = this.goreSlider.slider.maximum - param1;
        }
        
        protected function updateFOVText() : *
        {
            this.fovText.text = this.fovSlider.slider.value.toFixed(0).toString() + "%";
        }
        
        protected function onButtonClick(param1:ButtonEvent) : void
        {
            if(param1.target == this.closeButton)
            {
                this.goBackToOptionsSelection();
            }
            else if(param1.target == this.defaultButton)
            {
                ExternalInterface.call("CallBack_ResetGameOptions");
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
            switch(param1.target)
            {
                case this.fovSlider.slider:
                    this.playSound(this.genericSliderSoundEffect);
                    ExternalInterface.call("Callback_FOVChanged",param1.value / 100);
                    this.updateFOVText();
                    break;
                case this.friendlyHudSlider.slider:
                    this.playSound(this.genericSliderSoundEffect);
                    ExternalInterface.call("Callback_FriendlyHudChanged",param1.value / 100);
                    break;
                case this.goreSlider.slider:
                    this.playSound(this.genericSliderSoundEffect);
                    ExternalInterface.call("Callback_GoreChanged",this.goreSlider.slider.maximum - param1.value);
            }
        }
        
        protected function goBackToOptionsSelection() : void
        {
            this.closeContainer();
            ExternalInterface.call("Callback_CloseMenu");
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
                        ExternalInterface.call("CallBack_ResetGameOptions");
                        param1.handled = true;
                }
            }
        }
    }
}
