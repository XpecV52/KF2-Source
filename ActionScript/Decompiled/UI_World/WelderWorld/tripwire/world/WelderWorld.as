package tripwire.world
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import scaleform.clik.core.UIComponent;
    
    public class WelderWorld extends UIComponent
    {
         
        
        public var battery:MovieClip;
        
        public var txtCharge:TextField;
        
        public var txtIntegrity:TextField;
        
        public var txtIntegrityTitle:TextField;
        
        public function WelderWorld()
        {
            super();
            _enableInitCallback = true;
            this.SetCharge(100);
            this.SetIntegrity(0);
        }
        
        public function SetCharge(param1:int) : void
        {
            this.txtCharge.text = String(param1) + "%";
            if(param1 >= 95)
            {
                this.battery.gotoAndStop("Full");
            }
            else if(param1 >= 90)
            {
                this.battery.gotoAndStop("NinetyFive");
            }
            else if(param1 >= 85)
            {
                this.battery.gotoAndStop("Ninety");
            }
            else if(param1 >= 80)
            {
                this.battery.gotoAndStop("EightyFive");
            }
            else if(param1 >= 75)
            {
                this.battery.gotoAndStop("Eighty");
            }
            else if(param1 >= 70)
            {
                this.battery.gotoAndStop("SeventyFive");
            }
            else if(param1 >= 65)
            {
                this.battery.gotoAndStop("Seventy");
            }
            else if(param1 >= 60)
            {
                this.battery.gotoAndStop("SixtyFive");
            }
            else if(param1 >= 55)
            {
                this.battery.gotoAndStop("Sixty");
            }
            else if(param1 >= 50)
            {
                this.battery.gotoAndStop("FiftyFive");
            }
            else if(param1 >= 45)
            {
                this.battery.gotoAndStop("Fifty");
            }
            else if(param1 >= 40)
            {
                this.battery.gotoAndStop("FortyFive");
            }
            else if(param1 >= 35)
            {
                this.battery.gotoAndStop("Forty");
            }
            else if(param1 >= 30)
            {
                this.battery.gotoAndStop("ThirtyFive");
            }
            else if(param1 >= 25)
            {
                this.battery.gotoAndStop("Thirty");
            }
            else if(param1 >= 20)
            {
                this.battery.gotoAndStop("TwentyFive");
            }
            else if(param1 >= 15)
            {
                this.battery.gotoAndStop("Twenty");
            }
            else if(param1 >= 10)
            {
                this.battery.gotoAndStop("Fifteen");
            }
            else if(param1 >= 6)
            {
                this.battery.gotoAndStop("Ten");
            }
            else
            {
                this.battery.gotoAndStop("Empty");
                this.txtCharge.text = "";
            }
        }
        
        public function SetIntegrity(param1:int) : void
        {
            if(param1 != 255)
            {
                this.txtIntegrity.text = String(param1) + "%";
            }
            else
            {
                this.txtIntegrity.text = "-";
            }
        }
    }
}
