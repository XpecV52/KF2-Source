package InGameHUD_ZED_SWF_fla
{
    import flash.display.MovieClip;
    import flash.events.Event;
    
    public dynamic class DoshBarkAnimContainerMC_130 extends MovieClip
    {
         
        
        public var DoshBarkInfo:MovieClip;
        
        public function DoshBarkAnimContainerMC_130()
        {
            super();
            addFrameScript(0,this.frame1,33,this.frame34);
        }
        
        function frame1() : *
        {
            stop();
        }
        
        function frame34() : *
        {
            dispatchEvent(new Event("OnDoshBarkComplete"));
            stop();
        }
    }
}
