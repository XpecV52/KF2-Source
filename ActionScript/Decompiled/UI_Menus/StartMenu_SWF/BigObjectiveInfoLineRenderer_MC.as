package
{
    import tripwire.controls.objectiveStart.ObjectiveInfoRenderer;
    
    public dynamic class BigObjectiveInfoLineRenderer_MC extends ObjectiveInfoRenderer
    {
         
        
        public function BigObjectiveInfoLineRenderer_MC()
        {
            super();
            addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3);
        }
        
        function frame1() : *
        {
            stop();
        }
        
        function frame2() : *
        {
            stop();
        }
        
        function frame3() : *
        {
            stop();
        }
    }
}
