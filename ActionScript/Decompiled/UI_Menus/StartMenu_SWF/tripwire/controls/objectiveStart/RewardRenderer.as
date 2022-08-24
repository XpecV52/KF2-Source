package tripwire.controls.objectiveStart
{
    import scaleform.clik.controls.ListItemRenderer;
    import scaleform.gfx.TextFieldEx;
    import tripwire.controls.TripUILoader;
    
    public class RewardRenderer extends ListItemRenderer
    {
         
        
        public var iconImageLoader:TripUILoader;
        
        public function RewardRenderer()
        {
            super();
            preventAutosizing = true;
            TextFieldEx.setVerticalAlign(textField,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setTextAutoSize(textField,"shrink");
        }
        
        override public function set data(param1:Object) : void
        {
            super.data = param1;
            if(data)
            {
                visible = true;
                label = !!data.label ? data.label : "";
                this.iconImageLoader.source = !!data.iconPath ? data.iconPath : "";
            }
            else
            {
                visible = false;
            }
            TextFieldEx.setVerticalAlign(textField,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setTextAutoSize(textField,"shrink");
        }
    }
}
