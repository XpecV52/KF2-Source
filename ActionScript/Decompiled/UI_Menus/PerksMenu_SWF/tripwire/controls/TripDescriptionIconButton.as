package tripwire.controls
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.controls.UILoader;
    
    public class TripDescriptionIconButton extends TripButton
    {
         
        
        public var descriptionTextfield:TextField;
        
        public var iconLoader:UILoader;
        
        public var activeIndicator:MovieClip;
        
        public var tier:int = 0;
        
        public function TripDescriptionIconButton()
        {
            super();
        }
        
        public function setData(param1:Object) : void
        {
            this.icon = !!param1.iconSource ? param1.iconSource : "";
            this.TitleText = !!param1.label ? param1.label : "";
            this.DescriptionText = !!param1.description ? param1.description : "";
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.active = false;
        }
        
        public function set icon(param1:String) : void
        {
            if(param1 != null && param1 != "")
            {
                this.iconLoader.source = param1;
            }
        }
        
        public function set TitleText(param1:String) : void
        {
            label = param1;
        }
        
        public function set DescriptionText(param1:String) : void
        {
            this.descriptionTextfield.text = param1;
        }
        
        public function set active(param1:*) : void
        {
            this.activeIndicator.visible = param1;
        }
    }
}
