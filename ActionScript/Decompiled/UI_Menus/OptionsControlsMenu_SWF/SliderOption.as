package
{
    import tripwire.controls.SliderOption;
    
    public dynamic class SliderOption extends tripwire.controls.SliderOption
    {
         
        
        public function SliderOption()
        {
            super();
            this.__setProp_slider_SliderOptionMC_Layer1_0();
        }
        
        function __setProp_slider_SliderOptionMC_Layer1_0() : *
        {
            try
            {
                slider["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            slider.enabled = true;
            slider.enableInitCallback = false;
            slider.focusable = true;
            slider.liveDragging = true;
            slider.maximum = 100;
            slider.minimum = 0;
            slider.offsetLeft = 0;
            slider.offsetRight = 0;
            slider.snapInterval = 1;
            slider.snapping = false;
            slider.value = 0;
            slider.visible = true;
            try
            {
                slider["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
