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
    }
}
