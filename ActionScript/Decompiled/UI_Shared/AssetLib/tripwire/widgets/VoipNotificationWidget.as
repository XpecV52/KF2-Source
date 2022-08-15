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
            this.__setProp_voipList_VOIPWidget_scrollingList_0();
        }
        
        public function set voipActiveList(param1:Array) : *
        {
            this.voipList.dataProvider = new DataProvider(param1);
        }
        
        function __setProp_voipList_VOIPWidget_scrollingList_0() : *
        {
            try
            {
                this.voipList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.voipList.enabled = true;
            this.voipList.enableInitCallback = true;
            this.voipList.focusable = false;
            this.voipList.itemRendererName = "";
            this.voipList.itemRendererInstanceName = "voip";
            this.voipList.margin = 0;
            this.voipList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            this.voipList.rowHeight = 0;
            this.voipList.scrollBar = "";
            this.voipList.visible = true;
            this.voipList.wrapping = "normal";
            try
            {
                this.voipList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
