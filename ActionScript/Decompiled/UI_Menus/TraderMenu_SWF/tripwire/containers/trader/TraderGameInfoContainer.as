package tripwire.containers.trader
{
    import flash.text.TextField;
    import tripwire.Tools.TextfieldUtil;
    import tripwire.containers.TripContainer;
    
    public class TraderGameInfoContainer extends TripContainer
    {
         
        
        public var waveTextField:TextField;
        
        public var timeLeftLabel:TextField;
        
        public var timeLeftValue:TextField;
        
        public var doshTextField:TextField;
        
        public var weightTextField:TextField;
        
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
            this.doshTextField.text = String(param1);
        }
        
        public function set currentWeight(param1:String) : void
        {
            this.weightTextField.text = param1;
        }
    }
}
