package tripwire.controls
{
    import flash.text.TextField;
    import scaleform.clik.controls.UILoader;
    
    public class GearLineRenderer extends TripListItemRenderer
    {
         
        
        public var title:String;
        
        public var titleTextField:TextField;
        
        public var imageLoader:UILoader;
        
        public function GearLineRenderer()
        {
            super();
            defaultColor = 14538703;
            clickSoundEffect = "GEAR_ITEM_CLICK";
            overSoundEffect = "GEAR_ITEM_ROLLOVER";
        }
        
        override public function setData(param1:Object) : void
        {
            this.data = param1;
            if(param1)
            {
                visible = true;
                textField.text = !!param1.label ? param1.label : "";
                enabled = param1.enabled;
                if(param1.source && param1.source != "")
                {
                    this.imageLoader.source = param1.source;
                }
            }
            else
            {
                visible = false;
            }
        }
    }
}
