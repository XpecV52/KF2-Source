package
{
    import tripwire.controls.TripButton;
    
    public dynamic class WeaponSelectorButton extends TripButton
    {
         
        
        public function WeaponSelectorButton()
        {
            super();
            addFrameScript(0,this.frame1,9,this.frame10,19,this.frame20,29,this.frame30,39,this.frame40);
        }
        
        function frame1() : *
        {
        }
        
        function frame10() : *
        {
            stop();
        }
        
        function frame20() : *
        {
            stop();
        }
        
        function frame30() : *
        {
            stop();
        }
        
        function frame40() : *
        {
            stop();
        }
    }
}