package StartMenu_SWF_fla
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.geom.Point;
    
    public dynamic class MainTimeline extends MovieClip
    {
         
        
        public var startMenu:StartMenuMC;
        
        public function MainTimeline()
        {
            super();
            addEventListener(Event.ADDED_TO_STAGE,this.__setPerspectiveProjection_);
        }
        
        public function __setPerspectiveProjection_(param1:Event) : void
        {
            root.transform.perspectiveProjection.fieldOfView = 30;
            root.transform.perspectiveProjection.projectionCenter = new Point(960,540);
        }
    }
}
