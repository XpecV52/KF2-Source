package PartyWidget_SWF_fla
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.geom.Point;
    
    public dynamic class MainTimeline extends MovieClip
    {
         
        
        public var partyWidget:SquadContainerMC;
        
        public function MainTimeline()
        {
            super();
            addEventListener(Event.ADDED_TO_STAGE,this.__setPerspectiveProjection_);
            this.__setProp_partyWidget_Scene1_partyWidget_0();
        }
        
        public function __setPerspectiveProjection_(param1:Event) : void
        {
            root.transform.perspectiveProjection.fieldOfView = 30;
            root.transform.perspectiveProjection.projectionCenter = new Point(960,540);
        }
        
        function __setProp_partyWidget_Scene1_partyWidget_0() : *
        {
            try
            {
                this.partyWidget["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.partyWidget.enabled = true;
            this.partyWidget.enableInitCallback = true;
            this.partyWidget.visible = true;
            try
            {
                this.partyWidget["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
