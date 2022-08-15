package
{
    import tripwire.popups.GammaPopup;
    
    public dynamic class GammaComponent extends GammaPopup
    {
         
        
        public function GammaComponent()
        {
            super();
            this.__setProp_ApplyButton_gammaComponent_Buttons_0();
            this.__setProp_DefaultButton_gammaComponent_Buttons_0();
            this.__setProp_mainSlider_gammaComponent_slider_0();
        }
        
        function __setProp_ApplyButton_gammaComponent_Buttons_0() : *
        {
            try
            {
                ApplyButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            ApplyButton.autoRepeat = false;
            ApplyButton.autoSize = "none";
            ApplyButton.data = "";
            ApplyButton.enabled = true;
            ApplyButton.enableInitCallback = false;
            ApplyButton.focusable = true;
            ApplyButton.label = "<<BACK NOW";
            ApplyButton.selected = false;
            ApplyButton.toggle = false;
            ApplyButton.visible = true;
            try
            {
                ApplyButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_DefaultButton_gammaComponent_Buttons_0() : *
        {
            try
            {
                DefaultButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            DefaultButton.autoRepeat = false;
            DefaultButton.autoSize = "none";
            DefaultButton.data = "";
            DefaultButton.enabled = true;
            DefaultButton.enableInitCallback = false;
            DefaultButton.focusable = true;
            DefaultButton.label = "<<BACK NOW";
            DefaultButton.selected = false;
            DefaultButton.toggle = false;
            DefaultButton.visible = true;
            try
            {
                DefaultButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_mainSlider_gammaComponent_slider_0() : *
        {
            try
            {
                mainSlider["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            mainSlider.enabled = true;
            mainSlider.enableInitCallback = false;
            mainSlider.focusable = true;
            mainSlider.liveDragging = true;
            mainSlider.maximum = 1;
            mainSlider.minimum = 0;
            mainSlider.offsetLeft = 24;
            mainSlider.offsetRight = 0;
            mainSlider.snapInterval = 0.1;
            mainSlider.snapping = false;
            mainSlider.value = 0;
            mainSlider.visible = true;
            try
            {
                mainSlider["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
