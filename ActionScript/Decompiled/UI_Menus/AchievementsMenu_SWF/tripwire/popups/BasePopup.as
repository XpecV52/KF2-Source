package tripwire.popups
{
    import flash.external.ExternalInterface;
    import scaleform.clik.events.ButtonEvent;
    import tripwire.containers.TripContainer;
    
    public class BasePopup extends TripContainer
    {
         
        
        public function BasePopup()
        {
            super();
            enableInitCallback = true;
            this.setTabIndex();
        }
        
        public function setTabIndex() : *
        {
        }
        
        public function setPopupText(param1:String, param2:String, param3:String, param4:String, param5:String) : *
        {
        }
        
        public function onClosePopup(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_ClosedPopup");
        }
    }
}
