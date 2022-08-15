package tripwire.containers.perks
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Linear;
    import flash.display.MovieClip;
    import flash.text.TextField;
    import scaleform.clik.controls.UILoader;
    import tripwire.containers.TripContainer;
    
    public class PerksHeaderContainer extends TripContainer
    {
         
        
        public var perkNameTextfield:TextField;
        
        public var perkLevelTextfield:TextField;
        
        public var perkXPTextField:TextField;
        
        public var perkRankTextField:TextField;
        
        public var perkIcon:UILoader;
        
        public var progressBar:MovieClip;
        
        public var data:Object;
        
        public var progressNum:Number;
        
        private const PROGRESS_BAR_WIDTH:Number = 575;
        
        public function PerksHeaderContainer()
        {
            super();
            ANIM_OFFSET_X = 0;
        }
        
        public function set perkData(param1:Object) : void
        {
            var _loc2_:String = null;
            this.data = param1;
            if(this.data != null)
            {
                this.perkXPTextField.text = (!!this.data.xpString ? this.data.xpString : "") + " XP";
                this.progressBarWidth = !!this.data.xpPercent ? Number(this.data.xpPercent) : Number(0);
                this.perkNameTextfield.text = !!this.data.perkTitle ? this.data.perkTitle : "";
                this.perkLevelTextfield.text = !!this.data.perkLevel ? this.data.perkLevel : "";
                _loc2_ = !!this.data.iconSource ? this.data.iconSource : "";
                if(_loc2_ != "")
                {
                    this.perkIcon.source = _loc2_;
                }
                this.perkRankTextField.text = !!this.data.prestigeLevel ? this.data.prestigeLevel : "";
            }
        }
        
        protected function set progressBarWidth(param1:Number) : void
        {
            if(param1 < 0)
            {
                param1 = 0;
            }
            if(param1 > 1)
            {
                param1 = 1;
            }
            this.progressNum = 100 * param1 + 1;
            this.progressBar.gotoAndStop(this.progressNum);
        }
        
        override protected function openAnimation() : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,ANIM_TIME,{
                "z":ANIM_OFFSET_Z,
                "x":ANIM_START_X + ANIM_OFFSET_X,
                "alpha":0,
                "blurFilter":{
                    "blurX":ANIM_BLUR_X,
                    "blurY":ANIM_BLUR_Y,
                    "quality":1
                },
                "ease":Linear.easeNone,
                "useFrames":true,
                "overwrite":1
            },{
                "z":ANIM_START_Z,
                "x":ANIM_START_X,
                "alpha":_defaultAlpha,
                "blurFilter":{
                    "blurX":AnimBLUR_OUT,
                    "blurY":AnimBLUR_OUT,
                    "quality":1,
                    "remove":true
                },
                "ease":Linear.easeNone,
                "useFrames":true,
                "onComplete":onOpened
            });
        }
    }
}
