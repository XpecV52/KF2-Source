package tripwire.widgets
{
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.core.UIComponent;
    
    public class MapTextWidget extends UIComponent
    {
         
        
        public var mapText:TextField;
        
        public function MapTextWidget()
        {
            super();
            enableInitCallback = true;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
    }
}
