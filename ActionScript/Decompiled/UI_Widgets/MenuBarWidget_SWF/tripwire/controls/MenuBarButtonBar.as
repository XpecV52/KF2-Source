package tripwire.controls
{
    import scaleform.clik.controls.Button;
    import scaleform.clik.controls.ButtonBar;
    
    public class MenuBarButtonBar extends ButtonBar
    {
         
        
        public function MenuBarButtonBar()
        {
            super();
        }
        
        override protected function populateRendererData(param1:Button, param2:uint) : void
        {
            var _loc3_:MenuBarButton = null;
            super.populateRendererData(param1,param2);
            _loc3_ = param1 as MenuBarButton;
            _loc3_.index = _dataProvider.requestItemAt(param2).index;
            _loc3_.label = _dataProvider.requestItemAt(param2).label;
            _loc3_.bPulsing = _dataProvider.requestItemAt(param2).bPulsing;
            _loc3_.enabled = _dataProvider.requestItemAt(param2).enabled;
        }
    }
}
