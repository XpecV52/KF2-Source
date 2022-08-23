package tripwire.containers.trader
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.text.TextField;
    import scaleform.clik.controls.Button;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripScrollingList;
    
    public class TraderPerkListContainer extends TripContainer
    {
         
        
        public var perkList:TripScrollingList;
        
        public var CancelButton:Button;
        
        public var selectPerkTextField:TextField;
        
        public var PlayerInventoryContainerRef:TraderPlayerInventoryContainer;
        
        public var oncePerWaveTextField:TextField;
        
        public function TraderPerkListContainer()
        {
            super();
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            this.PlayerInventoryContainerRef.selectContainer();
        }
        
        override public function get bOpen() : Boolean
        {
            return super.bOpen || visible && alpha == 1;
        }
        
        override protected function openAnimation(param1:Boolean = true) : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,4,{
                "autoAlpha":0,
                "useFrames":true
            },{
                "delay":2,
                "autoAlpha":(!!param1 ? _defaultAlpha : _dimmedAlpha),
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":onOpened
            });
            this.perkList.focusable = true;
        }
        
        override protected function closeAnimation() : *
        {
            this.perkList.focusable = false;
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,4,{
                "alpha":alpha,
                "useFrames":true
            },{
                "alpha":0,
                "visible":false,
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":onClosed
            });
        }
    }
}
