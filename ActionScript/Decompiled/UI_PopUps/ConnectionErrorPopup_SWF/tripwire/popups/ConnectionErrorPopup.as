package tripwire.popups
{
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.managers.FocusHandler;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.TextFieldEx;
    import tripwire.controls.TripButton;
    import tripwire.widgets.MultiPromptDisplay;
    
    public class ConnectionErrorPopup extends BasePopup
    {
         
        
        public var AcceptButton:TripButton;
        
        public var TitleTF:TextField;
        
        public var DescriptionTF:TextField;
        
        public var bAllowClose:Boolean = true;
        
        public var promptsContainer:MultiPromptDisplay;
        
        public function ConnectionErrorPopup()
        {
            super();
            defaultFirstElement = currentElement = this.AcceptButton;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.AcceptButton.addEventListener(ButtonEvent.PRESS,onClosePopup);
            this.AcceptButton.preventAutosizing = true;
            TextFieldEx.setVerticalAlign(this.DescriptionTF,TextFieldEx.VALIGN_CENTER);
            this.updateControllerVisibility(bManagerUsingGamepad);
        }
        
        override public function setTabIndex() : void
        {
            super.setTabIndex();
            this.AcceptButton.tabIndex = 1;
        }
        
        override public function set descriptionText(param1:String) : void
        {
            super.descriptionText = param1;
            this.DescriptionTF.text = param1;
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            this.updateControllerVisibility(bManagerUsingGamepad);
        }
        
        override public function openPopup() : void
        {
            super.openPopup();
            if(bManagerUsingGamepad)
            {
                FocusHandler.getInstance().setFocus(this.AcceptButton);
            }
            else
            {
                FocusHandler.getInstance().setFocus(null);
            }
        }
        
        public function updateControllerVisibility(param1:Boolean) : void
        {
            this.AcceptButton.visible = !param1;
            this.promptsContainer.visible = param1;
        }
        
        override public function setPopupText(param1:String, param2:String, param3:String, param4:String, param5:String) : *
        {
            var _loc6_:Array = new Array();
            this.TitleTF.text = param1;
            this.DescriptionTF.text = param2;
            if(param3 != "" && param3 != null)
            {
                this.AcceptButton.label = param3;
                _loc6_.push({
                    "promptText":param3,
                    "buttonDisplay":"xboxtypes_a"
                });
                this.promptsContainer.prompts = _loc6_;
                this.updateControllerVisibility(bManagerUsingGamepad);
            }
            else
            {
                this.bAllowClose = false;
                this.AcceptButton.visible = false;
                this.promptsContainer.visible = false;
                FocusHandler.getInstance().setFocus(null);
            }
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            if(this.bAllowClose)
            {
                closePopup();
            }
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            if(param1.handled)
            {
                return;
            }
            if(!_bReadyForInput)
            {
                return;
            }
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_A:
                        if(this.AcceptButton.label != "")
                        {
                            closePopup();
                            param1.handled;
                        }
                }
            }
        }
    }
}
