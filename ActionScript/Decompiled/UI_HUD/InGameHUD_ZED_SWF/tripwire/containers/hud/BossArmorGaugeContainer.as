package tripwire.containers.hud
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.display.MovieClip;
    import flash.events.Event;
    import scaleform.clik.core.UIComponent;
    import tripwire.controls.TripUILoader;
    
    public class BossArmorGaugeContainer extends UIComponent
    {
         
        
        public var blackBG:MovieClip;
        
        public var greyBG:MovieClip;
        
        public var scanlines:MovieClip;
        
        public var shieldBar:MovieClip;
        
        public var iconLoader:TripUILoader;
        
        public var maxBarWidth:int = 208;
        
        public var currentPercent:Number = 1;
        
        private const BG_START_WIDTH:int = 232;
        
        private const SCANLINES_OFFSET:int = 8;
        
        private const BAR_OFFSET:int = 32;
        
        public function BossArmorGaugeContainer()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        public function initArmorGauge(param1:String = "", param2:int = 232) : void
        {
            this.iconLoader.source = param1;
            this.blackBG.width = param2;
            this.scanlines.width = param2 - this.SCANLINES_OFFSET;
            this.maxBarWidth = param2 - this.BAR_OFFSET;
            this.shieldBar.width = this.maxBarWidth;
        }
        
        public function set barPercentage(param1:Number) : void
        {
            param1 = param1 >= 0 ? Number(param1) : Number(0);
            if(param1 != this.currentPercent)
            {
                this.currentPercent = param1;
                TweenMax.to(this.shieldBar,4,{
                    "width":param1 * this.maxBarWidth,
                    "onComplete":this.checkActive,
                    "useFrames":true,
                    "ease":Cubic.easeOut
                });
            }
        }
        
        public function get barPercentage() : Number
        {
            return this.currentPercent;
        }
        
        public function checkActive() : void
        {
            alpha = this.currentPercent > 0 ? Number(1) : Number(0.32);
        }
    }
}
