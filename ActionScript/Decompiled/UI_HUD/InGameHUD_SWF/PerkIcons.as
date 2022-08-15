package
{
    import tripwire.controls.TripUILoader;
    
    public dynamic class PerkIcons extends TripUILoader
    {
         
        
        public function PerkIcons()
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
