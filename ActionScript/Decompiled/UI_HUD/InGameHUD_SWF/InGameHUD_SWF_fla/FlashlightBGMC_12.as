package InGameHUD_SWF_fla
{
    import flash.display.MovieClip;
    
    public dynamic class FlashlightBGMC_12 extends MovieClip
    {
         
        
        public function FlashlightBGMC_12()
        {
            super();
            addFrameScript(0,this.frame1,118,this.frame119);
        }
        
        function frame1() : *
        {
            stop();
        }
        
        function frame119() : *
        {
            gotoAndPlay("Pulsing");
        }
    }
}