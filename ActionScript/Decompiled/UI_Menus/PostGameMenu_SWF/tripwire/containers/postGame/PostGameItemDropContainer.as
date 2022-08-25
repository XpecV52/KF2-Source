package tripwire.containers.postGame
{
    import com.greensock.TimelineMax;
    import com.greensock.TweenMax;
    import com.greensock.easing.Linear;
    import com.greensock.easing.Power4;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.text.TextField;
    import scaleform.clik.controls.UILoader;
    import scaleform.gfx.Extensions;
    import scaleform.gfx.TextFieldEx;
    import tripwire.containers.TripContainer;
    
    public class PostGameItemDropContainer extends TripContainer
    {
         
        
        public var dropTitleText:TextField;
        
        public var dropNameText:TextField;
        
        public var dropIconLoader:UILoader;
        
        public var voshContainer:MovieClip;
        
        public var voshIcon:MovieClip;
        
        public var voshDeltaTextfield:TextField;
        
        public var voshBumper:MovieClip;
        
        public var voshFrame:MovieClip;
        
        public var voshBG:MovieClip;
        
        public var skullIcon:MovieClip;
        
        public var dropBG:MovieClip;
        
        public var dropBumper:MovieClip;
        
        public var dropFrame:MovieClip;
        
        public var dropTimeline:TimelineMax;
        
        public var voshTimeline:TimelineMax;
        
        public var voshNumAnimation:TweenMax;
        
        public var titleAnimation:TweenMax;
        
        public var voshTargetNum:int = 0;
        
        public var voshCurrentNum:int = 0;
        
        private const ANIMATION_DEFAULT_TIME:int = 10;
        
        private const ANIMATION_DEFAULT_OFFSET:String = "-=5";
        
        private const BUMPER_TARGET_ALPHA:Number = 0.72;
        
        private const BG_TARGET_ALPHA:Number = 0.8;
        
        private const SKULL_TARGET_ALPHA:Number = 0.32;
        
        private const DROP_X_OFFSET:int = 16;
        
        private const DROP_START_SIZE:int = 88;
        
        private const DROP_TARGET_WIDTH:int = 352;
        
        private const DROP_FRAME_WIDTH:int = 268;
        
        private const VOSH_DEFAULT_X:int = 368;
        
        private const VOSH_X_OFFSET:int = 8;
        
        private const VOSH_START_SIZE:int = 40;
        
        private const VOSH_FRAME_WIDTH:int = 132;
        
        public function PostGameItemDropContainer()
        {
            this.dropTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.voshTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            super();
            visible = false;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.makeDropTimeline();
            this.makeVoshTimeline();
            TextFieldEx.setVerticalAlign(this.dropNameText,TextFieldEx.VALIGN_CENTER);
            this.dropNameText.text = "";
        }
        
        public function set data(param1:Object) : void
        {
            this.titleAnimation.pause(0);
            this.dropTimeline.pause(0);
            this.voshTimeline.pause(0);
            this.dropNameText.text = "";
            if(param1)
            {
                visible = true;
                this.dropNameText.text = !!param1.itemName ? param1.itemName : "";
                if(param1.iconImage != "")
                {
                    this.dropIconLoader.source = param1.iconImage;
                }
                if(Extensions.gfxProcessSound != null)
                {
                    Extensions.gfxProcessSound(this,"AAR","Item_Drop");
                }
                this.dropTimeline.play(0);
            }
            else
            {
                visible = false;
            }
        }
        
        public function set voshNumber(param1:int) : void
        {
            this.voshTargetNum = param1;
            TweenMax.delayedCall(15,this.activateVosh,[],true);
        }
        
        public function activateVosh() : void
        {
            var _loc1_:* = this.dropNameText.text != "";
            this.titleAnimation.pause(0);
            this.voshTimeline.pause(0);
            this.voshCurrentNum = 0;
            visible = true;
            this.voshDeltaTextfield.text = "0";
            this.voshNumAnimation.invalidate();
            this.voshNumAnimation.updateTo({"voshCurrentNum":this.voshTargetNum});
            this.voshContainer.x = !!_loc1_ ? Number(this.VOSH_DEFAULT_X) : Number(0);
            this.voshTimeline.play(0);
            if(!_loc1_)
            {
                this.dropTimeline.pause(0);
                this.titleAnimation.play(0);
            }
        }
        
        public function changeVosh() : void
        {
            this.voshDeltaTextfield.text = this.voshCurrentNum.toString();
        }
        
        public function makeDropTimeline() : void
        {
            this.titleAnimation = TweenMax.fromTo(this.dropTitleText,this.ANIMATION_DEFAULT_TIME,{
                "alpha":0,
                "x":this.dropTitleText.x - this.DROP_X_OFFSET
            },{
                "alpha":1,
                "x":this.dropTitleText.x,
                "ease":Power4.easeInOut,
                "useFrames":true,
                "immediateRender":false
            });
            this.dropTimeline.fromTo(this.dropTitleText,this.ANIMATION_DEFAULT_TIME,{
                "alpha":0,
                "x":this.dropTitleText.x - this.DROP_X_OFFSET
            },{
                "alpha":1,
                "x":this.dropTitleText.x,
                "ease":Power4.easeInOut,
                "useFrames":true
            });
            this.dropTimeline.addLabel("phase_1",this.ANIMATION_DEFAULT_OFFSET);
            this.dropTimeline.fromTo(this.dropBumper,this.ANIMATION_DEFAULT_TIME,{
                "alpha":0,
                "x":this.dropBumper.x - this.DROP_X_OFFSET
            },{
                "alpha":this.BUMPER_TARGET_ALPHA,
                "x":this.dropBumper.x,
                "ease":Power4.easeInOut
            },"phase_1");
            this.dropTimeline.fromTo(this.dropBG,this.ANIMATION_DEFAULT_TIME,{
                "alpha":0,
                "width":this.DROP_START_SIZE,
                "x":this.dropBG.x - this.DROP_X_OFFSET
            },{
                "alpha":this.BG_TARGET_ALPHA,
                "x":this.dropBG.x,
                "ease":Power4.easeInOut
            },"phase_1");
            this.dropTimeline.fromTo(this.dropIconLoader,this.ANIMATION_DEFAULT_TIME,{
                "alpha":0,
                "x":this.dropIconLoader.x - this.DROP_X_OFFSET
            },{
                "alpha":1,
                "x":this.dropIconLoader.x,
                "ease":Power4.easeInOut
            },"phase_1");
            this.dropTimeline.addLabel("phase_2",this.ANIMATION_DEFAULT_OFFSET);
            this.dropTimeline.fromTo(this.dropFrame,this.ANIMATION_DEFAULT_TIME,{
                "alpha":0,
                "width":0
            },{
                "alpha":1,
                "width":this.DROP_FRAME_WIDTH,
                "ease":Power4.easeInOut
            },"phase_2");
            this.dropTimeline.fromTo(this.skullIcon,this.ANIMATION_DEFAULT_TIME,{"x":this.DROP_START_SIZE},{
                "x":this.DROP_TARGET_WIDTH,
                "ease":Power4.easeInOut
            },"phase_2");
            this.dropTimeline.fromTo(this.skullIcon,4,{"alpha":0},{
                "alpha":this.SKULL_TARGET_ALPHA,
                "ease":Power4.easeInOut
            },this.ANIMATION_DEFAULT_OFFSET);
            this.dropTimeline.fromTo(this.dropNameText,this.ANIMATION_DEFAULT_TIME,{"alpha":0},{
                "alpha":1,
                "ease":Power4.easeInOut
            },this.ANIMATION_DEFAULT_OFFSET);
        }
        
        public function makeVoshTimeline() : void
        {
            this.voshIcon = this.voshContainer.voshIcon;
            this.voshDeltaTextfield = this.voshContainer.voshDeltaTextfield;
            this.voshBumper = this.voshContainer.voshBumper;
            this.voshFrame = this.voshContainer.voshFrame;
            this.voshBG = this.voshContainer.voshBG;
            this.voshNumAnimation = TweenMax.to(this,20,{
                "voshCurrentNum":this.voshTargetNum,
                "onUpdate":this.changeVosh,
                "ease":Linear.easeNone,
                "useFrames":true
            });
            this.voshTimeline.to(this.voshContainer,5,{});
            this.voshTimeline.addLabel("phase_1");
            this.voshTimeline.fromTo(this.voshBumper,this.ANIMATION_DEFAULT_TIME,{
                "alpha":0,
                "x":this.voshBumper.x - this.VOSH_X_OFFSET
            },{
                "alpha":this.BUMPER_TARGET_ALPHA,
                "x":this.voshBumper.x,
                "ease":Power4.easeInOut
            },"phase_1");
            this.voshTimeline.fromTo(this.voshBG,this.ANIMATION_DEFAULT_TIME,{
                "alpha":0,
                "width":this.VOSH_START_SIZE,
                "x":this.voshBG.x - this.VOSH_X_OFFSET
            },{
                "alpha":this.BG_TARGET_ALPHA,
                "x":this.voshBG.x,
                "ease":Power4.easeInOut
            },"phase_1");
            this.voshTimeline.fromTo(this.voshIcon,this.ANIMATION_DEFAULT_TIME,{
                "alpha":0,
                "x":this.voshIcon.x - this.VOSH_X_OFFSET
            },{
                "alpha":1,
                "x":this.voshIcon.x,
                "ease":Power4.easeInOut
            },"phase_1");
            this.voshTimeline.addLabel("phase_2",this.ANIMATION_DEFAULT_OFFSET);
            this.voshTimeline.fromTo(this.voshFrame,this.ANIMATION_DEFAULT_TIME,{
                "alpha":0,
                "width":0
            },{
                "alpha":1,
                "width":this.VOSH_FRAME_WIDTH,
                "ease":Power4.easeInOut
            },"phase_2");
            this.voshTimeline.fromTo(this.voshDeltaTextfield,10,{"alpha":0},{
                "alpha":1,
                "ease":Power4.easeInOut
            },this.ANIMATION_DEFAULT_OFFSET);
            this.voshTimeline.add(this.voshNumAnimation,this.ANIMATION_DEFAULT_OFFSET);
        }
        
        public function testAnimation(param1:KeyboardEvent) : void
        {
        }
    }
}
