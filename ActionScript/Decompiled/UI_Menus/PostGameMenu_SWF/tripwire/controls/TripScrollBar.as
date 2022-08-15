package tripwire.controls
{
    import flash.events.MouseEvent;
    import scaleform.clik.controls.ScrollBar;
    
    public class TripScrollBar extends ScrollBar
    {
         
        
        public var scrollRate:Number = 1;
        
        private var scrollMove:int;
        
        public function TripScrollBar()
        {
            super();
        }
        
        override protected function updateScrollTarget() : void
        {
            if(_scrollTarget == null || !enabled)
            {
                return;
            }
            _scrollTarget.y = -_position;
        }
        
        override protected function doDrag(param1:MouseEvent) : void
        {
            var _loc2_:Number = (mouseY - _dragOffset.y - track.y) / availableHeight;
            this.scrollMove = _minPosition + _loc2_ * (_maxPosition - _minPosition);
            position = Math.round(this.scrollMove / this.scrollRate) * this.scrollRate;
        }
    }
}
