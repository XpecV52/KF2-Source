package tripwire.menus
{
    import com.greensock.TimelineMax;
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import com.greensock.easing.Power0;
    import com.greensock.plugins.GlowFilterPlugin;
    import com.greensock.plugins.HexColorsPlugin;
    import com.greensock.plugins.TweenPlugin;
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import flash.ui.Keyboard;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.gfx.Extensions;
    import scaleform.gfx.FocusManager;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripUILoader;
    
    public class DoshVaultMenu extends TripContainer
    {
         
        
        public var nextRewardTitleTextfield:TextField;
        
        public var nextRewardNameTextfield:TextField;
        
        public var nextDoshAmountTextfield:TextField;
        
        public var storedCrateTitleTextfield:TextField;
        
        public var crateWarningTextField:TextField;
        
        public var storedCratesString:String;
        
        public var crateIconLoader:TripUILoader;
        
        public var openCrateButton:TripButton;
        
        public var header:MovieClip;
        
        public var bar:MovieClip;
        
        public var yourDoshContainer:MovieClip;
        
        public var nextDoshAmountIcon:MovieClip;
        
        public var crateUnlockedContainer:MovieClip;
        
        public var doshLoop:int;
        
        public var doshNumColorObj:Object;
        
        public var doshBarColor:Color;
        
        public var doshIconColor:Color;
        
        public const defaultDoshTextColor:uint = 14538703;
        
        public const defaultDoshBarColor:uint = 4836490;
        
        public const specialDoshColor:uint = 15573775;
        
        public var doshCounter:int;
        
        public var oldDoshNum:int;
        
        public var newDoshNum:int;
        
        public var currentTierBase:int;
        
        public var currentTierLength:int;
        
        public var nextTierBase:int;
        
        public var storedCrates:int;
        
        private const BAR_FULL_HEIGHT:int = 576;
        
        private const TIMELINE_DURATION:int = 120;
        
        private const TIMELINE_PAUSE:int = 20;
        
        private const NEXT_TIER_ICON_START_X:Number = 82.5;
        
        private const NEXT_TIER_NUM_START_X:Number = 100.8;
        
        private const NEXT_TIER_OFFSET_X:int = 80;
        
        private const CRATE_CONTAINER_START_X:int = 912;
        
        private const GLOW_BLUR:int = 8;
        
        public var doshBarFillSoundEffect:String = "";
        
        public var nextTierReachedSoundEffect:String = "";
        
        public var crateUnlockedSoundEffect:String = "";
        
        public var doshTimeline:TimelineMax;
        
        public var crateUnlockedTimeline:TimelineMax;
        
        public var bSeenFullAnimation:Boolean = false;
        
        public function DoshVaultMenu()
        {
            this.doshNumColorObj = {"doshColor":14538703};
            this.doshBarColor = new Color();
            this.doshIconColor = new Color();
            this.doshTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true,
                "onComplete":this.doshComplete
            });
            this.crateUnlockedTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            super();
            TweenPlugin.activate([GlowFilterPlugin]);
            TweenPlugin.activate([HexColorsPlugin]);
        }
        
        override public function openContainer(param1:Boolean = true) : void
        {
            super.openContainer();
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            if(!this.bSeenFullAnimation)
            {
                this.resetTimeline();
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.openCrateButton.addEventListener(ButtonEvent.PRESS,this.openCrateClicked,false,0,true);
            this.crateUnlockedContainer.visible = false;
            this.openCrateButton.visible = false;
            this.storedCrateTitleTextfield.visible = false;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.header.textField.text = !!param1.titleString ? param1.titleString : "";
            this.nextRewardTitleTextfield.text = !!param1.nextReward ? param1.nextReward : "";
            this.nextRewardNameTextfield.text = !!param1.nextUnlock ? param1.nextUnlock : "";
            this.yourDoshContainer.yourDoshTitleTextfield.text = !!param1.yourDosh ? param1.yourDosh : "";
            this.storedCratesString = !!param1.yourCrates ? param1.yourCrates : "";
            this.openCrateButton.label = !!param1.openCrate ? param1.openCrate : "";
            this.crateIconLoader.source = !!param1.iconLocation ? param1.iconLocation : "";
            this.crateUnlockedContainer.crateIconLoader.source = !!param1.iconLocation ? param1.iconLocation : "";
            this.crateUnlockedContainer.crateUnlockedTextfield.text = !!param1.crateUnlocked ? param1.crateUnlocked : "";
            this.crateUnlockedContainer.crateDelayTextfield.text = "";
            this.crateWarningTextField.text = !!param1.crateDelayed ? param1.crateDelayed : "";
            this.makeCrateUnlockedTimeline();
        }
        
        public function set storedCratesValue(param1:int) : void
        {
            this.openCrateButton.enabled = param1 > 0;
            this.storedCrateTitleTextfield.text = this.storedCrateTitleTextfield.text = this.storedCratesString + " " + param1.toString();
            if(bManagerUsingGamepad && param1 > 0)
            {
                FocusManager.setModalClip(this.openCrateButton);
            }
        }
        
        public function set doshData(param1:Object) : void
        {
            this.oldDoshNum = !!param1.oldDosh ? int(param1.oldDosh) : 0;
            this.newDoshNum = !!param1.newDosh ? int(param1.newDosh) : 0;
            this.currentTierBase = !!param1.tierBase ? int(param1.tierBase) : 0;
            this.currentTierLength = !!param1.tierLength ? int(param1.tierLength) : 0;
            this.storedCrates = !!param1.crateNum ? int(param1.crateNum) : 0;
            this.nextTierBase = this.currentTierBase + this.currentTierLength;
            this.storedCratesValue = this.storedCrates;
            this.makeDoshTimeline();
        }
        
        public function makeCrateUnlockedTimeline() : void
        {
            this.crateUnlockedTimeline.stop();
            this.crateUnlockedTimeline.clear();
            this.crateUnlockedTimeline.fromTo(this.doshNumColorObj,5,{"hexColors":{"doshColor":this.defaultDoshTextColor}},{
                "hexColors":{"doshColor":this.specialDoshColor},
                "ease":Cubic.easeOut,
                "onUpdate":this.applyDoshColor,
                "onStart":this.playSound,
                "onStartParams":[this.nextTierReachedSoundEffect]
            });
            this.crateUnlockedTimeline.fromTo(this.nextDoshAmountIcon,10,{
                "alpha":1,
                "x":this.NEXT_TIER_ICON_START_X
            },{
                "alpha":0,
                "x":this.NEXT_TIER_ICON_START_X + this.NEXT_TIER_OFFSET_X,
                "visible":false,
                "ease":Cubic.easeOut
            });
            this.crateUnlockedTimeline.fromTo(this.nextDoshAmountTextfield,10,{
                "alpha":1,
                "x":this.NEXT_TIER_NUM_START_X
            },{
                "alpha":0,
                "x":this.NEXT_TIER_NUM_START_X + this.NEXT_TIER_OFFSET_X,
                "visible":false,
                "ease":Cubic.easeOut
            },"-=10");
            this.crateUnlockedTimeline.fromTo(this.crateUnlockedContainer,20,{
                "alpha":0,
                "x":this.CRATE_CONTAINER_START_X - this.NEXT_TIER_OFFSET_X
            },{
                "autoAlpha":1,
                "x":this.CRATE_CONTAINER_START_X,
                "ease":Cubic.easeOut,
                "onStart":this.playSound,
                "onStartParams":[this.crateUnlockedSoundEffect]
            },"-=10");
            this.crateUnlockedTimeline.call(this.updateDoshValues);
            this.crateUnlockedTimeline.to(this.doshNumColorObj,10,{
                "doshColor":this.defaultDoshTextColor,
                "onUpdate":this.applyDoshColor
            });
            this.crateUnlockedTimeline.set(this.nextDoshAmountIcon,{"x":this.NEXT_TIER_ICON_START_X});
            this.crateUnlockedTimeline.set(this.nextDoshAmountTextfield,{"x":this.NEXT_TIER_NUM_START_X});
            this.crateUnlockedTimeline.to(this.crateUnlockedContainer,10,{
                "alpha":0,
                "x":this.CRATE_CONTAINER_START_X + this.NEXT_TIER_OFFSET_X,
                "ease":Cubic.easeOut
            });
            this.crateUnlockedTimeline.append(TweenMax.allFromTo([this.nextDoshAmountIcon,this.nextDoshAmountTextfield],10,{"alpha":0},{
                "autoAlpha":1,
                "ease":Cubic.easeOut,
                "immediateRender":false
            }),"-=10");
        }
        
        public function makeDoshTimeline() : void
        {
            var _loc1_:Number = (this.oldDoshNum - this.currentTierBase) / (this.nextTierBase - this.currentTierBase);
            var _loc2_:Number = this.newDoshNum < this.nextTierBase ? Number((this.newDoshNum - this.currentTierBase) / (this.nextTierBase - this.currentTierBase)) : Number(1);
            this.doshCounter = this.currentTierBase;
            this.changeDoshNumber();
            this.nextDoshAmountTextfield.text = String(this.nextTierBase);
            this.doshTimeline.stop();
            this.doshTimeline.clear();
            this.doshTimeline.to(this.bar,0,{"height":0});
            this.doshTimeline.to(this.yourDoshContainer,0,{"y":this.bar.y});
            this.doshTimeline.to(this.bar,this.TIMELINE_DURATION,{
                "height":this.BAR_FULL_HEIGHT,
                "ease":Power0.easeNone
            });
            this.doshTimeline.to(this.yourDoshContainer,this.TIMELINE_DURATION,{
                "y":this.bar.y - this.BAR_FULL_HEIGHT,
                "ease":Power0.easeNone
            },"-=" + String(this.TIMELINE_DURATION));
            this.doshTimeline.to(this,this.TIMELINE_DURATION,{
                "doshCounter":this.nextTierBase,
                "onUpdate":this.changeDoshNumber,
                "ease":Power0.easeNone
            },"-=" + String(this.TIMELINE_DURATION));
            if(this.newDoshNum == this.currentTierBase)
            {
                this.bar.height = 0;
                this.yourDoshContainer.y = this.bar.y;
                this.finalizeAnimation();
            }
            else
            {
                this.doshTimeline.progress(_loc1_);
                this.playSound(this.doshBarFillSoundEffect);
                if(_loc2_ < 1)
                {
                    ExternalInterface.call("Callback_AnimationBegin");
                    this.doshTimeline.tweenTo(this.doshTimeline.duration() * _loc2_,{
                        "ease":Cubic.easeInOut,
                        "onComplete":this.finalizeAnimation
                    });
                }
                else
                {
                    ExternalInterface.call("Callback_AnimationBegin");
                    this.doshTimeline.tweenTo(this.doshTimeline.duration() * _loc2_,{"ease":Cubic.easeInOut});
                }
            }
            this.doshBarColor.setTint(this.defaultDoshBarColor,1);
            this.bar.transform.colorTransform = this.doshBarColor;
        }
        
        public function playSound(param1:String) : void
        {
            if(!Extensions.enabled)
            {
            }
        }
        
        public function openCrateClicked(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_OpenCrateClicked");
        }
        
        public function finalizeAnimation() : void
        {
            this.bSeenFullAnimation = true;
            ExternalInterface.call("Callback_FinalAnimationComplete");
        }
        
        public function changeDoshNumber() : void
        {
            this.yourDoshContainer.yourDoshAmountTextfield.text = String(this.doshCounter);
            ExternalInterface.call("Callback_UpdateDosh",this.doshCounter);
        }
        
        public function doshComplete() : void
        {
            ExternalInterface.call("Callback_DoshAnimationComplete");
            this.doshBarColor.setTint(this.specialDoshColor,1);
            this.bar.transform.colorTransform = this.doshBarColor;
            this.crateUnlockedTimeline.play(0);
        }
        
        public function updateDoshValues() : void
        {
            var _loc1_:Object = {
                "oldDosh":this.nextTierBase,
                "newDosh":this.newDoshNum,
                "tierBase":this.currentTierBase + this.currentTierLength,
                "tierLength":this.currentTierLength,
                "crateNum":this.storedCrates
            };
            this.doshData = _loc1_;
        }
        
        public function applyDoshColor() : void
        {
            this.nextDoshAmountTextfield.textColor = this.doshNumColorObj.doshColor;
            this.doshIconColor.setTint(this.doshNumColorObj.doshColor,1);
            this.nextDoshAmountIcon.transform.colorTransform = this.doshIconColor;
        }
        
        public function resetTimeline() : void
        {
            this.crateUnlockedTimeline.stop();
            this.crateUnlockedTimeline.seek(0);
            this.doshTimeline.stop();
            this.doshTimeline.clear();
        }
        
        public function testMeter(param1:KeyboardEvent) : void
        {
            var _loc2_:Object = null;
            var _loc3_:Object = null;
            var _loc4_:Object = null;
            var _loc5_:Object = null;
            if(param1.keyCode == Keyboard.Q)
            {
                _loc2_ = {
                    "title":"DOSH VAULT",
                    "nextRewardTitle":"NEXT REWARD",
                    "nextRewardName":"TIER 1 CRATE",
                    "yourDoshTitle":"YOUR DOSH",
                    "storedCrateTitle":"CRATES IN INVENTORY:",
                    "openCrateLabel":"OPEN CRATE"
                };
                this.localizedText = _loc2_;
            }
            if(param1.keyCode == Keyboard.U)
            {
                _loc3_ = {
                    "oldDosh":15000,
                    "newDosh":48000,
                    "tierBase":10000,
                    "tierLength":10000
                };
                this.makeCrateUnlockedTimeline();
                this.doshData = _loc3_;
            }
            if(param1.keyCode == Keyboard.Y)
            {
                _loc4_ = {
                    "oldDosh":15000,
                    "newDosh":18000,
                    "tierBase":10000,
                    "tierLength":10000
                };
                this.doshData = _loc4_;
            }
            if(param1.keyCode == Keyboard.T)
            {
                _loc5_ = {
                    "oldDosh":0,
                    "newDosh":500000,
                    "tierBase":0,
                    "tierLength":500000
                };
                this.makeCrateUnlockedTimeline();
                this.doshData = _loc5_;
            }
        }
    }
}
