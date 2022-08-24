package tripwire.containers.hud
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripUILoader;
    
    public class ObjectiveProgressContainer extends TripContainer
    {
         
        
        public var progressBarMC:MovieClip;
        
        public var outerLines:MovieClip;
        
        public var iconLoaderMC:TripUILoader;
        
        public function ObjectiveProgressContainer()
        {
            super();
            enableInitCallback = true;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.isActive = false;
        }
        
        public function set isActive(param1:Boolean) : void
        {
            this.alpha = !!param1 ? Number(0.88) : Number(0.48);
            this.outerLines.visible = param1;
        }
        
        public function set currentIcon(param1:String) : void
        {
            if(param1 == "")
            {
                this.iconLoaderMC.visible = false;
            }
            else
            {
                this.iconLoaderMC.source = param1;
            }
        }
        
        public function set currentProgress(param1:Number) : void
        {
            this.progressBarMC.gotoAndStop(param1 + 1);
        }
    }
}
