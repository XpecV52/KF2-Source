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
        
        override protected function draw() : void
        {
            super.draw();
            this.centerUpButtonBar();
        }
        
        public function centerUpButtonBar() : *
        {
            var _loc1_:Number = NaN;
            var _loc2_:Number = NaN;
            var _loc6_:Button = null;
            _loc1_ = (buttonWidth > 0 ? buttonWidth : _renderers[0].width) + spacing;
            _loc2_ = _loc1_ * _renderers.length;
            var _loc3_:Number = this.width / 2;
            var _loc4_:Number = _loc3_ - _loc2_ / 2;
            var _loc5_:uint = 0;
            while(_loc5_ < _renderers.length)
            {
                _loc6_ = _renderers[_loc5_];
                if(_loc5_ == 0)
                {
                    _loc6_.x = _loc4_;
                }
                else
                {
                    _loc6_.x = _renderers[_loc5_ - 1].x + _loc1_;
                }
                _loc5_++;
            }
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
