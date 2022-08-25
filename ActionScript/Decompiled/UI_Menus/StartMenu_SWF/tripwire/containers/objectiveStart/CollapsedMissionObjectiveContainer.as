package tripwire.containers.objectiveStart
{
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.utils.Timer;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripButton;
    import tripwire.controls.objectiveStart.ObjectiveInfoRenderer;
    
    public class CollapsedMissionObjectiveContainer extends TripContainer
    {
         
        
        public var expandButton:TripButton;
        
        public var objectiveRenderer:ObjectiveInfoRenderer;
        
        public var dataArray:Array;
        
        public const timerTime:int = 5000;
        
        public var myTimer:Timer;
        
        public var currentObjectiveIndex:int = 0;
        
        public function CollapsedMissionObjectiveContainer()
        {
            super();
            enableInitCallback = true;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.expandButton.focusable = false;
        }
        
        public function set objectives(param1:Array) : void
        {
            this.dataArray = param1;
            this.objectiveRenderer.bIsContracted = true;
            this.objectiveRenderer.data = this.dataArray[this.currentObjectiveIndex];
            if(this.dataArray.length > 1)
            {
                if(this.myTimer == null)
                {
                    this.myTimer = new Timer(this.timerTime,0);
                    this.myTimer.addEventListener(TimerEvent.TIMER,this.updateObjective,false,0,true);
                    this.myTimer.start();
                }
            }
        }
        
        public function updateObjective(param1:TimerEvent) : void
        {
            ++this.currentObjectiveIndex;
            this.objectiveRenderer.data = this.dataArray[this.currentObjectiveIndex % this.dataArray.length];
        }
    }
}
