package tripwire.widgets
{
    import com.greensock.TimelineMax;
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.text.TextField;
    import flash.ui.Keyboard;
    import scaleform.clik.core.UIComponent;
    
    public class GoompaCounterWidget extends UIComponent
    {
         
        
        public var counterNum:TextField;
        
        public var goompaIcon:MovieClip;
        
        public var masterTimeline:TimelineMax;
        
        public var bloodTimeline:TimelineMax;
        
        public var _count:int = -1;
        
        public var bonusBarStartWidth:Number;
        
        public var countGauge:MovieClip;
        
        protected var _hidden:Boolean;
        
        public var bloodSplatter:MovieClip;
        
        public function GoompaCounterWidget()
        {
            this.masterTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.bloodTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            super();
            enableInitCallback = true;
            this.visible = false;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.bonusBarStartWidth = this.countGauge.width;
            this.setTimeline();
            this.count = 0;
            this.bonusPercentage = 0;
        }
        
        public function setTimeline() : void
        {
            this.masterTimeline.clear();
            this.masterTimeline.append(TweenMax.fromTo(this.counterNum,4,{"z":0},{
                "z":-64,
                "useFrames":true,
                "ease":Cubic.easeOut
            }));
            this.masterTimeline.append(TweenMax.to(this.counterNum,8,{
                "z":0,
                "useFrames":true,
                "ease":Cubic.easeOut
            }));
            this.bloodTimeline.clear();
            this.bloodTimeline.append(TweenMax.fromTo(this.bloodSplatter,8,{
                "alpha":1,
                "frameLabel":"start"
            },{
                "frameLabel":"end",
                "ease":Cubic.easeOut
            }));
            this.bloodTimeline.append(TweenMax.to(this.bloodSplatter,4,{
                "alpha":0,
                "ease":Cubic.easeOut
            }));
        }
        
        public function get count() : int
        {
            return this._count;
        }
        
        public function set count(param1:int) : void
        {
            if(param1 == this._count)
            {
                this.bloodTimeline.time(0);
                this.bloodTimeline.play();
                return;
            }
            if(param1 > this._count)
            {
                this.bloodTimeline.time(0);
                this.bloodTimeline.play();
            }
            this._count = param1;
            if(param1 == 0)
            {
                TweenMax.to(this,4,{
                    "alpha":0,
                    "visible":false,
                    "useFrames":true,
                    "ease":Cubic.easeOut
                });
            }
            else if(param1 == 1)
            {
                this.visible = true;
                alpha = 1;
                this.masterTimeline.time(0);
                this.masterTimeline.play();
            }
            this.counterNum.text = "x" + param1.toString();
        }
        
        public function set bonusPercentage(param1:Number) : *
        {
            if(param1 >= 0 && 1 >= param1)
            {
                this.countGauge.width = this.bonusBarStartWidth * param1;
            }
        }
        
        public function OnButtonPress(param1:KeyboardEvent) : void
        {
            if(param1.keyCode == Keyboard.A)
            {
                this.count += 1;
            }
            else
            {
                this.count = 0;
            }
        }
        
        public function set hidden(param1:Boolean) : void
        {
            this._hidden = param1;
            this.visible = !this._hidden;
        }
        
        override public function get visible() : Boolean
        {
            return super.visible && !this._hidden;
        }
        
        override public function set visible(param1:Boolean) : void
        {
            super.visible = param1 && !this._hidden;
        }
        
        public function testTrace() : void
        {
        }
    }
}
