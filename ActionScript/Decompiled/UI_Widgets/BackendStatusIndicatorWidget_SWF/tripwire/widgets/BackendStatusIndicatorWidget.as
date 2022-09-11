package tripwire.widgets
{
    import com.greensock.TimelineMax;
    import com.greensock.easing.Cubic;
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.text.TextField;
    import tripwire.containers.TripContainer;
    
    public class BackendStatusIndicatorWidget extends TripContainer
    {
         
        
        public var BackendStatusIndicatorLogoConnected:MovieClip;
        
        public var BackendStatusIndicatorLogoDisconnected:MovieClip;
        
        public var BackendStatusIndicatorDescription:TextField;
        
        public const redColorCode:uint = 12792130;
        
        public const whiteColorCode:uint = 14538703;
        
        public var redColor:Color;
        
        public var whiteColor:Color;
        
        public const FADEOUT_TIME:Number = 1.0;
        
        public var flickeringTimeline;
        
        public function BackendStatusIndicatorWidget()
        {
            this.redColor = new Color();
            this.whiteColor = new Color();
            this.flickeringTimeline = new TimelineMax({
                "paused":true,
                "yoyo":true,
                "repeat":-1
            });
            super();
            var _loc1_:Color = new Color();
            this.redColor.setTint(this.redColorCode,1);
            this.whiteColor.setTint(this.whiteColorCode,1);
            this.BackendStatusIndicatorDescription.transform.colorTransform = this.whiteColor;
            this.BackendStatusIndicatorLogoConnected.transform.colorTransform = this.whiteColor;
            this.BackendStatusIndicatorLogoDisconnected.transform.colorTransform = this.redColor;
            this.flickeringTimeline.to([this.BackendStatusIndicatorLogoDisconnected,this.BackendStatusIndicatorDescription],this.FADEOUT_TIME,{
                "alpha":0,
                "ease":Cubic.easeInOut
            });
        }
        
        public function startDisconnectionAnimation() : void
        {
            this.flickeringTimeline.play(0);
            this.BackendStatusIndicatorDescription.transform.colorTransform = this.redColor;
            this.BackendStatusIndicatorLogoConnected.visible = false;
            this.BackendStatusIndicatorLogoDisconnected.visible = true;
        }
        
        public function stopDisconnectionAnimation() : void
        {
            this.flickeringTimeline.stop();
            this.BackendStatusIndicatorDescription.transform.colorTransform = this.whiteColor;
            this.BackendStatusIndicatorLogoConnected.visible = true;
            this.BackendStatusIndicatorLogoDisconnected.visible = false;
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.BackendStatusIndicatorDescription.text = !!param1.backendStatusIndicatorString ? param1.backendStatusIndicatorString : "ITEM SERVER CONNECTION";
            }
            this.verticalAlignText(this.BackendStatusIndicatorDescription);
        }
        
        public function verticalAlignText(param1:TextField) : void
        {
            param1.y += Math.round((param1.height - param1.textHeight) * 0.5);
        }
    }
}
