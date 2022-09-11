package tripwire.widgets
{
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.core.UIComponent;
    
    public class CounterMapTextWidget extends UIComponent
    {
         
        
        public var counterMapText:TextField;
        
        public function CounterMapTextWidget()
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
