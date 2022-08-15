package tripwire.popups
{
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.gfx.FocusManager;
    import scaleform.gfx.TextFieldEx;
    import tripwire.controls.TripButton;
    
    public class ConfirmationPopup extends BasePopup
    {
         
        
        public var leftButton:TripButton;
        
        public var middleButton:TripButton;
        
        public var rightButton:TripButton;
        
        public var TitleTF:TextField;
        
        public var DescriptionTF:TextField;
        
        public function ConfirmationPopup()
        {
            super();
            enableInitCallback = true;
            defaultFirstElement = currentElement = this.leftButton;
        }
        
        override public function set descriptionText(param1:String) : void
        {
            super.descriptionText = param1;
            this.DescriptionTF.text = param1;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.openPopup();
            TextFieldEx.setVerticalAlign(this.DescriptionTF,TextFieldEx.VALIGN_CENTER);
            this.leftButton.addEventListener(ButtonEvent.PRESS,this.onLeftOption,false,0,true);
            this.middleButton.addEventListener(ButtonEvent.PRESS,this.onMiddleOption,false,0,true);
            this.rightButton.addEventListener(ButtonEvent.PRESS,this.onRightOption,false,0,true);
        }
        
        override public function setTabIndex() : void
        {
            this.leftButton.tabIndex = 1;
            this.middleButton.tabIndex = 2;
            this.rightButton.tabIndex = 3;
            this.leftButton.preventAutosizing = true;
            this.middleButton.preventAutosizing = true;
            this.rightButton.preventAutosizing = true;
        }
        
        override public function openPopup() : void
        {
            super.openPopup();
            if(bManagerUsingGamepad)
            {
                FocusManager.setFocus(this.leftButton);
            }
            else
            {
                FocusManager.setFocus(null);
            }
        }
        
        private function onLeftOption(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_ClickedLeftOption");
        }
        
        private function onMiddleOption(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_ClickedMiddleOption");
        }
        
        private function onRightOption(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_ClickedRightOption");
        }
        
        override public function setPopupText(param1:String, param2:String, param3:String, param4:String, param5:String) : *
        {
            this.TitleTF.text = param1;
            this.DescriptionTF.text = param2;
            this.leftButton.label = param3;
            this.middleButton.label = param5;
            this.rightButton.label = param4;
            this.leftButton.visible = !(param3 == null || param3 == "");
            this.middleButton.visible = !(param5 == null || param5 == "");
            this.rightButton.visible = !(param4 == null || param4 == "");
        }
    }
}
