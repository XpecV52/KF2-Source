package
{
    import tripwire.containers.Perks.PrestigeContainer;
    
    public dynamic class PrestigeContainer_MC extends PrestigeContainer
    {
         
        
        public function PrestigeContainer_MC()
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
