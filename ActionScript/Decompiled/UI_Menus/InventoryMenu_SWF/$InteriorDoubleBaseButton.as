package
{
    import flash.text.TextField;
    import tripwire.controls.TripButton;
    
    public dynamic class $InteriorDoubleBaseButton extends TripButton
    {
         
        
        public var buttonText:TextField;
        
        public function $InteriorDoubleBaseButton()
        {
            super();
            addFrameScript(0,this.frame1,9,this.frame10,19,this.frame20,29,this.frame30,30,this.frame31,39,this.frame40);
        }
        
        function frame1() : *
        {
            this.buttonText = new TextField();
            this.buttonText = textField;
            this.buttonText.textColor = 16503487;
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
            this.buttonText.textColor = 8743272;
        }
        
        function frame40() : *
        {
            stop();
        }
    }
}
