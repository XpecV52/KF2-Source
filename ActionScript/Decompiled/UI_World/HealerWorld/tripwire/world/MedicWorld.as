package tripwire.world
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import scaleform.clik.core.UIComponent;
    
    public class MedicWorld extends UIComponent
    {
         
        
        public var circleMeterMC:MovieClip;
        
        public var txtCharge:TextField;
        
        public function MedicWorld()
        {
            super();
            _enableInitCallback = true;
        }
        
        public function set Charge(param1:int) : *
        {
            trace("GFX SETTING CHARGE TO: ",param1);
            this.circleMeterMC.gotoAndStop(param1 + 1);
            this.txtCharge.text = String(param1) + "%";
        }
    }
}
