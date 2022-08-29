package tripwire.containers.trader
{
    import flash.display.MovieClip;
    import flash.events.KeyboardEvent;
    import flash.text.TextField;
    import flash.ui.Keyboard;
    import tripwire.Tools.TextfieldUtil;
    import tripwire.containers.TripContainer;
    
    public class TraderGameInfoContainer extends TripContainer
    {
         
        
        public var waveTextField:TextField;
        
        public var timeLeftLabel:TextField;
        
        public var timeLeftValue:TextField;
        
        public var doshTextField:TextField;
        
        public var weightTextField:TextField;
        
        public var Dosh_WeightMC:MovieClip;
        
        public var DoshIcon:MovieClip;
        
        public var WeightIcon:MovieClip;
        
        public function TraderGameInfoContainer()
        {
            super();
        }
        
        public function set waveValue(param1:String) : void
        {
            this.waveTextField.text = param1;
        }
        
        public function set timeLabel(param1:String) : void
        {
            this.timeLeftLabel.text = param1;
        }
        
        public function set timeValue(param1:int) : void
        {
            this.timeLeftValue.text = TextfieldUtil.instance.getFormattedTimeFromSeconds(param1);
        }
        
        public function set dosh(param1:int) : void
        {
            this.Dosh_WeightMC.doshTextField.text = String(param1);
        }
        
        public function set currentWeight(param1:String) : void
        {
            this.Dosh_WeightMC.weightTextField.text = param1;
        }
        
        public function testDoshWeight(param1:KeyboardEvent) : void
        {
            if(param1.keyCode == Keyboard.A)
            {
                this.dosh = 400;
                this.currentWeight = "5/15";
            }
            if(param1.keyCode == Keyboard.S)
            {
                this.dosh = 4000;
                this.currentWeight = "15/15";
            }
        }
    }
}
