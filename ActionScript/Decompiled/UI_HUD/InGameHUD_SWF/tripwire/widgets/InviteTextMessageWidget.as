package tripwire.widgets
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Linear;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import tripwire.containers.TripContainer;
    
    public class InviteTextMessageWidget extends TripContainer
    {
         
        
        public const messageBuffer:int = 32;
        
        public var msgText:TextField;
        
        public var scanlinesMC:MovieClip;
        
        public var bgMC:MovieClip;
        
        public function InviteTextMessageWidget()
        {
            super();
            enableInitCallback = true;
            visible = false;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        public function set message(param1:String) : void
        {
            var _loc2_:Number = NaN;
            if(param1 == "")
            {
                closeContainer();
                return;
            }
            openContainer();
            this.msgText.text = param1;
            _loc2_ = this.msgText.textWidth + this.messageBuffer;
            this.bgMC.width = _loc2_;
            if(this.scanlinesMC)
            {
                this.scanlinesMC.width = _loc2_;
            }
            this.bgMC.x = this.msgText.width - this.bgMC.width + this.messageBuffer / 2;
            if(this.scanlinesMC)
            {
                this.scanlinesMC.x = this.msgText.width - this.scanlinesMC.width + this.messageBuffer / 2;
            }
        }
        
        override protected function openAnimation(param1:Boolean = true) : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,4,{
                "alpha":0,
                "ease":Linear.easeNone,
                "useFrames":true
            },{
                "alpha":_defaultAlpha,
                "ease":Linear.easeNone,
                "delay":ANIM_TIME,
                "useFrames":true,
                "onComplete":onOpened
            });
        }
        
        override protected function closeAnimation() : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,4,{
                "alpha":_defaultAlpha,
                "ease":Linear.easeNone,
                "useFrames":true
            },{
                "alpha":0,
                "ease":Linear.easeNone,
                "useFrames":true,
                "onComplete":onClosed
            });
        }
    }
}
