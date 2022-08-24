package tripwire.widgets
{
    import com.greensock.TimelineMax;
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import com.greensock.plugins.ColorTransformPlugin;
    import com.greensock.plugins.TweenPlugin;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.TimerEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import flash.utils.Timer;
    import scaleform.clik.core.UIComponent;
    import scaleform.gfx.TextFieldEx;
    import tripwire.controls.TripUILoader;
    
    public class PriorityMsgWidget extends UIComponent
    {
         
        
        private var _msgFadeTimer;
        
        public var priorityTextfield:TextField;
        
        public var objectiveTitleTextfield:TextField;
        
        public var objectiveNameTextfield:TextField;
        
        public var doshPlusTextfield:TextField;
        
        public var objectiveRewardTextfield:TextField;
        
        public var secondaryTextfield:TextField;
        
        public var objectiveDescTextfield:TextField;
        
        public var objectiveRequireTextfield:TextField;
        
        public var priorityScanlines:MovieClip;
        
        public var priorityLeftBumper:MovieClip;
        
        public var priorityRightBumper:MovieClip;
        
        public var priorityBlackBG:MovieClip;
        
        public var priorityColorBG:MovieClip;
        
        public var secondaryBG:MovieClip;
        
        public var secondaryScanlines:MovieClip;
        
        public var doshIcon:MovieClip;
        
        public var objectiveIcon:TripUILoader;
        
        private const BG_START_SIZE:int = 128;
        
        private const BG_TARGET_X:int = 800;
        
        private const BG_TARGET_Y:int = 64;
        
        private const MIDPOINT_X:int = 400;
        
        private const MIDPOINT_Y:int = 128;
        
        private const BUMPER_OFFSET:int = 32;
        
        private const ICON_START_SIZE:int = 48;
        
        private const OBJECTIVE_TARGET_HEIGHT:int = 152;
        
        private const OBJECTIVE_TARGET_WIDTH:int = 576;
        
        private const OBJECTIVE_BG_OFFSET:int = 20;
        
        private const OBJECTIVE_SECONDARY_Y:int = 24;
        
        private const SECONDARY_BG_START_WIDTH:int = 16;
        
        private const SECONDARY_BG_END_WIDTH:int = 688;
        
        private const SECONDARY_BG_START_HEIGHT:int = 16;
        
        private const SECONDARY_BG_END_HEIGHT:int = 40;
        
        private const ANIMATION_DELAY:int = 8;
        
        private const ANIMATION_DEFAULT_TIMING:int = 3;
        
        private const ANIMATION_DEFAULT_OFFSET_STRING:String = "-=3";
        
        private const OBJECTIVE_DELAY:String = "+=60";
        
        private const OBJECTIVE_EXIT_ANIM_TIMING:int = 2;
        
        private const DISPLAY_TIME_BASE:int = 1;
        
        public var currentObjectiveColor:uint = 15534080;
        
        private const PRIORITY_COLOR:uint = 15534080;
        
        private const BONUS_COLOR:uint = 15573775;
        
        public var currentCountdownTime:int = 0;
        
        public var priorityTimeline:TimelineMax;
        
        public var objectiveTimeline:TimelineMax;
        
        public var objectiveTransitionTimeline:TimelineMax;
        
        public var objectiveCloseTimeline:TimelineMax;
        
        public var secondaryTimeline:TimelineMax;
        
        public var fadeOutAnimation:TweenMax;
        
        public var colorChangeAnimation:TweenMax;
        
        public function PriorityMsgWidget()
        {
            this._msgFadeTimer = new Timer(1000,1);
            this.priorityTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.objectiveTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true,
                "onStart":this.objectiveMessageFired
            });
            this.objectiveTransitionTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.objectiveCloseTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.secondaryTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            super();
            _enableInitCallback = true;
            this._msgFadeTimer.addEventListener(TimerEvent.TIMER,this.onPriorityMessageFinished);
            visible = false;
            TweenPlugin.activate([ColorTransformPlugin]);
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            TextFieldEx.setTextAutoSize(this.objectiveDescTextfield,"shrink");
            this.colorChangeAnimation = TweenMax.to(this.priorityColorBG,this.ANIMATION_DEFAULT_TIMING,{
                "colorTransform":{
                    "tint":this.currentObjectiveColor,
                    "tintAmount":1
                },
                "useFrames":true
            });
            this.makePriorityTimeline();
            this.makeObjectiveTimeline();
            this.makeSecondaryTimeline();
            this.fadeOutAnimation = TweenMax.to(this,3,{
                "alpha":0,
                "delay":this.ANIMATION_DELAY,
                "useFrames":true,
                "ease":Cubic.easeOut,
                "paused":true,
                "onComplete":this.onPriorityMessageFadeOutComplete
            });
            this.resetAllAssets();
            this.objectiveTransitionTimeline.eventCallback("onComplete",this.objectiveTimeline.play,["start"]);
        }
        
        public function set priorityMessage(param1:Object) : void
        {
            visible = true;
            this.resetAllAssets();
            this.currentCountdownTime = !!param1.priorityTextDisplayTime ? int(param1.priorityTextDisplayTime) : 0;
            this.currentObjectiveColor = this.PRIORITY_COLOR;
            TweenMax.set(this.priorityColorBG,{
                "colorTransform":{
                    "tint":this.currentObjectiveColor,
                    "tintAmount":1
                },
                "alpha":0.16
            });
            if(param1.priorityTextPrimaryString != "")
            {
                this.priorityTextfield.text = param1.priorityTextPrimaryString;
                this.priorityTimeline.eventCallback("onComplete",this.setDisplayTime,[param1.priorityTextDisplayTime]);
            }
            if(param1.priorityTextSecondaryString && param1.priorityTextSecondaryString != "")
            {
                this.secondaryTextfield.text = param1.priorityTextSecondaryString;
                this.priorityTimeline.eventCallback("onComplete",this.secondaryTimeline.play,[0]);
                this.secondaryTimeline.eventCallback("onComplete",this.setDisplayTime,[param1.priorityTextDisplayTime]);
            }
            this.priorityTimeline.play(0);
        }
        
        public function set objectiveMessage(param1:Object) : void
        {
            this.objectiveTitleTextfield.text = !!param1.titleString ? param1.titleString : "";
            this.objectiveNameTextfield.text = !!param1.nameString ? param1.nameString : "";
            this.objectiveRewardTextfield.text = !!param1.rewardNum ? param1.rewardNum : "";
            this.objectiveDescTextfield.text = !!param1.descString ? param1.descString : "Defend the marked waypoint";
            this.objectiveRequireTextfield.text = !!param1.requireString ? param1.requireString : "(%x% players required)";
            this.objectiveIcon.source = !!param1.iconPath ? param1.iconPath : "";
            this.currentObjectiveColor = !!param1.isBonus ? uint(this.BONUS_COLOR) : uint(this.PRIORITY_COLOR);
            this.colorChangeAnimation.updateTo({"colorTransform":{
                "tint":this.currentObjectiveColor,
                "tintAmount":1
            }},false);
            this._msgFadeTimer.reset();
            if(visible && !this.fadeOutAnimation.isActive())
            {
                if(this.secondaryTextfield.text != "" && this.secondaryTimeline.progress() != 1)
                {
                    this.secondaryTimeline.eventCallback("onComplete",this.objectiveTransitionTimeline.play,[0]);
                }
                else if(this.priorityTextfield.text != "" && this.priorityTimeline.progress() != 1)
                {
                    this.priorityTimeline.eventCallback("onComplete",this.objectiveTransitionTimeline.play,[0]);
                }
                else if(this.priorityTextfield.text != "" || this.secondaryTextfield.text != "")
                {
                    this.objectiveTransitionTimeline.play(0);
                }
                else
                {
                    this.resetAllAssets(true);
                    TweenMax.to(this,this.ANIMATION_DEFAULT_TIMING,{
                        "autoAlpha":1,
                        "ease":Cubic.easeOut,
                        "useFrames":true,
                        "onComplete":this.objectiveTimeline.play,
                        "onCompleteParams":["start"]
                    });
                }
            }
            else
            {
                this.currentCountdownTime = !!param1.displayTime ? int(param1.displayTime) : 4;
                this.resetAllAssets(true);
                TweenMax.to(this,this.ANIMATION_DEFAULT_TIMING,{
                    "autoAlpha":1,
                    "ease":Cubic.easeOut,
                    "useFrames":true,
                    "onComplete":this.objectiveTimeline.play,
                    "onCompleteParams":["start"]
                });
            }
            this.objectiveTimeline.eventCallback("onComplete",this.setDisplayTime,[this.currentCountdownTime + this.DISPLAY_TIME_BASE]);
        }
        
        public function makePriorityTimeline() : void
        {
            this.priorityTimeline.append(TweenMax.fromTo(this,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":0.88,
                "ease":Cubic.easeInOut,
                "repeat":4,
                "yoyo":true
            }));
            this.priorityTimeline.addLabel("endBlink");
            this.priorityTimeline.append(TweenMax.allTo([this.priorityScanlines,this.priorityLeftBumper,this.priorityRightBumper,this.priorityBlackBG,this.priorityColorBG],this.ANIMATION_DEFAULT_TIMING,{
                "width":this.BG_TARGET_Y,
                "height":this.BG_TARGET_Y,
                "ease":Cubic.easeInOut
            }));
            this.priorityTimeline.addLabel("endShrink");
            this.priorityTimeline.append(TweenMax.allTo([this.priorityScanlines,this.priorityBlackBG,this.priorityColorBG],this.ANIMATION_DEFAULT_TIMING,{
                "width":this.BG_TARGET_X,
                "ease":Cubic.easeOut
            }));
            this.priorityTimeline.to(this.priorityLeftBumper,this.ANIMATION_DEFAULT_TIMING,{
                "x":this.BUMPER_OFFSET,
                "ease":Cubic.easeOut
            },this.ANIMATION_DEFAULT_OFFSET_STRING);
            this.priorityTimeline.to(this.priorityRightBumper,this.ANIMATION_DEFAULT_TIMING,{
                "x":this.width - this.BUMPER_OFFSET,
                "ease":Cubic.easeOut
            },this.ANIMATION_DEFAULT_OFFSET_STRING);
            this.priorityTimeline.to(this.priorityTextfield,this.ANIMATION_DEFAULT_TIMING,{
                "alpha":1,
                "ease":Cubic.easeIn
            },"-=2");
            this.priorityTimeline.addLabel("end");
            this.priorityTimeline.call(this.priorityMessageFired);
        }
        
        public function makeObjectiveTimeline() : void
        {
            this.objectiveTransitionTimeline.to(this.priorityTextfield,this.ANIMATION_DEFAULT_TIMING,{
                "alpha":0,
                "ease":Cubic.easeOut
            },this.OBJECTIVE_DELAY);
            this.objectiveTransitionTimeline.append(TweenMax.allTo([this.priorityLeftBumper,this.priorityRightBumper],this.ANIMATION_DEFAULT_TIMING,{
                "x":this.MIDPOINT_X,
                "ease":Cubic.easeOut
            }));
            this.objectiveTransitionTimeline.append(TweenMax.allTo([this.priorityScanlines,this.priorityBlackBG,this.priorityColorBG],this.ANIMATION_DEFAULT_TIMING,{
                "width":this.BG_TARGET_Y,
                "ease":Cubic.easeOut
            }),this.ANIMATION_DEFAULT_OFFSET_STRING);
            this.objectiveTransitionTimeline.append(TweenMax.allTo([this.priorityScanlines,this.priorityBlackBG,this.priorityColorBG,this.priorityLeftBumper,this.priorityRightBumper],this.ANIMATION_DEFAULT_TIMING,{
                "width":this.BUMPER_OFFSET,
                "height":this.BUMPER_OFFSET
            }));
            this.objectiveTransitionTimeline.append(TweenMax.allTo([this.priorityLeftBumper,this.priorityRightBumper],this.ANIMATION_DEFAULT_TIMING,{
                "alpha":0,
                "ease":Cubic.easeOut
            }),this.ANIMATION_DEFAULT_OFFSET_STRING);
            this.objectiveTransitionTimeline.add(this.colorChangeAnimation,this.ANIMATION_DEFAULT_OFFSET_STRING);
            this.objectiveTransitionTimeline.to(this.priorityColorBG,this.ANIMATION_DEFAULT_TIMING,{"alpha":0.64},this.ANIMATION_DEFAULT_OFFSET_STRING);
            this.objectiveTransitionTimeline.append(TweenMax.allTo([this.priorityScanlines,this.priorityColorBG,this.priorityBlackBG,this.priorityLeftBumper,this.priorityRightBumper],this.ANIMATION_DEFAULT_TIMING,{
                "y":this.OBJECTIVE_SECONDARY_Y,
                "ease":Cubic.easeOut
            }),this.ANIMATION_DEFAULT_OFFSET_STRING);
            this.objectiveTimeline.addLabel("start");
            this.objectiveTimeline.append(TweenMax.allTo([this.priorityScanlines,this.priorityBlackBG,this.priorityColorBG],this.ANIMATION_DEFAULT_TIMING,{
                "width":this.OBJECTIVE_TARGET_WIDTH,
                "ease":Cubic.easeOut
            }));
            this.objectiveTimeline.to(this.objectiveTitleTextfield,this.ANIMATION_DEFAULT_TIMING,{
                "alpha":1,
                "ease":Cubic.easeIn
            },"-=2");
            this.objectiveTimeline.append(TweenMax.allTo([this.priorityScanlines,this.priorityBlackBG],this.ANIMATION_DEFAULT_TIMING,{
                "height":this.OBJECTIVE_TARGET_HEIGHT,
                "y":this.BG_TARGET_Y + this.OBJECTIVE_BG_OFFSET
            }));
            this.objectiveTimeline.addLabel("end");
            this.objectiveTimeline.append(TweenMax.allTo([this.objectiveIcon,this.objectiveNameTextfield],this.ANIMATION_DEFAULT_TIMING,{
                "alpha":1,
                "ease":Cubic.easeInOut
            }));
            this.objectiveTimeline.append(TweenMax.allTo([this.doshPlusTextfield,this.doshIcon,this.objectiveRewardTextfield],2,{
                "alpha":1,
                "ease":Cubic.easeIn,
                "repeat":2,
                "yoyo":true
            }));
            this.objectiveTimeline.append(TweenMax.allTo([this.objectiveDescTextfield,this.objectiveRequireTextfield],2,{"alpha":1}));
            this.objectiveCloseTimeline.append(TweenMax.allTo([this.doshPlusTextfield,this.doshIcon,this.objectiveRewardTextfield,this.objectiveDescTextfield,this.objectiveRequireTextfield,this.objectiveIcon,this.objectiveNameTextfield],this.OBJECTIVE_EXIT_ANIM_TIMING,{
                "alpha":0,
                "ease":Cubic.easeOut
            }));
            this.objectiveCloseTimeline.append(TweenMax.allTo([this.priorityScanlines,this.priorityBlackBG],this.OBJECTIVE_EXIT_ANIM_TIMING,{
                "height":this.BUMPER_OFFSET,
                "y":this.OBJECTIVE_SECONDARY_Y,
                "ease":Cubic.easeOut
            }));
            this.objectiveCloseTimeline.to(this.objectiveTitleTextfield,this.OBJECTIVE_EXIT_ANIM_TIMING,{
                "alpha":0,
                "ease":Cubic.easeOut
            });
            this.objectiveCloseTimeline.append(TweenMax.allTo([this.priorityScanlines,this.priorityBlackBG,this.priorityColorBG],this.OBJECTIVE_EXIT_ANIM_TIMING,{
                "width":this.BUMPER_OFFSET,
                "ease":Cubic.easeOut
            }));
        }
        
        public function makeSecondaryTimeline() : void
        {
            this.secondaryTimeline.addLabel("start");
            this.secondaryTimeline.append(TweenMax.fromTo(this.secondaryScanlines,5,{"alpha":0},{
                "alpha":0.48,
                "ease":Cubic.easeIn
            }));
            this.secondaryTimeline.append(TweenMax.fromTo(this.secondaryBG,5,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeIn
            }),"-=5");
            this.secondaryTimeline.append(TweenMax.allTo([this.secondaryScanlines,this.secondaryBG],this.ANIMATION_DEFAULT_TIMING,{
                "width":this.SECONDARY_BG_END_WIDTH,
                "ease":Cubic.easeInOut
            }));
            this.secondaryTimeline.append(TweenMax.allFromTo([this.secondaryScanlines,this.secondaryBG],this.ANIMATION_DEFAULT_TIMING,{"height":this.SECONDARY_BG_START_HEIGHT},{
                "height":this.SECONDARY_BG_END_HEIGHT,
                "ease":Cubic.easeInOut
            }));
            this.secondaryTimeline.addLabel("end");
            this.secondaryTimeline.append(TweenMax.to(this.secondaryTextfield,this.ANIMATION_DEFAULT_TIMING,{
                "alpha":1,
                "ease":Cubic.easeInOut,
                "repeat":4,
                "yoyo":true
            }));
        }
        
        public function resetAllAssets(param1:Boolean = false) : void
        {
            this._msgFadeTimer.stop();
            this.fadeOutAnimation.pause(0);
            this.priorityTimeline.stop();
            this.secondaryTimeline.stop();
            this.objectiveTransitionTimeline.stop();
            this.objectiveTimeline.stop();
            this.objectiveCloseTimeline.stop();
            this.colorChangeAnimation.invalidate();
            this.priorityTimeline.eventCallback("onComplete",null);
            this.secondaryTimeline.eventCallback("onComplete",null);
            this.objectiveTimeline.eventCallback("onComplete",null);
            this.priorityTextfield.text = this.secondaryTextfield.text = "";
            this.priorityLeftBumper.alpha = this.priorityRightBumper.alpha = !!param1 ? Number(0) : Number(1);
            this.priorityTextfield.alpha = this.secondaryTextfield.alpha = this.secondaryBG.alpha = this.secondaryScanlines.alpha = 0;
            this.objectiveTitleTextfield.alpha = this.objectiveIcon.alpha = this.objectiveNameTextfield.alpha = this.doshPlusTextfield.alpha = 0;
            this.doshIcon.alpha = this.objectiveRewardTextfield.alpha = this.objectiveDescTextfield.alpha = this.objectiveRequireTextfield.alpha = 0;
            this.priorityScanlines.y = this.priorityBlackBG.y = this.priorityColorBG.y = !!param1 ? Number(this.OBJECTIVE_SECONDARY_Y) : Number(this.MIDPOINT_Y);
            this.priorityLeftBumper.width = this.priorityLeftBumper.height = this.priorityRightBumper.width = this.priorityRightBumper.height = this.BG_START_SIZE;
            this.priorityScanlines.width = this.priorityScanlines.height = !!param1 ? Number(this.BUMPER_OFFSET) : Number(this.BG_START_SIZE);
            this.priorityBlackBG.width = this.priorityBlackBG.height = this.priorityColorBG.width = this.priorityColorBG.height = !!param1 ? Number(this.BUMPER_OFFSET) : Number(this.BG_START_SIZE);
            this.priorityLeftBumper.x = this.priorityRightBumper.x = this.priorityScanlines.x = this.priorityBlackBG.x = this.priorityColorBG.x = this.MIDPOINT_X;
            this.priorityLeftBumper.y = this.priorityRightBumper.y = this.MIDPOINT_Y;
            this.secondaryScanlines.width = this.secondaryBG.width = this.SECONDARY_BG_START_WIDTH;
            if(param1 == false)
            {
                this.objectiveNameTextfield.text = this.objectiveTitleTextfield.text = this.objectiveRewardTextfield.text = this.objectiveDescTextfield.text = this.objectiveRequireTextfield.text = "";
            }
            else
            {
                TweenMax.set(this.priorityColorBG,{
                    "colorTransform":{
                        "tint":this.currentObjectiveColor,
                        "tintAmount":1
                    },
                    "alpha":0.64
                });
            }
        }
        
        public function setDisplayTime(param1:int) : void
        {
            if(param1 > 0)
            {
                this._msgFadeTimer.delay = param1 * 1000;
                this._msgFadeTimer.reset();
                this._msgFadeTimer.start();
            }
        }
        
        private function onPriorityMessageFinished(param1:TimerEvent) : *
        {
            if(this.secondaryTextfield.text != "")
            {
                this.secondaryTimeline.tweenFromTo("end","start");
                if(this.objectiveTitleTextfield.text != "")
                {
                    this.objectiveCloseTimeline.play(0);
                }
                else
                {
                    this.priorityTimeline.tweenFromTo("end","endShrink",{"delay":this.ANIMATION_DELAY * 0.5});
                }
            }
            else if(this.objectiveTitleTextfield.text != "")
            {
                this.objectiveCloseTimeline.play(0);
            }
            else
            {
                this.priorityTimeline.tweenFromTo("end","endShrink",{"delay":this.ANIMATION_DELAY * 0.5});
            }
            this.fadeOutAnimation.restart(true);
        }
        
        private function onPriorityMessageFadeOutComplete() : void
        {
            visible = false;
            this.resetAllAssets();
        }
        
        private function priorityMessageFired() : void
        {
            ExternalInterface.call("Callback_PriorityMessageComplete");
        }
        
        private function objectiveMessageFired() : void
        {
            ExternalInterface.call("Callback_ObjMessageFired");
        }
        
        public function testAnimation(param1:KeyboardEvent) : void
        {
        }
    }
}
