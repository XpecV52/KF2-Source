package
{
    import flash.display.MovieClip;
    import flash.events.Event;
    
    public dynamic class MenuBack extends MovieClip
    {
         
        
        public var BlackBarsMC:BlackBars;
        
        public function MenuBack()
        {
            super();
            addFrameScript(0,this.frame1,14,this.frame15,28,this.frame29);
        }
        
        function frame1() : *
        {
            stop();
        }
        
        function frame15() : *
        {
            stop();
        }
        
        function frame29() : *
        {
            dispatchEvent(new Event("menuClosed"));
            stop();
        }
    }
}
