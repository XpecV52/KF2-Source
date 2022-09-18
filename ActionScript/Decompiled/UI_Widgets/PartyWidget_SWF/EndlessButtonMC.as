package
{
    import flash.text.TextField;
    import tripwire.controls.TripButton;
    
    public dynamic class EndlessButtonMC extends TripButton
    {
         
        
        public var readyText:TextField;
        
        public function EndlessButtonMC()
        {
            super();
            addFrameScript(0,this.frame1,9,this.frame10,19,this.frame20,29,this.frame30,30,this.frame31,39,this.frame40,40,this.frame41,49,this.frame50,59,this.frame60,69,this.frame70,70,this.frame71,79,this.frame80);
        }
        
        function frame1() : *
        {
            this.readyText = new TextField();
            this.readyText = textField;
            this.readyText.textColor = 16503487;
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
        
        function frame31() : *
        {
            this.readyText.textColor = 6710886;
        }
        
        function frame40() : *
        {
            stop();
        }
        
        function frame41() : *
        {
            this.readyText.textColor = 16503487;
        }
        
        function frame50() : *
        {
            stop();
        }
        
        function frame60() : *
        {
            stop();
        }
        
        function frame70() : *
        {
            stop();
        }
        
        function frame71() : *
        {
            this.readyText.textColor = 6710886;
        }
        
        function frame80() : *
        {
            stop();
        }
    }
}
