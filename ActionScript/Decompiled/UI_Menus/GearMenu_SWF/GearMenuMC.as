package
{
    import tripwire.menus.GearMenu;
    
    public dynamic class GearMenuMC extends GearMenu
    {
         
        
        public function GearMenuMC()
        {
            super();
            this.__setProp_attachmentButton_GearMenuMC_Accessory_0();
            this.__setProp_bodyButton_GearMenuMC_Skin_0();
            this.__setProp_headButton_GearMenuMC_Head_0();
            this.__setProp_bioTextArea_GearMenuMC_Bio_0();
            this.__setProp_characterButton_GearMenuMC_Character_0();
            this.__setProp_emoteButton_GearMenuMC_Character_0();
        }
        
        function __setProp_attachmentButton_GearMenuMC_Accessory_0() : *
        {
            try
            {
                attachmentButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            attachmentButton.autoRepeat = false;
            attachmentButton.autoSize = "none";
            attachmentButton.data = "";
            attachmentButton.enabled = true;
            attachmentButton.enableInitCallback = false;
            attachmentButton.focusable = true;
            attachmentButton.infoString = "INFO";
            attachmentButton.label = "TITLE";
            attachmentButton.selected = false;
            attachmentButton.toggle = false;
            attachmentButton.visible = true;
            try
            {
                attachmentButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_bodyButton_GearMenuMC_Skin_0() : *
        {
            try
            {
                bodyButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            bodyButton.autoRepeat = false;
            bodyButton.autoSize = "none";
            bodyButton.data = "";
            bodyButton.enabled = true;
            bodyButton.enableInitCallback = false;
            bodyButton.focusable = true;
            bodyButton.infoString = "INFO";
            bodyButton.label = "TITLE";
            bodyButton.selected = false;
            bodyButton.toggle = false;
            bodyButton.visible = true;
            try
            {
                bodyButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_headButton_GearMenuMC_Head_0() : *
        {
            try
            {
                headButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            headButton.autoRepeat = false;
            headButton.autoSize = "none";
            headButton.data = "";
            headButton.enabled = true;
            headButton.enableInitCallback = false;
            headButton.focusable = true;
            headButton.infoString = "INFO";
            headButton.label = "TITLE";
            headButton.selected = false;
            headButton.toggle = false;
            headButton.visible = true;
            try
            {
                headButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_bioTextArea_GearMenuMC_Bio_0() : *
        {
            try
            {
                bioTextArea["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            bioTextArea.actAsButton = false;
            bioTextArea.defaultText = "";
            bioTextArea.displayAsPassword = false;
            bioTextArea.editable = false;
            bioTextArea.enabled = true;
            bioTextArea.enableInitCallback = false;
            bioTextArea.focusable = true;
            bioTextArea.maxChars = 0;
            bioTextArea.minThumbSize = 2;
            bioTextArea.scrollBar = "";
            bioTextArea.text = "I am your body.";
            bioTextArea.thumbOffset = {
                "top":0,
                "bottom":0
            };
            bioTextArea.titleText = "I am your title";
            bioTextArea.visible = true;
            try
            {
                bioTextArea["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_characterButton_GearMenuMC_Character_0() : *
        {
            try
            {
                characterButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            characterButton.autoRepeat = false;
            characterButton.autoSize = "none";
            characterButton.data = "";
            characterButton.enabled = true;
            characterButton.enableInitCallback = false;
            characterButton.focusable = true;
            characterButton.infoString = "INFO";
            characterButton.label = "TITLE";
            characterButton.selected = false;
            characterButton.toggle = false;
            characterButton.visible = true;
            try
            {
                characterButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_emoteButton_GearMenuMC_Character_0() : *
        {
            try
            {
                emoteButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            emoteButton.autoRepeat = false;
            emoteButton.autoSize = "none";
            emoteButton.data = "";
            emoteButton.enabled = true;
            emoteButton.enableInitCallback = false;
            emoteButton.focusable = true;
            emoteButton.infoString = "INFO";
            emoteButton.label = "TITLE";
            emoteButton.selected = false;
            emoteButton.toggle = false;
            emoteButton.visible = true;
            try
            {
                emoteButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
