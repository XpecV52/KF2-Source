package tripwire.menus
{
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.events.SliderEvent;
    import scaleform.clik.ui.InputDetails;
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
        
        public var defaultButton:TripButton;
        
        public function OptionsGameSettingsMenu()
        {
            super();
            enableInitCallback = true;
            this.setTabIndex();
            defaultFirstElement = this.fovSlider;
            sectionHeader = this.header;
            defaultNumPrompts = 2;
        }
        
        public function setTabIndex() : *
        {
            var _loc1_:int = 1;
            var _loc2_:Boolean = bManagerConsoleBuild;
            this.fovSlider.tabIndex = _loc1_++;
            this.goreSlider.tabIndex = _loc1_++;
            this.friendlyHudSlider.tabIndex = _loc1_++;
            this.crosshairCheckBox.tabIndex = _loc1_++;
            if(!_loc2_)
            {
                this.classicWeaponSelectCheckBox.tabIndex = _loc1_++;
            }
            this.killTickerCheckBox.tabIndex = _loc1_++;
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
            this.fovMinimumText.text = !!param1.normal ? param1.normal : "";
            this.fovMaximumText.text = !!param1.wider ? param1.wider : "";
            this.killTickerCheckBox.label = !!param1.killTicker ? param1.killTicker : "";
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
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.openContainer();
            this.fovSlider.slider.snapInterval = this.FOVStepValue;
            this.closeButton.visible = !bManagerUsingGamepad;
        }
        
        override public function openContainer(param1:Boolean = true) : void
        {
            super.openContainer();
            this.fovSlider.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged,false,0,true);
            this.goreSlider.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged,false,0,true);
            this.friendlyHudSlider.slider.addEventListener(SliderEvent.VALUE_CHANGE,this.onSliderChanged,false,0,true);
            this.crosshairCheckBox.addEventListener(Event.SELECT,this.onCrosshairChanged,false,0,true);
            if(!bManagerConsoleBuild)
            {
                this.classicWeaponSelectCheckBox.addEventListener(Event.SELECT,this.onWeaponSelectChanged,false,0,true);
                this.defaultButton.addEventListener(ButtonEvent.PRESS,this.onButtonClick,false,0,true);
            }
            this.killTickerCheckBox.addEventListener(Event.SELECT,this.onTickerClicked,false,0,true);
            this.closeButton.addEventListener(ButtonEvent.PRESS,this.onButtonClick,false,0,true);
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
            this.crosshairCheckBox.removeEventListener(Event.SELECT,this.onCrosshairChanged);
            if(!bManagerConsoleBuild)
            {
                this.classicWeaponSelectCheckBox.removeEventListener(Event.SELECT,this.onWeaponSelectChanged);
                this.defaultButton.removeEventListener(ButtonEvent.PRESS,this.onButtonClick);
            }
            this.killTickerCheckBox.removeEventListener(Event.SELECT,this.onTickerClicked);
            this.closeButton.removeEventListener(ButtonEvent.PRESS,this.onButtonClick);
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.closeButton.visible = !bManagerUsingGamepad;
            this.defaultButton.visible = !bManagerUsingGamepad;
        }
        
        public function onTickerClicked(param1:Event) : void
        {
            ExternalInterface.call("Callback_KillTickerChanged",this.killTickerCheckBox.selected);
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
            this.fovText.text = String(this.fovSlider.slider.value + "%");
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
        
        protected function onSliderChanged(param1:SliderEvent) : void
        {
            switch(param1.target)
            {
                case this.fovSlider.slider:
                    ExternalInterface.call("Callback_FOVChanged",param1.value / 100);
                    this.updateFOVText();
                    break;
                case this.friendlyHudSlider.slider:
                    ExternalInterface.call("Callback_FriendlyHudChanged",param1.value / 100);
                    break;
                case this.goreSlider.slider:
                    ExternalInterface.call("Callback_GoreChanged",this.goreSlider.slider.maximum - param1.value);
            }
        }
        
        protected function goBackToOptionsSelection() : void
        {
            this.closeContainer();
            ExternalInterface.call("Callback_CloseMenu");
        }
        
        private function onWeaponSelectChanged(param1:Event) : void
        {
            ExternalInterface.call("Callback_WeaponSelectChanged",this.classicWeaponSelectCheckBox.selected);
        }
        
        private function onCrosshairChanged(param1:Event) : void
        {
            ExternalInterface.call("Callback_ToggleCrosshair",this.crosshairCheckBox.selected);
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            this.goBackToOptionsSelection();
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            super.handleInput(param1);
        }
    }
}
