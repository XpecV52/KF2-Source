package tripwire.containers
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.core.UIComponent;
    import tripwire.controls.TripUILoader;
    
    public class ValueBarkContainer extends UIComponent
    {
         
        
        public var textField:TextField;
        
        public var prefix:TextField;
        
        public var infoMC:MovieClip;
        
        public var iconLoader:TripUILoader;
        
        public var currentValue:int = 0;
        
        public function ValueBarkContainer()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.textField = this.infoMC.textField;
            this.prefix = this.infoMC.prefix;
            addEventListener("onBarkComplete",this.onBarkComplete,false,0,true);
            this.iconLoader = this.infoMC.iconLoader;
        }
        
        public function playBark(param1:int, param2:String, param3:String = "") : void
        {
            if(param3 != "" && this.iconLoader != null)
            {
                if(this.iconLoader.source != param3)
                {
                    this.iconLoader.source = param3;
                    this.currentValue = 0;
                }
            }
            this.currentValue += param1;
            this.textField.text = this.currentValue + param2;
            gotoAndPlay("Woof");
        }
        
        public function onBarkComplete(param1:Event) : void
        {
            this.currentValue = 0;
        }
    }
}
