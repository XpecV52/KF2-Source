package
{
    import tripwire.controls.TripScrollArea;
    
    public dynamic class PlayerStatsList extends TripScrollArea
    {
         
        
        public function PlayerStatsList()
        {
            super();
            this.__setProp_scrollBar_PlayerStatsList_scrollbar_0();
        }
        
        function __setProp_scrollBar_PlayerStatsList_scrollbar_0() : *
        {
            try
            {
                scrollBar["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            scrollBar.enabled = true;
            scrollBar.enableInitCallback = false;
            scrollBar.minThumbSize = 32;
            scrollBar.offsetBottom = 0;
            scrollBar.offsetTop = 0;
            scrollBar.scrollTarget = "";
            scrollBar.trackMode = "scrollPage";
            scrollBar.visible = true;
            try
            {
                scrollBar["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
