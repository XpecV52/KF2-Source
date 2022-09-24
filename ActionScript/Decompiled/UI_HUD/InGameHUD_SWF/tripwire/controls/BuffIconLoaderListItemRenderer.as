package tripwire.controls
{
    import flash.display.MovieClip;
    import flash.display.Shape;
    import flash.events.TimerEvent;
    import flash.text.TextField;
    import flash.utils.Timer;
    import flash.utils.getTimer;
    import scaleform.clik.controls.UILoader;
    
    public class BuffIconLoaderListItemRenderer extends TripListItemRenderer
    {
         
        
        public var iconLoader:UILoader;
        
        public var iconLoaderBG:UILoader;
        
        public var IconBG:MovieClip;
        
        public var BuffMultiplier:TextField;
        
        private var iconMask:Shape;
        
        private var LastTime:Number;
        
        private var NowTime:Number;
        
        public function BuffIconLoaderListItemRenderer()
        {
            super();
            visible = false;
            this.IconBG.visible = false;
            this.BuffMultiplier.visible = false;
            this.iconMask = new Shape();
            this.iconMask.graphics.lineStyle(1,0);
            this.iconMask.graphics.beginFill(16711680);
            this.iconMask.graphics.drawRect(0,0,this.iconLoaderBG.width,this.iconLoaderBG.height);
            this.iconMask.graphics.endFill();
            this.addChild(this.iconMask);
            this.iconLoader.mask = this.iconMask;
        }
        
        override public function setData(param1:Object) : void
        {
            var _loc2_:Timer = null;
            super.data = param1;
            if(data != null)
            {
                if(param1.iconPath != "")
                {
                    visible = true;
                    this.IconBG.visible = true;
                    this.iconLoader.source = !!param1.iconPath ? param1.iconPath : "";
                    this.iconLoaderBG.source = !!param1.iconPath ? param1.iconPath : "";
                    if(param1.Multiplier > 1)
                    {
                        this.BuffMultiplier.visible = true;
                        this.BuffMultiplier.text = "x" + param1.Multiplier.toString();
                    }
                    else
                    {
                        this.BuffMultiplier.visible = false;
                    }
                    if(param1.MaxDuration > 0 && param1.Duration > 0)
                    {
                        this.iconMask.height = this.iconLoaderBG.height * (param1.Duration / param1.MaxDuration);
                        this.iconMask.y = this.iconLoaderBG.y + (this.iconLoaderBG.height - this.iconMask.height);
                        _loc2_ = new Timer(100,0);
                        _loc2_.addEventListener(TimerEvent.TIMER,this.onTick);
                        this.LastTime = getTimer();
                        _loc2_.start();
                    }
                }
                else
                {
                    visible = false;
                    this.IconBG.visible = false;
                    this.BuffMultiplier.visible = false;
                }
            }
            else
            {
                visible = false;
                this.IconBG.visible = false;
                this.BuffMultiplier.visible = false;
            }
        }
        
        public function onTick(param1:TimerEvent) : void
        {
            var _loc2_:Number = NaN;
            this.NowTime = getTimer();
            if(super.data.MaxDuration > 0 && super.data.Duration > 0)
            {
                _loc2_ = (this.NowTime - this.LastTime) * 0.001;
                super.data.Duration -= _loc2_;
                if(super.data.Duration < 0)
                {
                    super.data.Duration = 0;
                }
                this.iconMask.height = this.iconLoaderBG.height * (super.data.Duration / super.data.MaxDuration);
                this.iconMask.y = this.iconLoaderBG.y + (this.iconLoaderBG.height - this.iconMask.height);
            }
            this.LastTime = this.NowTime;
        }
    }
}
