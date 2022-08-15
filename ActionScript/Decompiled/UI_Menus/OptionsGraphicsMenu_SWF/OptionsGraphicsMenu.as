package
{
    import tripwire.menus.OptionsGraphicsMenu;
    
    public dynamic class OptionsGraphicsMenu extends tripwire.menus.OptionsGraphicsMenu
    {
         
        
        public function OptionsGraphicsMenu()
        {
            super();
            this.__setProp_cancelButton_OptionsGraphicsMenu_applyandcancelbutton_0();
            this.__setProp_applyButton_OptionsGraphicsMenu_applyandcancelbutton_0();
            this.__setProp_defaultButton_OptionsGraphicsMenu_applyandcancelbutton_0();
            this.__setProp_resolutionDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_fullScreenDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_graphicsQualityDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_vSyncDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_environmentDetailDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_characterDetailDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_fxDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_textureResolutionDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_textureFilteringDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_shadowsDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_realtimeReflectionsDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_antiAliasingDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_bloomDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_motionBlurDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_ambientOcclusionDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_depthOfFieldDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_volumetricLightingDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_lightShaftsDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_lensFlaresDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_aspectRatioDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_physicsLevelDropDown_OptionsGraphicsMenu_details_0();
            this.__setProp_closeButton_OptionsGraphicsMenu_closebutton_0();
        }
        
        function __setProp_cancelButton_OptionsGraphicsMenu_applyandcancelbutton_0() : *
        {
            try
            {
                cancelButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            cancelButton.autoRepeat = false;
            cancelButton.autoSize = "none";
            cancelButton.data = "";
            cancelButton.enabled = true;
            cancelButton.enableInitCallback = false;
            cancelButton.focusable = true;
            cancelButton.label = "Canceltxt";
            cancelButton.selected = false;
            cancelButton.toggle = false;
            cancelButton.visible = true;
            try
            {
                cancelButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_applyButton_OptionsGraphicsMenu_applyandcancelbutton_0() : *
        {
            try
            {
                applyButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            applyButton.autoRepeat = false;
            applyButton.autoSize = "none";
            applyButton.data = "";
            applyButton.enabled = true;
            applyButton.enableInitCallback = false;
            applyButton.focusable = true;
            applyButton.label = "Applytxt";
            applyButton.selected = false;
            applyButton.toggle = false;
            applyButton.visible = true;
            try
            {
                applyButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_defaultButton_OptionsGraphicsMenu_applyandcancelbutton_0() : *
        {
            try
            {
                defaultButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            defaultButton.autoRepeat = false;
            defaultButton.autoSize = "none";
            defaultButton.data = "";
            defaultButton.enabled = true;
            defaultButton.enableInitCallback = false;
            defaultButton.focusable = true;
            defaultButton.label = "Defaulttxt";
            defaultButton.selected = false;
            defaultButton.toggle = false;
            defaultButton.visible = true;
            try
            {
                defaultButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_resolutionDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                resolutionDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            resolutionDropDown.autoSize = "none";
            resolutionDropDown.dropdown = "$DropDownScrollingList";
            resolutionDropDown.enabled = true;
            resolutionDropDown.enableInitCallback = false;
            resolutionDropDown.focusable = true;
            resolutionDropDown.itemRenderer = "DefaultTripListItemRenderer";
            resolutionDropDown.menuDirection = "down";
            resolutionDropDown.menuMargin = 0;
            resolutionDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            resolutionDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            resolutionDropDown.menuRowCount = 9;
            resolutionDropDown.menuWidth = -1;
            resolutionDropDown.menuWrapping = "stick";
            resolutionDropDown.scrollBar = "ListScrollBar";
            resolutionDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            resolutionDropDown.visible = true;
            try
            {
                resolutionDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_fullScreenDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                fullScreenDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            fullScreenDropDown.autoSize = "none";
            fullScreenDropDown.dropdown = "$DropDownScrollingList";
            fullScreenDropDown.enabled = true;
            fullScreenDropDown.enableInitCallback = false;
            fullScreenDropDown.focusable = true;
            fullScreenDropDown.itemRenderer = "DefaultTripListItemRenderer";
            fullScreenDropDown.menuDirection = "down";
            fullScreenDropDown.menuMargin = 0;
            fullScreenDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            fullScreenDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            fullScreenDropDown.menuRowCount = 4;
            fullScreenDropDown.menuWidth = -1;
            fullScreenDropDown.menuWrapping = "stick";
            fullScreenDropDown.scrollBar = "ListScrollBar";
            fullScreenDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            fullScreenDropDown.visible = true;
            try
            {
                fullScreenDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_graphicsQualityDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                graphicsQualityDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            graphicsQualityDropDown.autoSize = "none";
            graphicsQualityDropDown.dropdown = "$DropDownScrollingList";
            graphicsQualityDropDown.enabled = true;
            graphicsQualityDropDown.enableInitCallback = false;
            graphicsQualityDropDown.focusable = true;
            graphicsQualityDropDown.itemRenderer = "DefaultTripListItemRenderer";
            graphicsQualityDropDown.menuDirection = "down";
            graphicsQualityDropDown.menuMargin = 0;
            graphicsQualityDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            graphicsQualityDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            graphicsQualityDropDown.menuRowCount = 5;
            graphicsQualityDropDown.menuWidth = -1;
            graphicsQualityDropDown.menuWrapping = "stick";
            graphicsQualityDropDown.scrollBar = "ListScrollBar";
            graphicsQualityDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            graphicsQualityDropDown.visible = true;
            try
            {
                graphicsQualityDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_vSyncDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                vSyncDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            vSyncDropDown.autoSize = "none";
            vSyncDropDown.dropdown = "$DropDownScrollingList";
            vSyncDropDown.enabled = true;
            vSyncDropDown.enableInitCallback = false;
            vSyncDropDown.focusable = true;
            vSyncDropDown.itemRenderer = "DefaultTripListItemRenderer";
            vSyncDropDown.menuDirection = "down";
            vSyncDropDown.menuMargin = 0;
            vSyncDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            vSyncDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            vSyncDropDown.menuRowCount = 3;
            vSyncDropDown.menuWidth = -1;
            vSyncDropDown.menuWrapping = "stick";
            vSyncDropDown.scrollBar = "ListScrollBar";
            vSyncDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            vSyncDropDown.visible = true;
            try
            {
                vSyncDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_environmentDetailDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                environmentDetailDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            environmentDetailDropDown.autoSize = "none";
            environmentDetailDropDown.dropdown = "$DropDownScrollingList";
            environmentDetailDropDown.enabled = true;
            environmentDetailDropDown.enableInitCallback = false;
            environmentDetailDropDown.focusable = true;
            environmentDetailDropDown.itemRenderer = "DefaultTripListItemRenderer";
            environmentDetailDropDown.menuDirection = "down";
            environmentDetailDropDown.menuMargin = 0;
            environmentDetailDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            environmentDetailDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            environmentDetailDropDown.menuRowCount = 5;
            environmentDetailDropDown.menuWidth = -1;
            environmentDetailDropDown.menuWrapping = "stick";
            environmentDetailDropDown.scrollBar = "ListScrollBar";
            environmentDetailDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            environmentDetailDropDown.visible = true;
            try
            {
                environmentDetailDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_characterDetailDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                characterDetailDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            characterDetailDropDown.autoSize = "none";
            characterDetailDropDown.dropdown = "$DropDownScrollingList";
            characterDetailDropDown.enabled = true;
            characterDetailDropDown.enableInitCallback = false;
            characterDetailDropDown.focusable = true;
            characterDetailDropDown.itemRenderer = "DefaultTripListItemRenderer";
            characterDetailDropDown.menuDirection = "down";
            characterDetailDropDown.menuMargin = 0;
            characterDetailDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            characterDetailDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            characterDetailDropDown.menuRowCount = 4;
            characterDetailDropDown.menuWidth = -1;
            characterDetailDropDown.menuWrapping = "stick";
            characterDetailDropDown.scrollBar = "ListScrollBar";
            characterDetailDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            characterDetailDropDown.visible = true;
            try
            {
                characterDetailDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_fxDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                fxDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            fxDropDown.autoSize = "none";
            fxDropDown.dropdown = "$DropDownScrollingList";
            fxDropDown.enabled = true;
            fxDropDown.enableInitCallback = false;
            fxDropDown.focusable = true;
            fxDropDown.itemRenderer = "DefaultTripListItemRenderer";
            fxDropDown.menuDirection = "down";
            fxDropDown.menuMargin = 0;
            fxDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            fxDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            fxDropDown.menuRowCount = 5;
            fxDropDown.menuWidth = -1;
            fxDropDown.menuWrapping = "stick";
            fxDropDown.scrollBar = "ListScrollBar";
            fxDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            fxDropDown.visible = true;
            try
            {
                fxDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_textureResolutionDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                textureResolutionDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            textureResolutionDropDown.autoSize = "none";
            textureResolutionDropDown.dropdown = "$DropDownScrollingList";
            textureResolutionDropDown.enabled = true;
            textureResolutionDropDown.enableInitCallback = false;
            textureResolutionDropDown.focusable = true;
            textureResolutionDropDown.itemRenderer = "DefaultTripListItemRenderer";
            textureResolutionDropDown.menuDirection = "down";
            textureResolutionDropDown.menuMargin = 0;
            textureResolutionDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            textureResolutionDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            textureResolutionDropDown.menuRowCount = 5;
            textureResolutionDropDown.menuWidth = -1;
            textureResolutionDropDown.menuWrapping = "stick";
            textureResolutionDropDown.scrollBar = "ListScrollBar";
            textureResolutionDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            textureResolutionDropDown.visible = true;
            try
            {
                textureResolutionDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_textureFilteringDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                textureFilteringDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            textureFilteringDropDown.autoSize = "none";
            textureFilteringDropDown.dropdown = "$DropDownScrollingList";
            textureFilteringDropDown.enabled = true;
            textureFilteringDropDown.enableInitCallback = false;
            textureFilteringDropDown.focusable = true;
            textureFilteringDropDown.itemRenderer = "DefaultTripListItemRenderer";
            textureFilteringDropDown.menuDirection = "down";
            textureFilteringDropDown.menuMargin = 0;
            textureFilteringDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            textureFilteringDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            textureFilteringDropDown.menuRowCount = 5;
            textureFilteringDropDown.menuWidth = -1;
            textureFilteringDropDown.menuWrapping = "stick";
            textureFilteringDropDown.scrollBar = "ListScrollBar";
            textureFilteringDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            textureFilteringDropDown.visible = true;
            try
            {
                textureFilteringDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_shadowsDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                shadowsDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            shadowsDropDown.autoSize = "none";
            shadowsDropDown.dropdown = "$DropDownScrollingList";
            shadowsDropDown.enabled = true;
            shadowsDropDown.enableInitCallback = false;
            shadowsDropDown.focusable = true;
            shadowsDropDown.itemRenderer = "DefaultTripListItemRenderer";
            shadowsDropDown.menuDirection = "down";
            shadowsDropDown.menuMargin = 0;
            shadowsDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            shadowsDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            shadowsDropDown.menuRowCount = 5;
            shadowsDropDown.menuWidth = -1;
            shadowsDropDown.menuWrapping = "stick";
            shadowsDropDown.scrollBar = "ListScrollBar";
            shadowsDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            shadowsDropDown.visible = true;
            try
            {
                shadowsDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_realtimeReflectionsDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                realtimeReflectionsDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            realtimeReflectionsDropDown.autoSize = "none";
            realtimeReflectionsDropDown.dropdown = "$DropDownScrollingList";
            realtimeReflectionsDropDown.enabled = true;
            realtimeReflectionsDropDown.enableInitCallback = false;
            realtimeReflectionsDropDown.focusable = true;
            realtimeReflectionsDropDown.itemRenderer = "DefaultTripListItemRenderer";
            realtimeReflectionsDropDown.menuDirection = "down";
            realtimeReflectionsDropDown.menuMargin = 0;
            realtimeReflectionsDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            realtimeReflectionsDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            realtimeReflectionsDropDown.menuRowCount = 4;
            realtimeReflectionsDropDown.menuWidth = -1;
            realtimeReflectionsDropDown.menuWrapping = "stick";
            realtimeReflectionsDropDown.scrollBar = "ListScrollBar";
            realtimeReflectionsDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            realtimeReflectionsDropDown.visible = true;
            try
            {
                realtimeReflectionsDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_antiAliasingDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                antiAliasingDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            antiAliasingDropDown.autoSize = "none";
            antiAliasingDropDown.dropdown = "$DropDownScrollingList";
            antiAliasingDropDown.enabled = true;
            antiAliasingDropDown.enableInitCallback = false;
            antiAliasingDropDown.focusable = true;
            antiAliasingDropDown.itemRenderer = "DefaultTripListItemRenderer";
            antiAliasingDropDown.menuDirection = "down";
            antiAliasingDropDown.menuMargin = 0;
            antiAliasingDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            antiAliasingDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            antiAliasingDropDown.menuRowCount = 3;
            antiAliasingDropDown.menuWidth = -1;
            antiAliasingDropDown.menuWrapping = "stick";
            antiAliasingDropDown.scrollBar = "ListScrollBar";
            antiAliasingDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            antiAliasingDropDown.visible = true;
            try
            {
                antiAliasingDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_bloomDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                bloomDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            bloomDropDown.autoSize = "none";
            bloomDropDown.dropdown = "$DropDownScrollingList";
            bloomDropDown.enabled = true;
            bloomDropDown.enableInitCallback = false;
            bloomDropDown.focusable = true;
            bloomDropDown.itemRenderer = "DefaultTripListItemRenderer";
            bloomDropDown.menuDirection = "down";
            bloomDropDown.menuMargin = 0;
            bloomDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            bloomDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            bloomDropDown.menuRowCount = 4;
            bloomDropDown.menuWidth = -1;
            bloomDropDown.menuWrapping = "stick";
            bloomDropDown.scrollBar = "ListScrollBar";
            bloomDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            bloomDropDown.visible = true;
            try
            {
                bloomDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_motionBlurDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                motionBlurDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            motionBlurDropDown.autoSize = "none";
            motionBlurDropDown.dropdown = "$DropDownScrollingList";
            motionBlurDropDown.enabled = true;
            motionBlurDropDown.enableInitCallback = false;
            motionBlurDropDown.focusable = true;
            motionBlurDropDown.itemRenderer = "DefaultTripListItemRenderer";
            motionBlurDropDown.menuDirection = "down";
            motionBlurDropDown.menuMargin = 0;
            motionBlurDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            motionBlurDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            motionBlurDropDown.menuRowCount = 4;
            motionBlurDropDown.menuWidth = -1;
            motionBlurDropDown.menuWrapping = "stick";
            motionBlurDropDown.scrollBar = "ListScrollBar";
            motionBlurDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            motionBlurDropDown.visible = true;
            try
            {
                motionBlurDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_ambientOcclusionDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                ambientOcclusionDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            ambientOcclusionDropDown.autoSize = "none";
            ambientOcclusionDropDown.dropdown = "$DropDownScrollingList";
            ambientOcclusionDropDown.enabled = true;
            ambientOcclusionDropDown.enableInitCallback = false;
            ambientOcclusionDropDown.focusable = true;
            ambientOcclusionDropDown.itemRenderer = "DefaultTripListItemRenderer";
            ambientOcclusionDropDown.menuDirection = "down";
            ambientOcclusionDropDown.menuMargin = 0;
            ambientOcclusionDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            ambientOcclusionDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            ambientOcclusionDropDown.menuRowCount = 4;
            ambientOcclusionDropDown.menuWidth = -1;
            ambientOcclusionDropDown.menuWrapping = "stick";
            ambientOcclusionDropDown.scrollBar = "ListScrollBar";
            ambientOcclusionDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            ambientOcclusionDropDown.visible = true;
            try
            {
                ambientOcclusionDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_depthOfFieldDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                depthOfFieldDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            depthOfFieldDropDown.autoSize = "none";
            depthOfFieldDropDown.dropdown = "$DropDownScrollingList";
            depthOfFieldDropDown.enabled = true;
            depthOfFieldDropDown.enableInitCallback = false;
            depthOfFieldDropDown.focusable = true;
            depthOfFieldDropDown.itemRenderer = "DefaultTripListItemRenderer";
            depthOfFieldDropDown.menuDirection = "down";
            depthOfFieldDropDown.menuMargin = 0;
            depthOfFieldDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            depthOfFieldDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            depthOfFieldDropDown.menuRowCount = 3;
            depthOfFieldDropDown.menuWidth = -1;
            depthOfFieldDropDown.menuWrapping = "stick";
            depthOfFieldDropDown.scrollBar = "ListScrollBar";
            depthOfFieldDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            depthOfFieldDropDown.visible = true;
            try
            {
                depthOfFieldDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_volumetricLightingDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                volumetricLightingDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            volumetricLightingDropDown.autoSize = "none";
            volumetricLightingDropDown.dropdown = "$DropDownScrollingList";
            volumetricLightingDropDown.enabled = true;
            volumetricLightingDropDown.enableInitCallback = false;
            volumetricLightingDropDown.focusable = true;
            volumetricLightingDropDown.itemRenderer = "DefaultTripListItemRenderer";
            volumetricLightingDropDown.menuDirection = "down";
            volumetricLightingDropDown.menuMargin = 0;
            volumetricLightingDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            volumetricLightingDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            volumetricLightingDropDown.menuRowCount = 3;
            volumetricLightingDropDown.menuWidth = -1;
            volumetricLightingDropDown.menuWrapping = "stick";
            volumetricLightingDropDown.scrollBar = "ListScrollBar";
            volumetricLightingDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            volumetricLightingDropDown.visible = true;
            try
            {
                volumetricLightingDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_lightShaftsDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                lightShaftsDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            lightShaftsDropDown.autoSize = "none";
            lightShaftsDropDown.dropdown = "$DropDownScrollingList";
            lightShaftsDropDown.enabled = true;
            lightShaftsDropDown.enableInitCallback = false;
            lightShaftsDropDown.focusable = true;
            lightShaftsDropDown.itemRenderer = "DefaultTripListItemRenderer";
            lightShaftsDropDown.menuDirection = "down";
            lightShaftsDropDown.menuMargin = 0;
            lightShaftsDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            lightShaftsDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            lightShaftsDropDown.menuRowCount = 3;
            lightShaftsDropDown.menuWidth = -1;
            lightShaftsDropDown.menuWrapping = "stick";
            lightShaftsDropDown.scrollBar = "ListScrollBar";
            lightShaftsDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            lightShaftsDropDown.visible = true;
            try
            {
                lightShaftsDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_lensFlaresDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                lensFlaresDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            lensFlaresDropDown.autoSize = "none";
            lensFlaresDropDown.dropdown = "$DropDownScrollingList";
            lensFlaresDropDown.enabled = true;
            lensFlaresDropDown.enableInitCallback = false;
            lensFlaresDropDown.focusable = true;
            lensFlaresDropDown.itemRenderer = "DefaultTripListItemRenderer";
            lensFlaresDropDown.menuDirection = "down";
            lensFlaresDropDown.menuMargin = 0;
            lensFlaresDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            lensFlaresDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            lensFlaresDropDown.menuRowCount = 3;
            lensFlaresDropDown.menuWidth = -1;
            lensFlaresDropDown.menuWrapping = "stick";
            lensFlaresDropDown.scrollBar = "ListScrollBar";
            lensFlaresDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            lensFlaresDropDown.visible = true;
            try
            {
                lensFlaresDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_aspectRatioDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                aspectRatioDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            aspectRatioDropDown.autoSize = "none";
            aspectRatioDropDown.dropdown = "$DropDownScrollingList";
            aspectRatioDropDown.enabled = true;
            aspectRatioDropDown.enableInitCallback = false;
            aspectRatioDropDown.focusable = true;
            aspectRatioDropDown.itemRenderer = "DefaultTripListItemRenderer";
            aspectRatioDropDown.menuDirection = "down";
            aspectRatioDropDown.menuMargin = 0;
            aspectRatioDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            aspectRatioDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            aspectRatioDropDown.menuRowCount = 7;
            aspectRatioDropDown.menuWidth = -1;
            aspectRatioDropDown.menuWrapping = "stick";
            aspectRatioDropDown.scrollBar = "ListScrollBar";
            aspectRatioDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            aspectRatioDropDown.visible = true;
            try
            {
                aspectRatioDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_physicsLevelDropDown_OptionsGraphicsMenu_details_0() : *
        {
            try
            {
                physicsLevelDropDown["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            physicsLevelDropDown.autoSize = "none";
            physicsLevelDropDown.dropdown = "$DropDownScrollingList";
            physicsLevelDropDown.enabled = true;
            physicsLevelDropDown.enableInitCallback = false;
            physicsLevelDropDown.focusable = true;
            physicsLevelDropDown.itemRenderer = "DefaultTripListItemRenderer";
            physicsLevelDropDown.menuDirection = "down";
            physicsLevelDropDown.menuMargin = 0;
            physicsLevelDropDown.inspectableMenuOffset = {
                "top":-6,
                "right":0,
                "bottom":0,
                "left":0
            };
            physicsLevelDropDown.inspectableMenuPadding = {
                "top":-6,
                "right":8,
                "bottom":0,
                "left":-1
            };
            physicsLevelDropDown.menuRowCount = 4;
            physicsLevelDropDown.menuWidth = -1;
            physicsLevelDropDown.menuWrapping = "stick";
            physicsLevelDropDown.scrollBar = "ListScrollBar";
            physicsLevelDropDown.inspectableThumbOffset = {
                "top":0,
                "bottom":0
            };
            physicsLevelDropDown.visible = true;
            try
            {
                physicsLevelDropDown["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_closeButton_OptionsGraphicsMenu_closebutton_0() : *
        {
            try
            {
                closeButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            closeButton.autoRepeat = false;
            closeButton.autoSize = "none";
            closeButton.data = "";
            closeButton.enabled = true;
            closeButton.enableInitCallback = false;
            closeButton.focusable = true;
            closeButton.label = "";
            closeButton.selected = false;
            closeButton.toggle = false;
            closeButton.visible = false;
            try
            {
                closeButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
