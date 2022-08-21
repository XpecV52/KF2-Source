package tripwire.containers
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Linear;
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.controls.Button;
    import scaleform.clik.controls.ScrollingList;
    import scaleform.clik.core.UIComponent;
    
    public class SharedContentListContainer extends UIComponent
    {
         
        
        public var sharedContentTextField:TextField;
        
        public var sharedContentList:ScrollingList;
        
        public var sharedContentConfirmButton:Button;
        
        protected var _defaultAlpha:Number;
        
        protected const ANIM_TIME = 6;
        
        protected const AnimBLUR_OUT = 0;
        
        protected const ANIM_START_Z = 0;
        
        protected const ANIM_OFFSET_Z = 48;
        
        protected const ANIM_BLUR_X = 24;
        
        protected const ANIM_BLUR_Y = 16;
        
        protected const ANIM_ALPHA = 0;
        
        public var ANIM_START_X:Number;
        
        public var ANIM_OFFSET_X:Number = -24;
        
        public function SharedContentListContainer()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.ANIM_START_X = x;
        }
        
        public function openAnimation() : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,this.ANIM_TIME,{
                "z":this.ANIM_OFFSET_Z,
                "alpha":0,
                "ease":Linear.easeNone,
                "useFrames":true
            },{
                "z":this.ANIM_START_Z,
                "alpha":1,
                "ease":Linear.easeNone,
                "useFrames":true
            });
        }
        
        public function closeAnimation() : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,this.ANIM_TIME,{
                "z":this.ANIM_START_Z,
                "alpha":1,
                "ease":Linear.easeNone,
                "useFrames":true
            },{
                "z":this.ANIM_OFFSET_Z,
                "alpha":0,
                "visible":false,
                "ease":Linear.easeNone,
                "useFrames":true
            });
        }
    }
}
