package
{
    import tripwire.tutorial.TutorialPopupContainer;
    
    public dynamic class TutorialPopup extends TutorialPopupContainer
    {
         
        
        public function TutorialPopup()
        {
            super();
            this.__setProp_nextButton_TutorialPopup_Layer2_0();
            this.__setProp_backButton_TutorialPopup_Layer2_0();
            this.__setProp_skipButton_TutorialPopup_Layer2_0();
        }
        
        function __setProp_nextButton_TutorialPopup_Layer2_0() : *
        {
            try
            {
                nextButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            nextButton.autoRepeat = false;
            nextButton.autoSize = "left";
            nextButton.data = "";
            nextButton.enabled = true;
            nextButton.enableInitCallback = false;
            nextButton.focusable = true;
            nextButton.label = "<<BACK NOW";
            nextButton.selected = false;
            nextButton.toggle = false;
            nextButton.visible = true;
            try
            {
                nextButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_backButton_TutorialPopup_Layer2_0() : *
        {
            try
            {
                backButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            backButton.autoRepeat = false;
            backButton.autoSize = "left";
            backButton.data = "";
            backButton.enabled = true;
            backButton.enableInitCallback = false;
            backButton.focusable = true;
            backButton.label = "<<BACK NOW";
            backButton.selected = false;
            backButton.toggle = false;
            backButton.visible = true;
            try
            {
                backButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_skipButton_TutorialPopup_Layer2_0() : *
        {
            try
            {
                skipButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            skipButton.autoRepeat = false;
            skipButton.autoSize = "left";
            skipButton.data = "";
            skipButton.enabled = true;
            skipButton.enableInitCallback = false;
            skipButton.focusable = true;
            skipButton.label = "<<BACK NOW";
            skipButton.selected = false;
            skipButton.toggle = false;
            skipButton.visible = true;
            try
            {
                skipButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
