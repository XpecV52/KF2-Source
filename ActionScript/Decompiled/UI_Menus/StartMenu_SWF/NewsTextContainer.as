package
{
    import tripwire.controls.TripTextArea;
    
    public dynamic class NewsTextContainer extends TripTextArea
    {
         
        
        public function NewsTextContainer()
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
