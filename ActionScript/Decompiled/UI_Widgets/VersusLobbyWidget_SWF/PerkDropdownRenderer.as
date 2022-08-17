package
{
    import tripwire.controls.perks.PerkDropdownRenderer;
    
    public dynamic class PerkDropdownRenderer extends tripwire.controls.perks.PerkDropdownRenderer
    {
         
        
        public function PerkDropdownRenderer()
        {
            super();
            addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3,3,this.frame4);
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
        
        function frame4() : *
        {
            stop();
        }
    }
}
