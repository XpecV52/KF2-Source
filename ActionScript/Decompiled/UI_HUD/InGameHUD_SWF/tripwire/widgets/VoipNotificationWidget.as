package tripwire.widgets
{
    import scaleform.clik.controls.ScrollingList;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.data.DataProvider;
    import tripwire.controls.VoipItemRenderer;
    
    public class VoipNotificationWidget extends UIComponent
    {
         
        
        public var voipList:ScrollingList;
        
        public var voip1:VoipItemRenderer;
        
        public var voip2:VoipItemRenderer;
        
        public var voip3:VoipItemRenderer;
        
        public var voip4:VoipItemRenderer;
        
        public var voip5:VoipItemRenderer;
        
        public var voip6:VoipItemRenderer;
        
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
