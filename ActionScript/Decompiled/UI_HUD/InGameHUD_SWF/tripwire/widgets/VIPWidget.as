package tripwire.widgets
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import scaleform.clik.core.UIComponent;
    
    public class VIPWidget extends UIComponent
    {
         
        
        public var VIPLabel:TextField;
        
        public var VIPObjectiveLabel:TextField;
        
        public var VIPPlayerLabel:TextField;
        
        public var VIPHealthBar:MovieClip;
        
        public var VIPLowHealthBar:MovieClip;
        
        private var InitialHealthBarWidth:int;
        
        public function VIPWidget()
        {
            super();
            enableInitCallback = true;
            this.InitialHealthBarWidth = this.VIPHealthBar.HealthBar.width;
        }
        
        public function set VIPSetVisibility(param1:Boolean) : void
        {
            this.visible = param1;
        }
        
        public function set VIPPlayerNameSetVisibility(param1:Boolean) : void
        {
            this.VIPPlayerLabel.visible = param1;
        }
        
        public function set VIPSetLocalised(param1:String) : *
        {
            this.VIPLabel.text = param1;
        }
        
        public function set VIPObjectiveSetLocalised(param1:String) : *
        {
            this.VIPObjectiveLabel.text = param1;
        }
        
        public function set VIPPlayerSet(param1:String) : *
        {
            this.VIPPlayerLabel.text = param1;
        }
        
        public function set VIPHideHealthBar(param1:Boolean) : *
        {
            this.VIPHealthBar.visible = false;
            this.VIPLowHealthBar.visible = false;
        }
        
        public function set VIPHealthBarPercentage(param1:Number) : *
        {
            if(param1 > 1)
            {
                this.VIPHealthBar.HealthBar.width = this.InitialHealthBarWidth;
                this.VIPLowHealthBar.HealthBar.width = this.InitialHealthBarWidth;
            }
            else if(param1 <= 0)
            {
                this.VIPHealthBar.HealthBar.width = 0;
                this.VIPLowHealthBar.HealthBar.width = 0;
            }
            else
            {
                this.VIPHealthBar.HealthBar.width = this.InitialHealthBarWidth * param1;
                this.VIPLowHealthBar.HealthBar.width = this.InitialHealthBarWidth * param1;
            }
            if(param1 < 0.25)
            {
                this.VIPHealthBar.visible = false;
                this.VIPLowHealthBar.visible = true;
            }
            else
            {
                this.VIPHealthBar.visible = true;
                this.VIPLowHealthBar.visible = false;
            }
        }
    }
}
