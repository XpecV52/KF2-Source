package tripwire.popups
{
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
            this.AcceptButton.addEventListener(ButtonEvent.PRESS,onClosePopup);
            this.AcceptButton.preventAutosizing = true;
            defaultFirstElement = currentElement = this.AcceptButton;
        }
        
        override public function setTabIndex() : *
        {
            super.setTabIndex();
            this.AcceptButton.tabIndex = 1;
        }
        
        override public function set descriptionText(param1:String) : *
        {
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
