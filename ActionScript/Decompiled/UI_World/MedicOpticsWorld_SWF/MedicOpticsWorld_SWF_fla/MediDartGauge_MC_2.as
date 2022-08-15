package MedicOpticsWorld_SWF_fla
{
    import flash.display.MovieClip;
    
    public dynamic class MediDartGauge_MC_2 extends MovieClip
    {
         
        
        public var leftBarBG:MovieClip;
        
        public var leftChargeBar:MovieClip;
        
        public var minimumLeftMeterMC:MovieClip;
        
        public var minimumRightMeterMC:MovieClip;
        
        public var rightBarBG:MovieClip;
        
        public var rightChargeBar:MovieClip;
        
        public function MediDartGauge_MC_2()
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
