package tripwire.containers.doshVault
{
    import com.greensock.TimelineMax;
    import com.greensock.TweenMax;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import tripwire.containers.BaseContainer;
    
    public class DoshMeterContainer extends BaseContainer
    {
         
        
        public var bar:MovieClip;
        
        public var yourDoshContainer:MovieClip;
        
        public var doshLoop:int;
        
        public var doshCounter:int;
        
        public var oldDoshNum:int;
        
        public var currentDoshNum:int;
        
        public var finalPercentage:Number;
        
        private const BAR_FULL_HEIGHT:int = 560;
        
        public var doshTimeline:TimelineMax;
        
        public var doshNumberTimeline:TimelineMax;
        
        public function DoshMeterContainer()
        {
            this.doshTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.doshNumberTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        public function setupDoshTimeline() : void
        {
            this.doshTimeline.stop();
            this.doshTimeline.clear();
            this.doshTimeline.repeat(0);
            this.doshTimeline.to(this.bar,0,{"height":0});
            this.doshTimeline.to(this.yourDoshContainer,0,{"y":this.bar.y});
            this.doshTimeline.add(function():*
            {
                doshNumberTimeline.play();
            },0);
            this.doshTimeline.to(this.bar,30,{"height":this.BAR_FULL_HEIGHT});
            this.doshTimeline.to(this.yourDoshContainer,30,{"y":this.bar.y - this.BAR_FULL_HEIGHT},"-=30");
            this.doshTimeline.add(function():*
            {
                doshNumberTimeline.pause();
            });
        }
        
        public function setupDoshNumberTimeline(param1:Number, param2:Number) : void
        {
            this.doshNumberTimeline.stop();
            this.doshNumberTimeline.clear();
            this.doshNumberTimeline.to(this,param1,{
                "doshCounter":param2,
                "onUpdate":this.changeDosh
            });
            this.doshNumberTimeline.progress(0);
        }
        
        public function updateDosh(param1:int, param2:int, param3:Number, param4:Number) : void
        {
            this.setupDoshTimeline();
            this.doshCounter = param1;
            this.changeDosh();
            this.doshTimeline.progress(param3);
            this.setupDoshNumberTimeline(this.doshTimeline.duration() * (param4 - param3),param2);
            if(param4 >= 2)
            {
                this.doshLoop = Math.floor(param4) - 1;
                this.doshTimeline.repeat(this.doshLoop);
                this.doshTimeline.repeatDelay(15);
                this.finalPercentage = param4;
                this.doshTimeline.add(this.finalAnimaitonComplete);
                this.doshTimeline.add(this.loopComplete);
                this.doshTimeline.play();
                this.doshNumberTimeline.play();
            }
            else if(param4 >= 1)
            {
                this.doshTimeline.repeat(0);
                this.doshTimeline.call(this.doshComplete,[0,param4 - Math.floor(param4)]);
                this.doshTimeline.play();
                this.doshNumberTimeline.play();
            }
            else
            {
                this.doshComplete(param3,param4);
            }
        }
        
        public function loopComplete() : void
        {
            this.doshLoop = this.doshLoop - 1;
        }
        
        public function finalAnimaitonComplete() : void
        {
            if(this.doshLoop == 0)
            {
                TweenMax.delayedCall(15,this.doshComplete,[0,this.finalPercentage - Math.floor(this.finalPercentage)],true);
            }
        }
        
        public function changeDosh() : void
        {
            this.yourDoshContainer.yourDoshAmountTextfield.text = String(this.doshCounter);
        }
        
        public function doshComplete(param1:Number, param2:Number) : void
        {
            this.doshTimeline.tweenFromTo(this.doshTimeline.duration() * param1,this.doshTimeline.duration() * param2);
            this.doshNumberTimeline.play();
        }
        
        public function testMeter(param1:KeyboardEvent) : void
        {
        }
    }
}
