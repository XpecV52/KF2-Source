package tripwire.widgets
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import tripwire.containers.TripContainer;
    import tripwire.managers.MenuManager;
    
    public class ButtonPromptWidget extends TripContainer
    {
         
        
        public var promptDisplay:MultiPromptDisplay;
        
        public var promptBG:MovieClip;
        
        private var _displayedPrompts:int = 0;
        
        private var _defaultBGWidth;
        
        private var _buttonOverRides:Object;
        
        private var _confirmStr:String;
        
        private var _partyStr:String;
        
        private var _cancelStr:String;
        
        private var _resetStr:String;
        
        private var _configStr:String;
        
        private var _promptConfigs:Object;
        
        public function ButtonPromptWidget()
        {
            super();
            enableInitCallback = true;
            this._defaultBGWidth = this.promptBG.width;
            this._buttonOverRides = new Object();
            this._buttonOverRides["xboxtypes_a"] = this._buttonOverRides["xboxtypes_a_o"] = 0;
            this._buttonOverRides["xboxtypes_back"] = this._buttonOverRides["xboxtypes_back_o"] = 1;
            this._buttonOverRides["xboxtypes_b"] = this._buttonOverRides["xboxtypes_b_o"] = 2;
            this._buttonOverRides["xboxtypes_x"] = this._buttonOverRides["xboxtypes_x_o"] = 3;
            this._buttonOverRides["xboxtypes_y"] = this._buttonOverRides["xboxtypes_y_o"] = 4;
            this._buttonOverRides["xboxtypes_start"] = this._buttonOverRides["xboxtypes_start_o"] = 5;
            this._buttonOverRides["xboxtypes_leftshoulder"] = this._buttonOverRides["xboxtypes_leftshoulder_o"] = 6;
            this._buttonOverRides["xboxtypes_rightshoulder"] = this._buttonOverRides["xboxtypes_rightshoulder_o"] = 7;
            this._buttonOverRides["xboxtypes_lefttrigger"] = this._buttonOverRides["xboxtypes_lefttrigger_o"] = 8;
            this._buttonOverRides["xboxtypes_righttrigger"] = this._buttonOverRides["xboxtypes_righttrigger_o"] = 9;
            this._buttonOverRides["xboxtypes_dpad_up"] = this._buttonOverRides["xboxtypes_dpad_up_o"] = 10;
            this._buttonOverRides["xboxtypes_dpad_right"] = this._buttonOverRides["xboxtypes_dpad_right_o"] = 11;
            this._buttonOverRides["xboxtypes_dpad_down"] = this._buttonOverRides["xboxtypes_dpad_down_o"] = 12;
            this._buttonOverRides["xboxtypes_dpad_left"] = this._buttonOverRides["xboxtypes_dpad_left_o"] = 13;
            this._buttonOverRides["xboxtypes_leftthumbstick"] = this._buttonOverRides["xboxtypes_leftthumbstick_o"] = 14;
            this._buttonOverRides["xboxtypes_rightthumbstick"] = this._buttonOverRides["xboxtypes_rightthumbstick_o"] = 15;
            this.promptDisplay.buttonPriority = this._buttonOverRides;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            stage.addEventListener(MenuManager.PARTYFOCUS_CHANGED,this.onPartyFocusChanged,false,0,true);
            stage.addEventListener(MenuManager.POPUP_CHANGED,this.onPopupChanged,false,0,true);
        }
        
        override protected function configUI() : void
        {
            super.configUI();
            if(this._displayedPrompts > 0)
            {
                this.updateVisibilityBasedOnInputType(true);
            }
        }
        
        override public function openContainer(param1:Boolean = true) : void
        {
            super.openContainer(param1);
            stage.addEventListener(MenuManager.PROMPT_CHANGED,this.onPromptChanged,false,0,true);
            this.onPromptChanged();
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            stage.removeEventListener(MenuManager.PROMPT_CHANGED,this.onPromptChanged);
        }
        
        public function set localizedText(param1:Object) : void
        {
            this._confirmStr = !!param1.confirm ? param1.confirm : "";
            this._partyStr = !!param1.party ? param1.party : "";
            this._cancelStr = !!param1.cancel ? param1.cancel : "";
            this._resetStr = !!param1.reset ? param1.reset : "";
            this._configStr = !!param1.config ? param1.config : "";
            this._promptConfigs = new Object();
            this._promptConfigs[1] = new Array({
                "buttonDisplay":"xboxtypes_a",
                "promptText":this._confirmStr
            },{
                "buttonDisplay":"xboxtypes_back",
                "promptText":this._partyStr
            });
            this._promptConfigs[2] = new Array({
                "buttonDisplay":"xboxtypes_a",
                "promptText":this._confirmStr
            },{
                "buttonDisplay":"xboxtypes_back",
                "promptText":this._partyStr
            },{
                "buttonDisplay":"xboxtypes_b",
                "promptText":this._cancelStr
            });
            this._promptConfigs[3] = new Array({
                "buttonDisplay":"xboxtypes_a",
                "promptText":this._confirmStr
            },{
                "buttonDisplay":"xboxtypes_back",
                "promptText":this._partyStr
            },{
                "buttonDisplay":"xboxtypes_b",
                "promptText":this._cancelStr
            },{
                "buttonDisplay":"xboxtypes_x",
                "promptText":this._resetStr
            });
            this._promptConfigs[4] = new Array({
                "buttonDisplay":"xboxtypes_a",
                "promptText":this._confirmStr
            },{
                "buttonDisplay":"xboxtypes_back",
                "promptText":this._partyStr
            },{
                "buttonDisplay":"xboxtypes_x",
                "promptText":this._configStr
            });
            this._promptConfigs[5] = new Array({
                "buttonDisplay":"xboxtypes_a",
                "promptText":this._confirmStr
            },{
                "buttonDisplay":"xboxtypes_back",
                "promptText":this._partyStr
            },{
                "buttonDisplay":"xboxtypes_b",
                "promptText":this._cancelStr
            },{
                "buttonDisplay":"xboxtypes_x",
                "promptText":this._configStr
            });
            this._promptConfigs[6] = new Array({
                "buttonDisplay":"xboxtypes_back",
                "promptText":this._partyStr
            });
            this._promptConfigs[7] = new Array({
                "buttonDisplay":"xboxtypes_back",
                "promptText":this._partyStr
            },{
                "buttonDisplay":"xboxtypes_b",
                "promptText":this._cancelStr
            });
        }
        
        override public function set visible(param1:Boolean) : void
        {
            if(param1)
            {
                param1 = bManagerUsingGamepad && !MenuManager.manager.bPartyWidgetFocused;
            }
            super.visible = param1;
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.updateVisibilityBasedOnInputType();
        }
        
        protected function updateVisibilityBasedOnInputType(param1:Boolean = false) : *
        {
            if(this._displayedPrompts != MenuManager.manager.numPrompts || param1)
            {
                this._displayedPrompts = MenuManager.manager.numPrompts;
                if(!initialized)
                {
                    return;
                }
                this.promptDisplay.prompts = this._promptConfigs[this._displayedPrompts];
                this.promptBG.width = this.promptDisplay.x * 2 + this.promptDisplay.runningWidth;
            }
            this.visible = bManagerUsingGamepad && this._displayedPrompts > 0 && !MenuManager.manager.bPartyWidgetFocused && !MenuManager.manager.bPopUpOpen;
        }
        
        protected function onPromptChanged(param1:Event = null) : *
        {
            this.updateVisibilityBasedOnInputType();
        }
        
        protected function onPartyFocusChanged(param1:Event) : *
        {
            if(bManagerUsingGamepad && this._displayedPrompts > 0)
            {
                this.visible = !MenuManager.manager.bPartyWidgetFocused;
            }
        }
        
        protected function onPopupChanged(param1:Event) : *
        {
            this.visible = bManagerUsingGamepad && this._displayedPrompts > 0 && !MenuManager.manager.bPartyWidgetFocused && !MenuManager.manager.bPopUpOpen;
        }
    }
}
