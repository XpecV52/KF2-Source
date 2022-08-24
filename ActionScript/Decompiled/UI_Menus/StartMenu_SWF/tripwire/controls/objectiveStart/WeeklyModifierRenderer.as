package tripwire.controls.objectiveStart
{
    import flash.text.TextField;
    import scaleform.clik.controls.ListItemRenderer;
    import tripwire.controls.TripUILoader;
    
    public class WeeklyModifierRenderer extends ListItemRenderer
    {
         
        
        public var iconImageLoader:TripUILoader;
        
        public var descriptionTextField:TextField;
        
        public function WeeklyModifierRenderer()
        {
            super();
            preventAutosizing = true;
        }
        
        override public function get data() : Object
        {
            return super.data;
        }
        
        override public function set data(param1:Object) : void
        {
            super.data = param1;
            if(this.data)
            {
                visible = true;
                label = !!this.data.label ? this.data.label : "";
                this.iconImageLoader.source = !!this.data.iconPath ? this.data.iconPath : "";
                this.descriptionTextField.text = !!this.data.description ? this.data.description : "";
            }
            else
            {
                visible = false;
            }
        }
    }
}
