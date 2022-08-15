package tripwire.containers
{
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.gfx.TextFieldEx;
    
    public class StartOverviewBrowserContainer extends TripContainer
    {
         
        
        public var overviewHeader:SectionHeaderContainer;
        
        public var descriptionTextField:TextField;
        
        public function StartOverviewBrowserContainer()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            TextFieldEx.setVerticalAlign(this.descriptionTextField,TextFieldEx.VALIGN_CENTER);
        }
        
        public function set descriptionString(param1:String) : void
        {
            this.descriptionTextField.text = param1;
        }
        
        public function set overviewString(param1:String) : void
        {
            this.overviewHeader.text = param1;
        }
    }
}
