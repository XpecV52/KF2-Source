package
{
    import tripwire.containers.objectiveStart.SpecialEventMissionContainer;
    
    public dynamic class EventMissionContainer extends SpecialEventMissionContainer
    {
         
        
        public function EventMissionContainer()
        {
            super();
            addFrameScript(0,this.frame1,1,this.frame2);
        }
        
        function frame1() : *
        {
            stop();
        }
        
        function frame2() : *
        {
            stop();
        }
    }
}
