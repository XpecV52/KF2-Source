package tripwire.widgets
{
    import com.greensock.TimelineMax;
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import com.greensock.plugins.ColorTransformPlugin;
    import com.greensock.plugins.TweenPlugin;
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.TimerEvent;
    import flash.external.ExternalInterface;
    import flash.filters.GlowFilter;
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
        
        public var objectiveRewardTextfield:TextField;
        
        public var voshIcon:MovieClip;
        
        public var objectiveVoshRewardTextfield:TextField;
        
        public var xpPlusTextfield:TextField;
        
        public var objectiveDoshPlusIcon:MovieClip;
        
        public var objectiveXPPlusIcon:MovieClip;
        
        public var objectiveVoshPlusIcon:MovieClip;
        
        public var objectiveXPRewardTextfield:TextField;
        
        public var secondaryTextfield:TextField;
        
        public var objectiveDescTextfield:TextField;
        
        public var objectiveRequireTextfield:TextField;
        
        public var priorityScanlines:MovieClip;
        
        public var priorityLeftBumper:MovieClip;
        
        public var priorityRightBumper:MovieClip;
        
        public var priorityBlackBG:MovieClip;
        
        public var priorityColorBG:MovieClip;
        
        public var priorityDivider:MovieClip;
        
        public var objectiveMainBumper:MovieClip;
        
        public var objectiveSideBumper:MovieClip;
        
        public var objectiveBG:MovieClip;
        
        public var objectiveRewardLine:MovieClip;
        
        public var objectiveScanlines:MovieClip;
        
        public var doshIcon:MovieClip;
        
        public var objectiveIcon:TripUILoader;
        
        public var waveNumberScanlines:MovieClip;
        
        public var waveNumberLeftFrame:MovieClip;
        
        public var waveNumberRightFrame:MovieClip;
        
        public var waveNumberBumper:MovieClip;
        
        public var waveNumberTextfield:TextField;
        
        public var waveTitleTextfield:TextField;
        
        public var waveTypeImage:TripUILoader;
        
        public var waveTypeString:String;
        
        private const BG_START_SIZE:int = 128;
        
        private const BG_TARGET_X:int = 800;
        
        private const BG_TARGET_Y:int = 64;
        
        private const MIDPOINT_X:int = 400;
        
        private const MIDPOINT_Y:int = 144;
        
        private const BUMPER_OFFSET:int = 32;
        
        private const ICON_START_SIZE:int = 48;
        
        private const OBJECTIVE_TARGET_HEIGHT:int = 96;
        
        private const OBJECTIVE_BUMPER_START_WIDTH:int = 16;
        
        private const OBJECTIVE_BUMPER_TARGET_WIDTH:Number = 72.2;
        
        private const OBJECTIVE_LINE_TARGET_HEIGHT:int = 80;
        
        private const OBJECTIVE_BG_FIRST_HEIGHT:int = 48;
        
        private const OBJECTIVE_NAME_DEFAULT_Y:Number = 0.75;
        
        private const OBJECTIVE_NAME_BONUS_Y:Number = 28.75;
        
        private const SECONDARY_BG_START_WIDTH:int = 32;
        
        private const SECONDARY_BG_END_WIDTH:int = 688;
        
        private const SECONDARY_BG_END_HEIGHT:int = 40;
        
        private const ANIMATION_DELAY:int = 8;
        
        private const ANIMATION_DEFAULT_TIMING:int = 3;
        
        private const ANIMATION_DEFAULT_OFFSET_STRING:String = "-=3";
        
        private const WAVE_LEFT_START_X:int = 312;
        
        private const WAVE_RIGHT_START_X:int = 488;
        
        private const WAVE_FRAME_OFFSET:int = 24;
        
        private const WAVE_BUMPER_OFFSET:int = 8;
        
        private const WAVE_START_SIZE:int = 32;
        
        private const WAVE_TARGET_WIDTH:int = 176;
        
        private const WAVE_TARGET_HEIGHT:int = 80;
        
        private const WAVE_NUM_X:int = 364;
        
        private const WAVE_X_OFFSET:int = 3;
        
        private const WAVE_TYPE_WIDTH:int = 256;
        
        private const WAVE_NUM_START_Y:Number = 166.75;
        
        private const TIER_1_COLOR:uint = 16503487;
        
        private const TIER_2_COLOR:uint = 14914404;
        
        private const TIER_3_COLOR:uint = 10921638;
        
        private const TIER_4_COLOR:uint = 8060927;
        
        private const TIER_5_COLOR:uint = 15573775;
        
        private var tierColorArray:Array;
        
        private var waveNumColor:uint = 16503487;
        
        private var waveNumGlow:GlowFilter;
        
        private var waveIconColor:Color;
        
        private const DISPLAY_TIME_BASE:int = 1;
        
        public var currentObjectiveColor:uint = 15534080;
        
        private const PRIORITY_COLOR:uint = 15534080;
        
        private const DEFAULT_COLOR:uint = 16503487;
        
        private const BLACK_COLOR:uint = 0;
        
        private const BONUS_COLOR:uint = 15573775;
        
        public var currentCountdownTime:int = 0;
        
        public var priorityTimeline:TimelineMax;
        
        public var objectiveTimeline:TimelineMax;
        
        public var objectiveTransitionTimeline:TimelineMax;
        
        public var objectiveCloseTimeline:TimelineMax;
        
        public var secondaryTimeline:TimelineMax;
        
        public var waveNumberTimeline:TimelineMax;
        
        public var waveTypeTimeline:TimelineMax;
        
        public var waveCloseTimeline:TimelineMax;
        
        public var fadeOutAnimation:TweenMax;
        
        public function PriorityMsgWidget()
        {
            this._msgFadeTimer = new Timer(1000,1);
            this.waveIconColor = new Color();
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
            this.waveNumberTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.waveTypeTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.waveCloseTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            super();
            _enableInitCallback = true;
            this._msgFadeTimer.addEventListener(TimerEvent.TIMER,this.onPriorityMessageFinished);
            visible = false;
            this.tierColorArray = [this.TIER_1_COLOR,this.TIER_2_COLOR,this.TIER_3_COLOR,this.TIER_4_COLOR,this.TIER_5_COLOR];
            this.waveNumGlow = new GlowFilter(this.waveNumColor,1,8,8,1,3,false,false);
            TweenPlugin.activate([ColorTransformPlugin]);
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            TextFieldEx.setTextAutoSize(this.objectiveDescTextfield,"shrink");
            TextFieldEx.setTextAutoSize(this.waveNumberTextfield,"shrink");
            TextFieldEx.setVerticalAlign(this.waveNumberTextfield,"center");
            this.makePriorityTimeline();
            this.makeObjectiveTimeline();
            this.makeSecondaryTimeline();
            this.makeWaveNumberTimeline();
            this.makeWaveTypeTimeline();
            this.makeWaveCloseTimeline();
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
            this.objectiveXPRewardTextfield.text = !!param1.xpBonus ? param1.xpBonus : "";
            this.objectiveVoshRewardTextfield.text = !!param1.voshBonus ? param1.voshBonus : "";
            this.objectiveDescTextfield.text = !!param1.descString ? param1.descString : "Defend the marked waypoint";
            this.objectiveRequireTextfield.text = !!param1.requireString ? param1.requireString : "";
            this.objectiveIcon.source = !!param1.iconPath ? param1.iconPath : "";
            this.currentObjectiveColor = !!param1.isBonus ? uint(this.BONUS_COLOR) : uint(this.PRIORITY_COLOR);
            TweenMax.allTo([this.objectiveMainBumper,this.objectiveSideBumper,this.objectiveRewardLine],0,{
                "tint":this.currentObjectiveColor,
                "tintAmount":1,
                "useFrames":true
            });
            this.objectiveNameTextfield.y = !!param1.isBonus ? Number(this.OBJECTIVE_NAME_BONUS_Y) : Number(this.OBJECTIVE_NAME_DEFAULT_Y);
            this._msgFadeTimer.reset();
            if(visible && !this.fadeOutAnimation.isActive())
            {
                if(this.secondaryTextfield.text != "" && this.secondaryTimeline.progress() != 1)
                {
                    this.secondaryTimeline.eventCallback("onComplete",this.objectiveTimeline.play,[0]);
                }
                else if(this.priorityTextfield.text != "" && this.priorityTimeline.progress() != 1)
                {
                    this.priorityTimeline.eventCallback("onComplete",this.objectiveTimeline.play,[0]);
                }
                else if(this.priorityTextfield.text != "" || this.secondaryTextfield.text != "")
                {
                    this.objectiveTimeline.play(0);
                }
                else
                {
                    this.resetAllAssets(true);
                    TweenMax.to(this,this.ANIMATION_DEFAULT_TIMING,{
                        "autoAlpha":0.88,
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
                    "autoAlpha":0.88,
                    "ease":Cubic.easeOut,
                    "useFrames":true,
                    "onComplete":this.objectiveTimeline.play,
                    "onCompleteParams":["start"]
                });
            }
            this.objectiveTimeline.eventCallback("onComplete",this.setDisplayTime,[this.currentCountdownTime + this.DISPLAY_TIME_BASE]);
        }
        
        public function set waveNumberMessage(param1:Object) : void
        {
            this.waveNumberTextfield.text = !!param1.waveNum ? param1.waveNum : "";
            this.waveTitleTextfield.text = !!param1.waveString ? param1.waveString : "";
            this.waveNumColor = this.tierColorArray[!!param1.waveTier ? param1.waveTier - 1 : 0];
            this.waveNumberLeftFrame.gotoAndStop(!!param1.waveTier ? param1.waveTier : 1);
            this.waveNumberRightFrame.gotoAndStop(!!param1.waveTier ? param1.waveTier : 1);
            this.waveTypeString = !!param1.waveType ? param1.waveType : "";
            this.waveTypeImage.source = !!param1.waveImage ? param1.waveImage : "";
            this.waveTypeImage.alpha = 0;
            this.waveNumberTextfield.y = this.waveNumberTextfield.text.length > 2 ? Number(this.WAVE_NUM_START_Y) : Number(this.WAVE_NUM_START_Y - 1);
            this.waveNumberTextfield.textColor = this.waveNumColor;
            this.waveNumGlow.color = this.waveNumColor;
            this.waveNumberTextfield.filters = [this.waveNumGlow];
            this.waveNumberTextfield.x = this.waveNumberTextfield.text.charAt(0) == "1" ? Number(this.WAVE_NUM_X - this.WAVE_X_OFFSET) : Number(this.WAVE_NUM_X);
            this.waveIconColor.setTint(this.waveNumColor,1);
            this.waveTypeImage.transform.colorTransform = this.waveIconColor;
            this.waveTypeImage.filters = [this.waveNumGlow];
            this._msgFadeTimer.reset();
            if(visible && !this.fadeOutAnimation.isActive())
            {
                if(this.priorityTextfield.text != "" || this.objectiveTitleTextfield.text != "")
                {
                    this.waveNumberTimeline.play(0);
                }
                else
                {
                    this.resetAllAssets(false,true);
                    TweenMax.to(this,this.ANIMATION_DEFAULT_TIMING,{
                        "autoAlpha":0.88,
                        "ease":Cubic.easeOut,
                        "useFrames":true,
                        "onComplete":this.waveNumberTimeline.play,
                        "onCompleteParams":[0]
                    });
                }
            }
            else
            {
                this.currentCountdownTime = !!param1.displayTime ? int(param1.displayTime) : 4;
                this.resetAllAssets(false,true);
                TweenMax.to(this,this.ANIMATION_DEFAULT_TIMING,{
                    "autoAlpha":0.88,
                    "ease":Cubic.easeOut,
                    "useFrames":true,
                    "onComplete":this.waveNumberTimeline.play,
                    "onCompleteParams":[0]
                });
            }
            if(this.waveTypeString != "")
            {
                this.waveNumberTimeline.eventCallback("onComplete",this.waveTypeTimeline.play,[0]);
                this.waveTypeTimeline.eventCallback("onComplete",this.setDisplayTime,[this.currentCountdownTime]);
            }
            else
            {
                this.waveNumberTimeline.eventCallback("onComplete",this.setDisplayTime,[this.currentCountdownTime]);
            }
        }
        
        public function makePriorityTimeline() : void
        {
            this.priorityTimeline.addLabel("start");
            this.priorityTimeline.append(TweenMax.fromTo(this.priorityBlackBG,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":0.64,
                "ease":Cubic.easeInOut,
                "repeat":4,
                "yoyo":true
            }),"start");
            this.priorityTimeline.append(TweenMax.fromTo(this.priorityColorBG,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":0.16,
                "ease":Cubic.easeInOut,
                "repeat":4,
                "yoyo":true
            }),"start");
            this.priorityTimeline.append(TweenMax.fromTo(this.priorityScanlines,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":0.48,
                "ease":Cubic.easeInOut,
                "repeat":4,
                "yoyo":true
            }),"start");
            this.priorityTimeline.append(TweenMax.allFromTo([this.priorityLeftBumper,this.priorityRightBumper],this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeInOut,
                "repeat":4,
                "yoyo":true
            }),"start");
            this.priorityTimeline.addLabel("endBlink");
            this.priorityTimeline.append(TweenMax.allTo([this.priorityScanlines,this.priorityLeftBumper,this.priorityRightBumper,this.priorityBlackBG,this.priorityColorBG],this.ANIMATION_DEFAULT_TIMING,{
                "width":this.BG_TARGET_Y,
                "height":this.BG_TARGET_Y,
                "ease":Cubic.easeInOut
            }));
            this.priorityTimeline.fromTo(this.priorityDivider,0,{"alpha":0},{"alpha":1});
            this.priorityTimeline.addLabel("endShrink");
            this.priorityTimeline.append(TweenMax.allTo([this.priorityScanlines,this.priorityBlackBG,this.priorityColorBG],this.ANIMATION_DEFAULT_TIMING,{
                "width":this.BG_TARGET_X,
                "ease":Cubic.easeOut
            }));
            this.priorityTimeline.fromTo(this.priorityDivider,this.ANIMATION_DEFAULT_TIMING,{"width":this.BG_TARGET_Y},{
                "width":this.SECONDARY_BG_END_WIDTH,
                "ease":Cubic.easeOut
            },"-=" + this.ANIMATION_DEFAULT_TIMING.toString());
            this.priorityTimeline.to(this.priorityLeftBumper,this.ANIMATION_DEFAULT_TIMING,{
                "x":this.BUMPER_OFFSET,
                "ease":Cubic.easeOut
            },this.ANIMATION_DEFAULT_OFFSET_STRING);
            this.priorityTimeline.to(this.priorityRightBumper,this.ANIMATION_DEFAULT_TIMING,{
                "x":this.width - this.BUMPER_OFFSET,
                "ease":Cubic.easeOut
            },this.ANIMATION_DEFAULT_OFFSET_STRING);
            this.priorityTimeline.fromTo(this.priorityTextfield,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeIn
            },"-=2");
            this.priorityTimeline.addLabel("end");
            this.priorityTimeline.call(this.priorityMessageFired);
        }
        
        public function makeObjectiveTimeline() : void
        {
            this.objectiveTimeline.addLabel("start");
            this.objectiveTimeline.append(TweenMax.allFromTo([this.objectiveMainBumper,this.objectiveSideBumper],this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeOut
            }),"start");
            this.objectiveTimeline.append(TweenMax.fromTo(this.objectiveBG,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":0.64,
                "ease":Cubic.easeOut
            }),"start");
            this.objectiveTimeline.append(TweenMax.fromTo(this.objectiveScanlines,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":0.48,
                "ease":Cubic.easeOut
            }),"start");
            this.objectiveTimeline.append(TweenMax.allFromTo([this.objectiveSideBumper,this.objectiveBG,this.objectiveScanlines],this.ANIMATION_DEFAULT_TIMING,{"height":this.OBJECTIVE_BUMPER_START_WIDTH},{
                "height":this.OBJECTIVE_BG_FIRST_HEIGHT,
                "ease":Cubic.easeInOut
            }),"-=1");
            this.objectiveTimeline.append(TweenMax.allFromTo([this.objectiveSideBumper,this.objectiveScanlines,this.objectiveBG],this.ANIMATION_DEFAULT_TIMING,{"width":this.OBJECTIVE_BUMPER_START_WIDTH},{
                "width":this.SECONDARY_BG_END_WIDTH,
                "ease":Cubic.easeInOut
            }));
            this.objectiveTimeline.append(TweenMax.fromTo(this.objectiveTitleTextfield,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":1,
                "repeat":2,
                "yoyo":true
            }));
            this.objectiveTimeline.to(this.objectiveTitleTextfield,this.ANIMATION_DELAY * 2,{});
            this.objectiveTimeline.append(TweenMax.fromTo(this.objectiveTitleTextfield,this.ANIMATION_DEFAULT_TIMING,{"alpha":1},{
                "alpha":0,
                "ease":Cubic.easeIn
            }));
            this.objectiveTimeline.append(TweenMax.allTo([this.objectiveSideBumper,this.objectiveBG,this.objectiveScanlines],this.ANIMATION_DEFAULT_TIMING,{
                "width":this.BG_TARGET_X,
                "ease":Cubic.easeInOut
            }));
            this.objectiveTimeline.append(TweenMax.allTo([this.objectiveSideBumper,this.objectiveBG,this.objectiveScanlines],this.ANIMATION_DEFAULT_TIMING,{
                "height":this.OBJECTIVE_TARGET_HEIGHT,
                "ease":Cubic.easeInOut
            }));
            this.objectiveTimeline.fromTo(this.objectiveMainBumper,this.ANIMATION_DEFAULT_TIMING,{"width":0},{
                "width":this.OBJECTIVE_BUMPER_TARGET_WIDTH,
                "ease":Cubic.easeInOut
            });
            this.objectiveTimeline.append(TweenMax.fromTo(this.objectiveIcon,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":1,
                "repeat":2,
                "yoyo":true
            }));
            this.objectiveTimeline.append(TweenMax.fromTo(this.objectiveNameTextfield,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeIn
            }));
            this.objectiveTimeline.append(TweenMax.fromTo(this.objectiveDescTextfield,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeIn
            }),"-=2");
            this.objectiveTimeline.append(TweenMax.fromTo(this.objectiveRequireTextfield,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeIn
            }),"-=2");
            this.objectiveTimeline.append(TweenMax.fromTo(this.objectiveRewardLine,this.ANIMATION_DEFAULT_TIMING,{
                "alpha":0,
                "height":0
            },{
                "alpha":0.64,
                "height":this.OBJECTIVE_LINE_TARGET_HEIGHT,
                "ease":Cubic.easeOut
            }),"-=2");
            this.objectiveTimeline.append(TweenMax.allFromTo([this.objectiveDoshPlusIcon,this.doshIcon,this.objectiveRewardTextfield],this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeIn
            }),"-=2");
            this.objectiveTimeline.append(TweenMax.allFromTo([this.objectiveXPPlusIcon,this.xpPlusTextfield,this.objectiveXPRewardTextfield],this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeIn
            }),"-=2");
            this.objectiveTimeline.append(TweenMax.allFromTo([this.objectiveVoshPlusIcon,this.voshIcon,this.objectiveVoshRewardTextfield],this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeIn
            }),"-=2");
            this.objectiveCloseTimeline.append(TweenMax.allFromTo([this.objectiveIcon,this.objectiveDoshPlusIcon,this.doshIcon,this.objectiveRewardTextfield,this.objectiveXPPlusIcon,this.xpPlusTextfield,this.objectiveXPRewardTextfield,this.objectiveVoshPlusIcon,this.voshIcon,this.objectiveVoshRewardTextfield,this.objectiveRewardLine,this.objectiveNameTextfield,this.objectiveRequireTextfield,this.objectiveDescTextfield],this.ANIMATION_DEFAULT_TIMING,{"alpha":1},{
                "alpha":0,
                "ease":Cubic.easeOut
            }));
            this.objectiveCloseTimeline.fromTo(this.objectiveMainBumper,this.ANIMATION_DEFAULT_TIMING,{"width":this.OBJECTIVE_BUMPER_TARGET_WIDTH},{
                "width":0,
                "ease":Cubic.easeInOut
            });
            this.objectiveCloseTimeline.append(TweenMax.allFromTo([this.objectiveSideBumper,this.objectiveBG,this.objectiveScanlines],this.ANIMATION_DEFAULT_TIMING,{"width":this.BG_TARGET_X},{
                "width":this.OBJECTIVE_BUMPER_START_WIDTH,
                "ease":Cubic.easeInOut
            }));
            this.objectiveCloseTimeline.append(TweenMax.allFromTo([this.objectiveSideBumper,this.objectiveBG,this.objectiveScanlines],this.ANIMATION_DEFAULT_TIMING,{"height":this.OBJECTIVE_TARGET_HEIGHT},{
                "height":this.OBJECTIVE_BUMPER_START_WIDTH,
                "ease":Cubic.easeInOut
            }));
        }
        
        public function makeSecondaryTimeline() : void
        {
            this.secondaryTimeline.addLabel("start");
            this.secondaryTimeline.append(TweenMax.allFromTo([this.waveNumberBumper,this.waveNumberScanlines],this.ANIMATION_DEFAULT_TIMING,{"height":0},{
                "height":this.SECONDARY_BG_END_HEIGHT,
                "ease":Cubic.easeInOut
            }));
            this.secondaryTimeline.append(TweenMax.fromTo(this.waveNumberBumper,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeInOut
            }),"-=" + this.ANIMATION_DEFAULT_TIMING.toString());
            this.secondaryTimeline.append(TweenMax.fromTo(this.waveNumberScanlines,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":0.48,
                "ease":Cubic.easeInOut
            }),"-=" + this.ANIMATION_DEFAULT_TIMING.toString());
            this.secondaryTimeline.append(TweenMax.allFromTo([this.waveNumberBumper,this.waveNumberScanlines],this.ANIMATION_DEFAULT_TIMING,{"width":this.SECONDARY_BG_START_WIDTH},{
                "width":this.SECONDARY_BG_END_WIDTH - 16,
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
        
        public function makeWaveNumberTimeline() : void
        {
            this.waveNumberTimeline.set(this.waveTypeImage,{
                "visible":false,
                "alpha":0
            });
            this.waveNumberTimeline.to(this.waveNumberBumper,12,{});
            this.waveNumberTimeline.addLabel("start");
            this.waveNumberTimeline.append(TweenMax.fromTo(this.waveNumberScanlines,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":0.48,
                "ease":Cubic.easeInOut
            }));
            this.waveNumberTimeline.append(TweenMax.fromTo(this.waveNumberBumper,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeInOut
            }),"-=" + this.ANIMATION_DEFAULT_TIMING.toString());
            this.waveNumberTimeline.append(TweenMax.allTo([this.waveNumberBumper,this.waveNumberScanlines],this.ANIMATION_DEFAULT_TIMING,{
                "height":this.WAVE_TARGET_HEIGHT,
                "ease":Cubic.easeInOut
            }),"-=" + this.ANIMATION_DEFAULT_TIMING.toString());
            this.waveNumberTimeline.append(TweenMax.allTo([this.waveNumberBumper,this.waveNumberScanlines],this.ANIMATION_DEFAULT_TIMING,{
                "width":this.WAVE_TARGET_WIDTH,
                "ease":Cubic.easeInOut
            }));
            this.waveNumberTimeline.append(TweenMax.fromTo(this.waveNumberLeftFrame,this.ANIMATION_DEFAULT_TIMING,{
                "alpha":0,
                "x":this.WAVE_LEFT_START_X
            },{
                "autoAlpha":1,
                "x":this.WAVE_LEFT_START_X + this.WAVE_FRAME_OFFSET,
                "ease":Cubic.easeOut
            }));
            this.waveNumberTimeline.append(TweenMax.fromTo(this.waveNumberRightFrame,this.ANIMATION_DEFAULT_TIMING,{
                "alpha":0,
                "x":this.WAVE_RIGHT_START_X
            },{
                "autoAlpha":1,
                "x":this.WAVE_RIGHT_START_X - this.WAVE_FRAME_OFFSET,
                "ease":Cubic.easeOut
            }),"-=" + this.ANIMATION_DEFAULT_TIMING.toString());
            this.waveNumberTimeline.append(TweenMax.fromTo(this.waveNumberTextfield,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeInOut,
                "repeat":4,
                "yoyo":true
            }));
            this.waveNumberTimeline.addLabel("end");
        }
        
        public function makeWaveTypeTimeline() : void
        {
            this.waveTypeTimeline.addLabel("start");
            this.waveTypeTimeline.set(this.waveTypeImage,{
                "visible":true,
                "alpha":0
            });
            this.waveTypeTimeline.to(this,45,{});
            this.waveTypeTimeline.append(TweenMax.allTo([this.priorityTextfield,this.waveNumberTextfield,this.waveNumberLeftFrame,this.waveNumberRightFrame],this.ANIMATION_DEFAULT_TIMING,{
                "alpha":0,
                "ease":Cubic.easeOut
            }));
            this.waveTypeTimeline.append(TweenMax.allTo([this.waveNumberBumper,this.waveNumberScanlines],this.ANIMATION_DEFAULT_TIMING,{
                "width":this.WAVE_TYPE_WIDTH,
                "ease":Cubic.easeOut
            }));
            this.waveTypeTimeline.call(this.assignWaveTypeString,[this.waveTypeString]);
            this.waveTypeTimeline.append(TweenMax.fromTo(this.priorityTextfield,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeInOut,
                "repeat":4,
                "yoyo":true
            }));
            this.waveTypeTimeline.append(TweenMax.fromTo(this.waveNumberLeftFrame,this.ANIMATION_DEFAULT_TIMING,{
                "alpha":0,
                "x":this.WAVE_LEFT_START_X - this.WAVE_FRAME_OFFSET
            },{
                "autoAlpha":1,
                "x":this.WAVE_LEFT_START_X,
                "ease":Cubic.easeOut
            }));
            this.waveTypeTimeline.append(TweenMax.fromTo(this.waveNumberRightFrame,this.ANIMATION_DEFAULT_TIMING,{
                "alpha":0,
                "x":this.WAVE_RIGHT_START_X + this.WAVE_FRAME_OFFSET
            },{
                "autoAlpha":1,
                "x":this.WAVE_RIGHT_START_X,
                "ease":Cubic.easeOut
            }),"-=" + this.ANIMATION_DEFAULT_TIMING.toString());
            this.waveTypeTimeline.append(TweenMax.fromTo(this.waveTypeImage,this.ANIMATION_DEFAULT_TIMING,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeInOut,
                "repeat":4,
                "yoyo":true
            }));
        }
        
        public function makeWaveCloseTimeline() : void
        {
            this.waveCloseTimeline.append(TweenMax.allFromTo([this.waveTypeImage,this.waveNumberTextfield,this.waveNumberLeftFrame,this.waveNumberRightFrame],this.ANIMATION_DEFAULT_TIMING,{"alpha":1},{
                "alpha":0,
                "ease":Cubic.easeOut
            }));
            this.waveCloseTimeline.append(TweenMax.allTo([this.waveNumberScanlines,this.waveNumberBumper],this.ANIMATION_DEFAULT_TIMING,{
                "width":this.WAVE_START_SIZE,
                "ease":Cubic.easeOut
            }));
            this.waveCloseTimeline.append(TweenMax.allTo([this.waveNumberScanlines,this.waveNumberBumper],this.ANIMATION_DEFAULT_TIMING,{
                "height":this.WAVE_START_SIZE,
                "ease":Cubic.easeOut
            }));
            this.waveCloseTimeline.append(TweenMax.allTo([this.waveNumberScanlines,this.waveNumberBumper],this.ANIMATION_DEFAULT_TIMING,{
                "alpha":0,
                "ease":Cubic.easeOut
            }),"-=" + this.ANIMATION_DEFAULT_TIMING.toString());
        }
        
        public function resetAllAssets(param1:Boolean = false, param2:Boolean = false) : void
        {
            this._msgFadeTimer.stop();
            this.fadeOutAnimation.pause(0);
            this.secondaryTimeline.pause(0);
            this.objectiveTransitionTimeline.pause(0);
            this.objectiveTimeline.pause(0);
            this.objectiveCloseTimeline.pause(0);
            this.waveNumberTimeline.pause(0);
            this.waveTypeTimeline.pause(0);
            this.waveCloseTimeline.pause(0);
            this.priorityTimeline.pause(0);
            this.priorityTimeline.eventCallback("onComplete",null);
            this.secondaryTimeline.eventCallback("onComplete",null);
            this.objectiveTimeline.eventCallback("onComplete",null);
            this.waveNumberTimeline.eventCallback("onComplete",null);
            this.waveTypeTimeline.eventCallback("onComplete",null);
            this.priorityTextfield.text = this.secondaryTextfield.text = "";
            this.objectiveMainBumper.alpha = this.objectiveSideBumper.alpha = this.objectiveRewardLine.alpha = this.objectiveScanlines.alpha = 0;
            this.priorityLeftBumper.alpha = this.priorityRightBumper.alpha = this.priorityDivider.alpha = 0;
            this.priorityBlackBG.alpha = 0;
            this.priorityColorBG.alpha = 0;
            this.priorityScanlines.alpha = 0;
            this.priorityTextfield.alpha = this.secondaryTextfield.alpha = 0;
            this.objectiveTitleTextfield.alpha = this.objectiveIcon.alpha = this.objectiveNameTextfield.alpha = this.objectiveDoshPlusIcon.alpha = 0;
            this.doshIcon.alpha = this.objectiveRewardTextfield.alpha = this.objectiveDescTextfield.alpha = this.objectiveRequireTextfield.alpha = 0;
            this.voshIcon.alpha = this.objectiveVoshRewardTextfield.alpha = this.objectiveVoshPlusIcon.alpha = 0;
            this.objectiveXPPlusIcon.alpha = this.xpPlusTextfield.alpha = this.objectiveXPRewardTextfield.alpha = 0;
            this.waveNumberBumper.alpha = this.waveNumberLeftFrame.alpha = this.waveNumberRightFrame.alpha = this.waveNumberScanlines.alpha = 0;
            this.waveNumberTextfield.alpha = this.waveTitleTextfield.alpha = 0;
            this.waveNumberLeftFrame.visible = this.waveNumberRightFrame.visible = false;
            this.waveTypeImage.alpha = 0;
            this.priorityScanlines.y = this.priorityBlackBG.y = this.priorityColorBG.y = this.MIDPOINT_Y;
            this.priorityLeftBumper.width = this.priorityLeftBumper.height = this.priorityRightBumper.width = this.priorityRightBumper.height = this.BG_START_SIZE;
            this.priorityScanlines.width = this.priorityScanlines.height = this.BG_START_SIZE;
            this.priorityBlackBG.width = this.priorityBlackBG.height = this.priorityColorBG.width = this.priorityColorBG.height = this.BG_START_SIZE;
            this.priorityLeftBumper.x = this.priorityRightBumper.x = this.priorityScanlines.x = this.priorityBlackBG.x = this.priorityColorBG.x = this.MIDPOINT_X;
            this.priorityLeftBumper.y = this.priorityRightBumper.y = this.MIDPOINT_Y;
            this.objectiveMainBumper.width = 0;
            this.objectiveSideBumper.width = this.objectiveSideBumper.height = this.OBJECTIVE_BUMPER_START_WIDTH;
            this.objectiveBG.width = this.objectiveBG.height = this.objectiveScanlines.width = this.objectiveScanlines.height = this.OBJECTIVE_BUMPER_START_WIDTH;
            this.waveNumberScanlines.width = this.waveNumberScanlines.height = this.waveNumberBumper.width = this.waveNumberBumper.height = this.WAVE_START_SIZE;
            this.waveNumberLeftFrame.x = this.WAVE_LEFT_START_X;
            this.waveNumberRightFrame.x = this.WAVE_RIGHT_START_X;
            if(param2 == false)
            {
                this.waveNumberTextfield.text = this.waveTitleTextfield.text = "";
            }
            if(param1 == false)
            {
                this.objectiveNameTextfield.text = this.objectiveTitleTextfield.text = this.objectiveRewardTextfield.text = this.objectiveDescTextfield.text = this.objectiveRequireTextfield.text = "";
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
        
        public function assignWaveTypeString() : void
        {
            this.priorityTextfield.text = this.waveTypeString;
            this.waveNumberTextfield.text = "";
        }
        
        private function onPriorityMessageFinished(param1:TimerEvent) : *
        {
            if(this.secondaryTextfield.text != "")
            {
                this.secondaryTimeline.tweenFromTo("end","start");
            }
            if(this.objectiveTitleTextfield.text != "")
            {
                this.objectiveCloseTimeline.play(0);
            }
            if(this.waveTitleTextfield.text != "")
            {
                this.waveCloseTimeline.play(0);
            }
            if(this.priorityTextfield.text != "")
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
