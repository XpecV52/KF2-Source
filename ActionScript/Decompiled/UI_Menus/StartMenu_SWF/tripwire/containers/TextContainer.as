package tripwire.containers
{
    import flash.events.Event;
    import scaleform.clik.controls.Label;
    import scaleform.gfx.TextFieldEx;
    
    public class TextContainer extends Label
    {
         
        
        public function TextContainer()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            TextFieldEx.setVerticalAlign(textField,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setTextAutoSize(textField,"shrink");
        }
        
        override public function set text(param1:String) : void
        {
            if(param1 == null)
            {
                param1 == "";
            }
            isHtml = false;
            _text = param1.slice(0,260);
            invalidateData();
        }
    }
}
