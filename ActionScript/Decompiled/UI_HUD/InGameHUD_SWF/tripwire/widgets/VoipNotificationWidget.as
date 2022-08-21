package tripwire.widgets
{
    import scaleform.clik.controls.ScrollingList;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.data.DataProvider;
    import tripwire.controls.TripListItemRenderer;
    
    public class VoipNotificationWidget extends UIComponent
    {
         
        
        public var voipList:ScrollingList;
        
        public var voip1:TripListItemRenderer;
        
        public var voip2:TripListItemRenderer;
        
        public var voip3:TripListItemRenderer;
        
        public var voip4:TripListItemRenderer;
        
        public var voip5:TripListItemRenderer;
        
        public var voip6:TripListItemRenderer;
        
        public function VoipNotificationWidget()
        {
            super();
        }
        
        public function set voipActiveList(param1:Array) : *
        {
            this.voipList.dataProvider = new DataProvider(param1);
        }
    }
}
