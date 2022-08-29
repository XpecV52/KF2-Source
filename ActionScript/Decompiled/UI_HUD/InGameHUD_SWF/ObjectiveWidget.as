package
{
    import tripwire.containers.hud.ObjectiveProgressContainer;
    
    public dynamic class ObjectiveWidget extends ObjectiveProgressContainer
    {
         
        
        public function ObjectiveWidget()
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
