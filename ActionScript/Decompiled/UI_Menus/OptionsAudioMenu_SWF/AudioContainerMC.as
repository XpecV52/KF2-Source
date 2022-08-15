package
{
    import tripwire.menus.OptionsAudioMenu;
    
    public dynamic class AudioContainerMC extends OptionsAudioMenu
    {
         
        
        public function AudioContainerMC()
        {
            super();
            this.__setProp_vocalsCheckBox_AudioContainerMC_test_0();
            this.__setProp_minimalDialogueCheckBox_AudioContainerMC_test_0();
            this.__setProp_pushToTalkBox_AudioContainerMC_test_0();
            this.__setProp_closeButton_AudioContainerMC_header_0();
        }
        
        function __setProp_vocalsCheckBox_AudioContainerMC_test_0() : *
        {
            try
            {
                vocalsCheckBox["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            vocalsCheckBox.autoSize = "none";
            vocalsCheckBox.data = "";
            vocalsCheckBox.enabled = true;
            vocalsCheckBox.enableInitCallback = false;
            vocalsCheckBox.focusable = true;
            vocalsCheckBox.label = "Music Vocals";
            vocalsCheckBox.selected = false;
            vocalsCheckBox.visible = true;
            try
            {
                vocalsCheckBox["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_minimalDialogueCheckBox_AudioContainerMC_test_0() : *
        {
            try
            {
                minimalDialogueCheckBox["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            minimalDialogueCheckBox.autoSize = "none";
            minimalDialogueCheckBox.data = "";
            minimalDialogueCheckBox.enabled = true;
            minimalDialogueCheckBox.enableInitCallback = false;
            minimalDialogueCheckBox.focusable = true;
            minimalDialogueCheckBox.label = "Music Vocals";
            minimalDialogueCheckBox.selected = false;
            minimalDialogueCheckBox.visible = true;
            try
            {
                minimalDialogueCheckBox["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_pushToTalkBox_AudioContainerMC_test_0() : *
        {
            try
            {
                pushToTalkBox["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            pushToTalkBox.autoSize = "none";
            pushToTalkBox.data = "";
            pushToTalkBox.enabled = true;
            pushToTalkBox.enableInitCallback = false;
            pushToTalkBox.focusable = true;
            pushToTalkBox.label = "Music Vocals";
            pushToTalkBox.selected = false;
            pushToTalkBox.visible = true;
            try
            {
                pushToTalkBox["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_closeButton_AudioContainerMC_header_0() : *
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
            closeButton.label = "SHENANIGANS";
            closeButton.selected = false;
            closeButton.toggle = false;
            closeButton.visible = true;
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
