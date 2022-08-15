package tripwire.controls
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    
    public class OverviewButton extends TripButton
    {
         
        
        public var sectionTextField:TextField;
        
        public var labelTextField:TextField;
        
        public var changeTextField:TextField;
        
        public var lock:MovieClip;
        
        public function OverviewButton()
        {
            super();
            preventAutosizing = true;
        }
        
        public function set sectionName(param1:String) : *
        {
            this.sectionTextField.text = param1;
        }
        
        public function set changeName(param1:String) : *
        {
            if(this.changeTextField != null)
            {
                this.changeTextField.text = param1;
            }
        }
        
        override protected function updateText() : void
        {
            if(_label != null && this.labelTextField != null)
            {
                this.labelTextField.text = _label;
            }
        }
    }
}
