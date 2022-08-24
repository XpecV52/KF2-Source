package tripwire.controls.postGameMenu
{
    import flash.text.TextField;
    import scaleform.clik.controls.ListItemRenderer;
    import scaleform.clik.controls.UILoader;
    
    public class MapVoteLineRenderer extends ListItemRenderer
    {
         
        
        public var secondaryTextfield:TextField;
        
        public var mapImage:UILoader;
        
        public function MapVoteLineRenderer()
        {
            super();
            preventAutosizing = true;
        }
        
        override public function set data(param1:Object) : void
        {
            if(param1 == null)
            {
                visible = false;
                return;
            }
            super.data = param1;
            visible = true;
            this.secondaryTextfield.text = !!param1.secondaryText ? param1.secondaryText : "";
            this.mapImage.source = !!param1.mapSource ? param1.mapSource : "";
        }
    }
}
