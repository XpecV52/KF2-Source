package tripwire.controls.objectiveStart
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.core.UIComponent;
    
    public class ProgressBarWithText extends UIComponent
    {
         
        
        public var progressText:TextField;
        
        public var fillBar:MovieClip;
        
        public var bumper_0:MovieClip;
        
        public var bumper_1:MovieClip;
        
        public var fillBarOriginalWidth:Number;
        
        public function ProgressBarWithText()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.fillBarOriginalWidth = this.fillBar.width;
        }
        
        public function set progress(param1:Number) : void
        {
            this.fillBar.width = this.fillBarOriginalWidth * param1;
        }
    }
}
