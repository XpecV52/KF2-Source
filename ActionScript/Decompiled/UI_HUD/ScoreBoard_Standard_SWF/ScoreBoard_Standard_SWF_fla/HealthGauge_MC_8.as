package ScoreBoard_Standard_SWF_fla
{
    import flash.display.MovieClip;
    
    public dynamic class HealthGauge_MC_8 extends MovieClip
    {
         
        
        public var HealthBG:MovieClip;
        
        public function HealthGauge_MC_8()
        {
            super();
            addFrameScript(0,this.frame1);
        }
        
        function frame1() : *
        {
            stop();
        }
    }
}