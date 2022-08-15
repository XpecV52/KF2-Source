package tripwire.controls.trader
{
    import scaleform.clik.controls.Button;
    import scaleform.clik.controls.ButtonBar;
    
    public class TraderFilterButtonBar extends ButtonBar
    {
         
        
        public function TraderFilterButtonBar()
        {
            super();
        }
        
        override protected function populateRendererData(param1:Button, param2:uint) : void
        {
            var _loc3_:TraderFilterButton = null;
            _loc3_ = param1 as TraderFilterButton;
            _loc3_.source = _dataProvider.requestItemAt(param2).source;
            super.populateRendererData(param1,param2);
        }
    }
}
