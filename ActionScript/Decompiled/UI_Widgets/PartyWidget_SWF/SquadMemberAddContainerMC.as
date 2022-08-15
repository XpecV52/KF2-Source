package
{
    import tripwire.controls.TripButton;
    
    public dynamic class SquadMemberAddContainerMC extends TripButton
    {
         
        
        public function SquadMemberAddContainerMC()
        {
            super();
            addFrameScript(0,this.frame1,9,this.frame10,19,this.frame20,29,this.frame30,39,this.frame40);
        }
        
        function frame1() : *
        {
            this.z = 0;
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
