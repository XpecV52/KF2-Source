package tripwire.world
{
    import flash.text.TextField;
    import scaleform.clik.core.UIComponent;
    import tripwire.containers.c4Screen.C4Screen_BarCountContainer;
    
    public class C4World extends UIComponent
    {
         
        
        public var valueTextField:TextField;
        
        public var bars:C4Screen_BarCountContainer;
        
        public function C4World()
        {
            super();
            _enableInitCallback = true;
        }
        
        public function set maxCharges(param1:int) : void
        {
            this.bars.maxBars = param1;
        }
        
        public function set activeCharges(param1:int) : void
        {
            this.bars.activeCharges = param1;
        }
        
        public function set readOut(param1:String) : void
        {
            this.valueTextField.text = param1;
        }
    }
}
