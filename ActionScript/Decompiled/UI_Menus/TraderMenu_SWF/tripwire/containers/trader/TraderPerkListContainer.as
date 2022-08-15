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
        
        public function TraderPerkListContainer()
        {
            super();
        }
        
        override protected function openAnimation() : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,6,{
                "autoAlpha":0,
                "useFrames":true
            },{
                "delay":6,
                "autoAlpha":1,
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
            TweenMax.fromTo(this,12,{
                "alpha":1,
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
