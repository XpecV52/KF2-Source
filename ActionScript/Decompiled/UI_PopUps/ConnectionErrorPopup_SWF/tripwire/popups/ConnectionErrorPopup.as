package tripwire.popups
{
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.gfx.FocusManager;
    import tripwire.controls.TripButton;
    
    public class ConnectionErrorPopup extends BasePopup
    {
         
        
        public var AcceptButton:TripButton;
        
        public var TitleTF:TextField;
        
        public var DescriptionTF:TextField;
        
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
        
        override public function openPopup() : void
        {
            super.openPopup();
            if(bManagerUsingGamepad)
            {
                FocusManager.setFocus(this.AcceptButton);
            }
            else
            {
                FocusManager.setFocus(null);
            }
        }
        
        override public function setPopupText(param1:String, param2:String, param3:String, param4:String, param5:String) : *
        {
            this.TitleTF.text = param1;
            this.DescriptionTF.text = param2;
            this.AcceptButton.label = param3;
        }
    }
}
