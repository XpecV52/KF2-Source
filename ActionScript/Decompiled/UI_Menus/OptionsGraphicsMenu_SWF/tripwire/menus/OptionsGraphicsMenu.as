package tripwire.menus
{
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.interfaces.IDataProvider;
    import scaleform.clik.ui.InputDetails;
    import tripwire.containers.SectionHeaderContainer;
    import tripwire.containers.TripContainer;
    import tripwire.controls.SliderOption;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripCheckBox;
    import tripwire.controls.TripDropDownMenu;
    
    public class OptionsGraphicsMenu extends TripContainer
    {
         
        
        public var applyButton:TripButton;
        
        public var cancelButton:TripButton;
        
        public var gammaButton:TripButton;
        
        public var closeButton:TripButton;
        
        public var defaultButton:TripButton;
        
        public var header:SectionHeaderContainer;
        
        public var basicTextField:TextField;
        
        public var aspectRatioTextField:TextField;
        
        public var resolutionTextField:TextField;
        
        public var graphicsQualityTextField:TextField;
        
        public var vSyncTextField:TextField;
        
        public var fullScreenTextField:TextField;
        
        public var physicsCardTextField:TextField;
        
        public var aspectRatioDropDown:TripDropDownMenu;
        
        public var resolutionDropDown:TripDropDownMenu;
        
        public var graphicsQualityDropDown:TripDropDownMenu;
        
        public var vSyncDropDown:TripDropDownMenu;
        
        public var fullScreenDropDown:TripDropDownMenu;
        
        public var variableFrameRateCheckbox:TripCheckBox;
        
        public var filmGrainSlider:SliderOption;
        
        public var physicsLevelTextField:TextField;
        
        public var physicsLevelDropDown:TripDropDownMenu;
        
        public var advancedTextField:TextField;
        
        public var environmentDetailTextField:TextField;
        
        public var characterDetailTextField:TextField;
        
        public var fxTextField:TextField;
        
        public var textureResolutionTextField:TextField;
        
        public var texturefilteringTextField:TextField;
        
        public var shadowsTextField:TextField;
        
        public var realtimeReflectionsTextField:TextField;
        
        public var antiAliasingTextField:TextField;
        
        public var bloomTextField:TextField;
        
        public var motionBlurTextField:TextField;
        
        public var ambientOcclusionTextField:TextField;
        
        public var depthOfFieldTextField:TextField;
        
        public var volumetricLightingTextField:TextField;
        
        public var lensFlaresTextField:TextField;
        
        public var lightShaftsTextField:TextField;
        
        public var environmentDetailDropDown:TripDropDownMenu;
        
        public var characterDetailDropDown:TripDropDownMenu;
        
        public var fxDropDown:TripDropDownMenu;
        
        public var textureResolutionDropDown:TripDropDownMenu;
        
        public var textureFilteringDropDown:TripDropDownMenu;
        
        public var shadowsDropDown:TripDropDownMenu;
        
        public var realtimeReflectionsDropDown:TripDropDownMenu;
        
        public var antiAliasingDropDown:TripDropDownMenu;
        
        public var bloomDropDown:TripDropDownMenu;
        
        public var motionBlurDropDown:TripDropDownMenu;
        
        public var ambientOcclusionDropDown:TripDropDownMenu;
        
        public var depthOfFieldDropDown:TripDropDownMenu;
        
        public var volumetricLightingDropDown:TripDropDownMenu;
        
        public var lensFlaresDropDown:TripDropDownMenu;
        
        public var lightShaftsDropDown:TripDropDownMenu;
        
        public var customString:String;
        
        public var iniOverrideString:String;
        
        public var physicsSuggestions:Array;
        
        public function OptionsGraphicsMenu()
        {
            super();
            defaultFirstElement = this.resolutionDropDown;
            this.filmGrainSlider.slider.snapInterval = 0.1;
            sectionHeader = this.header;
            defaultNumPrompts = 2;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.header.text = !!param1.graphics ? param1.graphics : "";
            this.gammaButton.label = !!param1.adjustGamma ? param1.adjustGamma : "";
            this.applyButton.label = !!param1.apply ? param1.apply : "";
            this.cancelButton.label = !!param1.close ? param1.close : "";
            this.defaultButton.label = !!param1.§default§ ? param1.§default§ : "";
            this.basicTextField.text = !!param1.basic ? param1.basic : "";
            this.aspectRatioTextField.text = !!param1.aspectRatio ? param1.aspectRatio : "";
            this.resolutionTextField.text = !!param1.resolution ? param1.resolution : "";
            this.graphicsQualityTextField.text = !!param1.graphicsQuality ? param1.graphicsQuality : "";
            this.vSyncTextField.text = !!param1.vSync ? param1.vSync : "";
            this.fullScreenTextField.text = !!param1.fullscreen ? param1.fullscreen : "";
            this.variableFrameRateCheckbox.label = !!param1.variableFrameRate ? param1.variableFrameRate : "";
            this.gammaButton.label = !!param1.adjustGamma ? param1.adjustGamma : "";
            this.filmGrainSlider.label = !!param1.filmGrain ? param1.filmGrain : "";
            this.physicsLevelTextField.text = !!param1.physicsLevel ? param1.physicsLevel : "";
            this.advancedTextField.text = !!param1.advanced ? param1.advanced : "";
            this.environmentDetailTextField.text = !!param1.environmentDetails ? param1.environmentDetails : "";
            this.characterDetailTextField.text = !!param1.characterDetail ? param1.characterDetail : "";
            this.fxTextField.text = !!param1.fx ? param1.fx : "";
            this.textureResolutionTextField.text = !!param1.textureResolution ? param1.textureResolution : "";
            this.texturefilteringTextField.text = !!param1.textureFiltering ? param1.textureFiltering : "";
            this.shadowsTextField.text = !!param1.shadows ? param1.shadows : "";
            this.realtimeReflectionsTextField.text = !!param1.realtimeReflections ? param1.realtimeReflections : "";
            this.antiAliasingTextField.text = !!param1.antiAliasing ? param1.antiAliasing : "";
            this.bloomTextField.text = !!param1.bloom ? param1.bloom : "";
            this.motionBlurTextField.text = !!param1.motionBlur ? param1.motionBlur : "";
            this.ambientOcclusionTextField.text = !!param1.ambientOcclusion ? param1.ambientOcclusion : "";
            this.depthOfFieldTextField.text = !!param1.depthOfField ? param1.depthOfField : "";
            this.volumetricLightingTextField.text = !!param1.volumetricLighting ? param1.volumetricLighting : "";
            this.lensFlaresTextField.text = !!param1.lensFlares ? param1.lensFlares : "";
            this.lightShaftsTextField.text = !!param1.lightShafts ? param1.lightShafts : "";
            this.customString = !!param1.customString ? param1.customString : "????";
            this.iniOverrideString = !!param1.iniOverrideString ? param1.iniOverrideString : "????";
            this.physicsSuggestions = !!param1.physicsSuggestionsArray ? param1.physicsSuggestionsArray : null;
            this.physicsLevelDropDown.dataProvider = !!param1.physicsLevelOptions ? new DataProvider(param1.physicsLevelOptions) : this.physicsLevelDropDown.dataProvider;
            this.aspectRatioDropDown.dataProvider = !!param1.aspectRatioOptions ? new DataProvider(param1.aspectRatioOptions) : this.aspectRatioDropDown.dataProvider;
            this.fullScreenDropDown.dataProvider = !!param1.fullscreenOptions ? new DataProvider(param1.fullscreenOptions) : this.fullScreenDropDown.dataProvider;
            this.graphicsQualityDropDown.dataProvider = !!param1.graphicsOptions ? new DataProvider(param1.graphicsOptions) : this.graphicsQualityDropDown.dataProvider;
            this.vSyncDropDown.dataProvider = !!param1.vSyncOptions ? new DataProvider(param1.vSyncOptions) : this.vSyncDropDown.dataProvider;
            this.environmentDetailDropDown.dataProvider = !!param1.environmentDetailOptions ? new DataProvider(param1.environmentDetailOptions) : this.environmentDetailDropDown.dataProvider;
            this.characterDetailDropDown.dataProvider = !!param1.characterDetailOptions ? new DataProvider(param1.characterDetailOptions) : this.characterDetailDropDown.dataProvider;
            this.fxDropDown.dataProvider = !!param1.fxOptions ? new DataProvider(param1.fxOptions) : this.fxDropDown.dataProvider;
            this.textureResolutionDropDown.dataProvider = !!param1.textureResolutionOptions ? new DataProvider(param1.textureResolutionOptions) : this.textureResolutionDropDown.dataProvider;
            this.textureFilteringDropDown.dataProvider = !!param1.textureFilteringOptions ? new DataProvider(param1.textureFilteringOptions) : this.textureFilteringDropDown.dataProvider;
            this.shadowsDropDown.dataProvider = !!param1.shadowsOptions ? new DataProvider(param1.shadowsOptions) : this.shadowsDropDown.dataProvider;
            this.realtimeReflectionsDropDown.dataProvider = !!param1.realtimeReflectionsOptions ? new DataProvider(param1.realtimeReflectionsOptions) : this.realtimeReflectionsDropDown.dataProvider;
            this.antiAliasingDropDown.dataProvider = !!param1.antiAliasingOptions ? new DataProvider(param1.antiAliasingOptions) : this.antiAliasingDropDown.dataProvider;
            this.bloomDropDown.dataProvider = !!param1.bloomOptions ? new DataProvider(param1.bloomOptions) : this.bloomDropDown.dataProvider;
            this.motionBlurDropDown.dataProvider = !!param1.motionBlurOptions ? new DataProvider(param1.motionBlurOptions) : this.motionBlurDropDown.dataProvider;
            this.ambientOcclusionDropDown.dataProvider = !!param1.ambientOcclusionOptions ? new DataProvider(param1.ambientOcclusionOptions) : this.ambientOcclusionDropDown.dataProvider;
            this.depthOfFieldDropDown.dataProvider = !!param1.depthOfFieldOptions ? new DataProvider(param1.depthOfFieldOptions) : this.depthOfFieldDropDown.dataProvider;
            this.volumetricLightingDropDown.dataProvider = !!param1.volumetricLightingOptions ? new DataProvider(param1.volumetricLightingOptions) : this.volumetricLightingDropDown.dataProvider;
            this.lensFlaresDropDown.dataProvider = !!param1.lensFlaresOptions ? new DataProvider(param1.lensFlaresOptions) : this.lensFlaresDropDown.dataProvider;
            this.lightShaftsDropDown.dataProvider = !!param1.lightShaftsOptions ? new DataProvider(param1.lightShaftsOptions) : this.lightShaftsDropDown.dataProvider;
        }
        
        public function set options(param1:Object) : void
        {
            var _loc2_:Number = 0;
            this.aspectRatioDropDown.selectedIndex = !!param1.aspectRatio ? int(param1.aspectRatio) : 0;
            this.resolutionDropDown.selectedIndex = !!param1.resolution ? int(param1.resolution) : 0;
            this.graphicsQualityDropDown.selectedIndex = !!param1.graphics ? int(param1.graphics) : 0;
            this.vSyncDropDown.selectedIndex = !!param1.vSync ? int(param1.vSync) : 0;
            this.fullScreenDropDown.selectedIndex = !!param1.fullScreen ? int(param1.fullScreen) : 0;
            this.variableFrameRateCheckbox.selected = !!param1.variableFrameRate ? Boolean(param1.variableFrameRate) : false;
            _loc2_ = !!param1.filmGrain ? Number(param1.filmGrain) : Number(0);
            this.filmGrainSlider.sliderValue = _loc2_ * 100;
            this.physicsLevelDropDown.selectedIndex = !!param1.physicsLevel ? int(param1.physicsLevel) : 0;
            this.physicsCardTextField.text = this.physicsSuggestions[!!param1.physicsLevel ? param1.physicsLevel : 0];
            this.environmentDetailDropDown.selectedIndex = !!param1.environmentDetail ? int(param1.environmentDetail) : 0;
            this.characterDetailDropDown.selectedIndex = !!param1.characterDetail ? int(param1.characterDetail) : 0;
            this.fxDropDown.selectedIndex = !!param1.fx ? int(param1.fx) : 0;
            this.textureResolutionDropDown.selectedIndex = !!param1.textureResolution ? int(param1.textureResolution) : 0;
            this.textureFilteringDropDown.selectedIndex = !!param1.textureFiltering ? int(param1.textureFiltering) : 0;
            this.shadowsDropDown.selectedIndex = !!param1.shadows ? int(param1.shadows) : 0;
            this.realtimeReflectionsDropDown.selectedIndex = !!param1.realtimeReflections ? int(param1.realtimeReflections) : 0;
            this.antiAliasingDropDown.selectedIndex = !!param1.antiAliasing ? int(param1.antiAliasing) : 0;
            this.bloomDropDown.selectedIndex = !!param1.bloom ? int(param1.bloom) : 0;
            this.motionBlurDropDown.selectedIndex = !!param1.motionBlur ? int(param1.motionBlur) : 0;
            this.ambientOcclusionDropDown.selectedIndex = !!param1.ambientOcclusion ? int(param1.ambientOcclusion) : 0;
            this.depthOfFieldDropDown.selectedIndex = !!param1.depthOfField ? int(param1.depthOfField) : 0;
            this.volumetricLightingDropDown.selectedIndex = !!param1.volumetricLighting ? int(param1.volumetricLighting) : 0;
            this.lensFlaresDropDown.selectedIndex = !!param1.lensFlares ? int(param1.lensFlares) : 0;
            this.lightShaftsDropDown.selectedIndex = !!param1.lightShafts ? int(param1.lightShafts) : 0;
        }
        
        public function get options() : Object
        {
            var _loc1_:Object = new Object();
            _loc1_.aspectRatio = this.aspectRatioDropDown.selectedIndex;
            _loc1_.graphics = this.graphicsQualityDropDown.selectedIndex;
            _loc1_.vSync = this.vSyncDropDown.selectedIndex;
            _loc1_.resolution = this.resolutionDropDown.selectedIndex;
            _loc1_.fullScreen = this.fullScreenDropDown.selectedIndex;
            _loc1_.variableFrameRate = this.variableFrameRateCheckbox.selected;
            _loc1_.filmGrain = this.filmGrainSlider.slider.value / 100;
            _loc1_.environmentDetail = this.environmentDetailDropDown.selectedIndex;
            _loc1_.characterDetail = this.characterDetailDropDown.selectedIndex;
            _loc1_.fx = this.fxDropDown.selectedIndex;
            _loc1_.textureResolution = this.textureResolutionDropDown.selectedIndex;
            _loc1_.textureFiltering = this.textureFilteringDropDown.selectedIndex;
            _loc1_.shadows = this.shadowsDropDown.selectedIndex;
            _loc1_.realtimeReflections = this.realtimeReflectionsDropDown.selectedIndex;
            _loc1_.antiAliasing = this.antiAliasingDropDown.selectedIndex;
            _loc1_.bloom = this.bloomDropDown.selectedIndex;
            _loc1_.motionBlur = this.motionBlurDropDown.selectedIndex;
            _loc1_.ambientOcclusion = this.ambientOcclusionDropDown.selectedIndex;
            _loc1_.depthOfField = this.depthOfFieldDropDown.selectedIndex;
            _loc1_.physicsLevel = this.physicsLevelDropDown.selectedIndex;
            _loc1_.volumetricLighting = this.volumetricLightingDropDown.selectedIndex;
            _loc1_.lensFlares = this.lensFlaresDropDown.selectedIndex;
            _loc1_.lightShafts = this.lightShaftsDropDown.selectedIndex;
            return _loc1_;
        }
        
        public function set resolutionOptions(param1:Array) : void
        {
            if(param1)
            {
                this.resolutionDropDown.dataProvider = new DataProvider(param1);
            }
        }
        
        public function setTabIndex() : void
        {
            this.aspectRatioDropDown.tabIndex = 1;
            this.resolutionDropDown.tabIndex = 2;
            this.graphicsQualityDropDown.tabIndex = 3;
            this.vSyncDropDown.tabIndex = 4;
            this.fullScreenDropDown.tabIndex = 5;
            this.variableFrameRateCheckbox.tabIndex = 6;
            this.physicsLevelDropDown.tabIndex = 7;
            this.filmGrainSlider.tabIndex = 8;
            this.gammaButton.tabIndex = 9;
            this.volumetricLightingDropDown.tabIndex = 10;
            this.lensFlaresDropDown.tabIndex = 11;
            this.lightShaftsDropDown.tabIndex = 12;
            this.environmentDetailDropDown.tabIndex = 13;
            this.characterDetailDropDown.tabIndex = 14;
            this.fxDropDown.tabIndex = 15;
            this.textureResolutionDropDown.tabIndex = 16;
            this.textureFilteringDropDown.tabIndex = 17;
            this.shadowsDropDown.tabIndex = 18;
            this.realtimeReflectionsDropDown.tabIndex = 19;
            this.antiAliasingDropDown.tabIndex = 20;
            this.bloomDropDown.tabIndex = 21;
            this.motionBlurDropDown.tabIndex = 22;
            this.ambientOcclusionDropDown.tabIndex = 23;
            this.depthOfFieldDropDown.tabIndex = 24;
            this.applyButton.tabIndex = 25;
            this.defaultButton.tabIndex = 26;
            this.cancelButton.tabIndex = 27;
        }
        
        private function setAdvancedDropdownLabelFunctions() : *
        {
            this.graphicsQualityDropDown.labelFunction = this.setGraphicsDropDownLabel;
            this.environmentDetailDropDown.labelFunction = this.setAdvancedDropDownLabel;
            this.characterDetailDropDown.labelFunction = this.setAdvancedDropDownLabel;
            this.fxDropDown.labelFunction = this.setAdvancedDropDownLabel;
            this.textureResolutionDropDown.labelFunction = this.setAdvancedDropDownLabel;
            this.textureFilteringDropDown.labelFunction = this.setAdvancedDropDownLabel;
            this.shadowsDropDown.labelFunction = this.setAdvancedDropDownLabel;
            this.realtimeReflectionsDropDown.labelFunction = this.setAdvancedDropDownLabel;
            this.antiAliasingDropDown.labelFunction = this.setAdvancedDropDownLabel;
            this.bloomDropDown.labelFunction = this.setAdvancedDropDownLabel;
            this.motionBlurDropDown.labelFunction = this.setAdvancedDropDownLabel;
            this.ambientOcclusionDropDown.labelFunction = this.setAdvancedDropDownLabel;
            this.depthOfFieldDropDown.labelFunction = this.setAdvancedDropDownLabel;
            this.volumetricLightingDropDown.labelFunction = this.setAdvancedDropDownLabel;
            this.lensFlaresDropDown.labelFunction = this.setAdvancedDropDownLabel;
            this.lightShaftsDropDown.labelFunction = this.setAdvancedDropDownLabel;
        }
        
        public function setGraphicsDropDownLabel(param1:Object) : String
        {
            if(param1)
            {
                if(param1 is String)
                {
                    return param1.toString();
                }
                return "";
            }
            return this.customString;
        }
        
        public function setAdvancedDropDownLabel(param1:Object) : String
        {
            if(param1)
            {
                if(param1 is String)
                {
                    return param1.toString();
                }
                return "";
            }
            return this.iniOverrideString;
        }
        
        private function removeListeners() : void
        {
            this.graphicsQualityDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onGraphicsQualitySet);
            this.aspectRatioDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onAspectRatioSet);
            this.closeButton.removeEventListener(ButtonEvent.PRESS,this.onClose);
            this.cancelButton.removeEventListener(ButtonEvent.PRESS,this.onClose);
            this.applyButton.removeEventListener(ButtonEvent.PRESS,this.onApply);
            this.defaultButton.removeEventListener(ButtonEvent.PRESS,this.onDefault);
            this.gammaButton.removeEventListener(ButtonEvent.PRESS,this.onOpenGamma);
            this.physicsLevelDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged);
            this.environmentDetailDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged);
            this.characterDetailDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged);
            this.fxDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged);
            this.textureResolutionDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged);
            this.textureFilteringDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged);
            this.shadowsDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged);
            this.realtimeReflectionsDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged);
            this.antiAliasingDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged);
            this.bloomDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged);
            this.motionBlurDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged);
            this.ambientOcclusionDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged);
            this.depthOfFieldDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged);
            this.volumetricLightingDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged);
            this.lensFlaresDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged);
            this.lightShaftsDropDown.removeEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged);
        }
        
        private function setListeners() : void
        {
            this.graphicsQualityDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onGraphicsQualitySet,false,0,true);
            this.aspectRatioDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onAspectRatioSet,false,0,true);
            this.closeButton.addEventListener(ButtonEvent.PRESS,this.onClose,false,0,true);
            this.cancelButton.addEventListener(ButtonEvent.PRESS,this.onClose,false,0,true);
            this.applyButton.addEventListener(ButtonEvent.PRESS,this.onApply,false,0,true);
            this.defaultButton.addEventListener(ButtonEvent.PRESS,this.onDefault,false,0,true);
            this.gammaButton.addEventListener(ButtonEvent.PRESS,this.onOpenGamma,false,0,true);
            this.physicsLevelDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged,false,0,true);
            this.environmentDetailDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged,false,0,true);
            this.characterDetailDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged,false,0,true);
            this.fxDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged,false,0,true);
            this.textureResolutionDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged,false,0,true);
            this.textureFilteringDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged,false,0,true);
            this.shadowsDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged,false,0,true);
            this.realtimeReflectionsDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged,false,0,true);
            this.antiAliasingDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged,false,0,true);
            this.bloomDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged,false,0,true);
            this.motionBlurDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged,false,0,true);
            this.ambientOcclusionDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged,false,0,true);
            this.depthOfFieldDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged,false,0,true);
            this.volumetricLightingDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged,false,0,true);
            this.lensFlaresDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged,false,0,true);
            this.lightShaftsDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onAdvancedOptionChanged,false,0,true);
        }
        
        override public function openContainer() : void
        {
            super.openContainer();
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.setTabIndex();
            this.setAdvancedDropdownLabelFunctions();
            this.physicsLevelDropDown.addEventListener(ListEvent.INDEX_CHANGE,this.onPhysicsLevelChange,false,0,true);
        }
        
        private function onPhysicsLevelChange(param1:ListEvent) : void
        {
            this.physicsCardTextField.text = this.physicsSuggestions[param1.index];
            ExternalInterface.call("Callback_FleXOptionChange",param1.index != 0);
        }
        
        private function onAdvancedOptionChanged(param1:Event) : void
        {
            ExternalInterface.call("OnAdvancedOptionChanged");
            this.graphicsQualityDropDown.selectedIndex = -1;
        }
        
        private function onGraphicsQualitySet(param1:ListEvent) : void
        {
            ExternalInterface.call("OnGraphicsQualitySet",param1.index);
        }
        
        private function onAspectRatioSet(param1:ListEvent) : void
        {
            ExternalInterface.call("OnAspectRatioSet",param1.index);
        }
        
        override public function selectContainer() : void
        {
            currentElement = defaultFirstElement;
            super.selectContainer();
            this.setListeners();
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            this.removeListeners();
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            this.goBackToOptionsSelection();
        }
        
        protected function goBackToOptionsSelection() : void
        {
            ExternalInterface.call("Callback_CloseMenu");
        }
        
        private function onOpenGamma(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_OpenGamma");
        }
        
        private function onApply(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_ApplyVideo");
        }
        
        private function onDefault(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_ResetDefaultVideo");
        }
        
        private function onClose(param1:ButtonEvent) : void
        {
            this.goBackToOptionsSelection();
        }
    }
}
