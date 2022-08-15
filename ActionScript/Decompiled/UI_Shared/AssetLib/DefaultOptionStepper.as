package
{
    import scaleform.clik.controls.OptionStepper;
    
    public dynamic class DefaultOptionStepper extends OptionStepper
    {
         
        
        public function DefaultOptionStepper()
        {
            super();
            addFrameScript(9,this.frame10,19,this.frame20,29,this.frame30);
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
    }
}
