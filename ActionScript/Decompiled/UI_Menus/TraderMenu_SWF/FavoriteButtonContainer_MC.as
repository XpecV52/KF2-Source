package
{
    import tripwire.controls.TripButton;
    
    public dynamic class FavoriteButtonContainer_MC extends TripButton
    {
         
        
        public function FavoriteButtonContainer_MC()
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
