package tripwire.controls
{
    import flash.text.TextField;
    import scaleform.clik.controls.TextArea;
    
    public class TripTextArea extends TextArea
    {
         
        
        public var titleTextField:TextField;
        
        protected var _titleText:String;
        
        public function TripTextArea()
        {
            super();
        }
        
        public function get titleText() : String
        {
            return this._titleText;
        }
        
        public function set titleText(param1:String) : void
        {
            this._titleText = param1;
            this.titleTextField.text = this._titleText;
        }
    }
}