package tripwire.containers.Perks
{
    import com.greensock.TimelineMax;
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import com.greensock.easing.Power4;
    import com.greensock.plugins.TweenPlugin;
    import com.greensock.plugins.VisiblePlugin;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.gfx.TextFieldEx;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripUILoaderQueue;
    import tripwire.controls.TripUIPerkLoader;
    
    public class PrestigeContainer extends PerkContainerBase
    {
         
        
        public var titleTextfield:TextField;
        
        public var currRankTitleTextfield:TextField;
        
        public var nextRankTextfield:TextField;
        
        public var rewardsTextfield:TextField;
        
        public var prestigeDescriptionTextfield:TextField;
        
        public var warningLine1Textfield:TextField;
        
        public var warningLine2Textfield:TextField;
        
        public var warningLine3Textfield:TextField;
        
        public var atMaxRankTextfield:TextField;
        
        public var doshTextField:TextField;
        
        public var currRankIcon:TripUIPerkLoader;
        
        public var nextRankIcon:TripUIPerkLoader;
        
        public var rewardIcon:TripUILoaderQueue;
        
        public var vaultDoshBG:MovieClip;
        
        public var closeButton:TripButton;
        
        public var cancelButton:TripButton;
        
        public var confirmButton:TripButton;
        
        public var warningIcon1:MovieClip;
        
        public var warningIcon2:MovieClip;
        
        public var warningIcon3:MovieClip;
        
        public var rewardBackgroundMC:MovieClip;
        
        public var maxLevelWarning:MovieClip;
        
        public var rewardDecorMC:MovieClip;
        
        public var bg:MovieClip;
        
        public const DEFAULT_PERK_LOC:int = 136;
        
        public const DEFAULT_PERK_SIZE:int = 144;
        
        public const MAX_PRESTIGE_X:int = 296;
        
        public const MAX_PRESTIGE_Y:int = 160;
        
        public const MAX_PRESTIGE_SIZE:int = 384;
        
        public const MAX_PERK_X:int = 368;
        
        public const MAX_PERK_Y:int = 208;
        
        public const MAX_PERK_SIZE:int = 240;
        
        public var animPerkName:String = "";
        
        public var animPrestigeName:String = "";
        
        public var animNextPrestigeName:String = "";
        
        public var prestigeSoundPlay:String = "PERK_PRESTIGE_PLAY_LVL_RESET";
        
        public var bIsMaxLevel:Boolean = false;
        
        public var animPerkIcon:TripUILoaderQueue;
        
        public var animPrestigeIcon:TripUILoaderQueue;
        
        public var prestigeTimeline:TimelineMax;
        
        public function PrestigeContainer()
        {
            this.prestigeTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            super();
            ANIM_OFFSET_X = 0;
            defaultFirstElement = this.confirmButton;
            TweenPlugin.activate([VisiblePlugin]);
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.titleTextfield.text = !!param1.prestige ? param1.prestige : "";
                this.currRankTitleTextfield.text = !!param1.currentRank ? param1.currentRank : "";
                this.nextRankTextfield.text = !!param1.nextRank ? param1.nextRank : "";
                this.rewardsTextfield.text = !!param1.rewards ? param1.rewards : "";
                this.prestigeDescriptionTextfield.text = !!param1.description ? param1.description : "";
                this.cancelButton.label = !!param1.cancel ? param1.cancel : "";
                this.confirmButton.label = !!param1.confirm ? param1.confirm : "";
                this.warningLine1Textfield.text = !!param1.warning1 ? param1.warning1 : "";
                this.warningLine2Textfield.text = !!param1.warning2 ? param1.warning2 : "";
                this.warningLine3Textfield.text = !!param1.warning3 ? param1.warning3 : "";
                this.atMaxRankTextfield.text = !!param1.atMaxRank ? param1.atMaxRank : "";
                TextFieldEx.setVerticalAlign(this.warningLine1Textfield,"center");
                TextFieldEx.setVerticalAlign(this.warningLine2Textfield,"center");
                TextFieldEx.setVerticalAlign(this.warningLine3Textfield,"center");
                TextFieldEx.setVerticalAlign(this.atMaxRankTextfield,"center");
            }
        }
        
        public function set perkData(param1:Object) : void
        {
            if(param1)
            {
                this.prestigeTimeline.pause("start");
                this.resetAnimIcons();
                if(param1.currentRank)
                {
                    this.currRankIcon.visible = true;
                    this.currRankIcon.data = param1.currentRank;
                    this.animData = param1.currentRank;
                }
                else
                {
                    this.currRankIcon.visible = false;
                }
                if(param1.nextRank)
                {
                    this.nextRankIcon.visible = true;
                    this.nextRankIcon.data = param1.nextRank;
                    this.animNextPrestigeName = param1.nextRank.prestigeIcon;
                }
                else
                {
                    this.nextRankIcon.visible = false;
                }
                if(param1.rewardIcon)
                {
                    this.rewardIcon.visible = true;
                    this.rewardIcon.source = param1.rewardIcon;
                }
                else
                {
                    this.rewardIcon.visible = false;
                }
                if(param1.doshVaultValue)
                {
                    this.doshTextField.text = param1.doshVaultValue;
                    this.vaultDoshBG.visible = param1.doshVaultValue > 0;
                }
                else
                {
                    this.doshTextField.text = "";
                    this.vaultDoshBG.visible = false;
                }
                this.userAtMaxLevel = param1.bAtPrestigeMaxLevel;
            }
        }
        
        public function set animData(param1:Object) : void
        {
            if(param1)
            {
                this.animPerkName = !!param1.perkIcon ? param1.perkIcon : "";
                this.animPrestigeName = !!param1.prestigeIcon ? param1.prestigeIcon : "";
                if(this.animPerkIcon.source == this.animPerkName)
                {
                    this.animPerkIcon.unload();
                }
                this.animPerkIcon.source = this.animPerkName;
                this.animPrestigeIcon.source = this.animPrestigeName;
            }
        }
        
        public function makePrestigeTimeline() : void
        {
            this.prestigeTimeline.addLabel("start");
            this.prestigeTimeline.set(this.animPerkIcon,{
                "x":328,
                "y":144,
                "width":320,
                "height":320,
                "alpha":0,
                "immediateRender":false
            });
            this.prestigeTimeline.set(this.animPrestigeIcon,{
                "x":232,
                "y":80,
                "width":512,
                "height":512,
                "alpha":0,
                "immediateRender":false
            });
            this.prestigeTimeline.add(TweenMax.allFromTo([this.currRankTitleTextfield,this.nextRankTextfield,this.rewardsTextfield,this.doshTextField,this.vaultDoshBG,this.warningLine1Textfield,this.warningLine2Textfield,this.warningLine3Textfield,this.prestigeDescriptionTextfield,this.warningIcon1,this.warningIcon2,this.warningIcon3,this.rewardBackgroundMC,this.rewardDecorMC,this.nextRankIcon,this.maxLevelWarning,this.atMaxRankTextfield,this.confirmButton,this.cancelButton,this.currRankIcon,this.bg,this.titleTextfield,this.rewardIcon],5,{"alpha":1},{
                "alpha":0,
                "ease":Cubic.easeOut,
                "immediateRender":false
            }));
            this.prestigeTimeline.set(this.confirmButton,{
                "visible":false,
                "immediateRender":false
            });
            this.prestigeTimeline.set(this.cancelButton,{
                "visible":false,
                "immediateRender":false
            });
            this.prestigeTimeline.call(this.toggleAnimIcons,[true]);
            this.prestigeTimeline.add(TweenMax.allFromTo([this.animPerkIcon,this.animPrestigeIcon],15,{
                "x":"-256",
                "alpha":0
            },{
                "x":"+256",
                "alpha":1,
                "ease":Cubic.easeOut,
                "immediateRender":false
            }));
            this.prestigeTimeline.add(TweenMax.fromTo(this.animPrestigeIcon,5,{"alpha":1},{
                "alpha":0,
                "ease":Cubic.easeOut,
                "immediateRender":false
            }));
            this.prestigeTimeline.set(this.animPrestigeIcon,{
                "x":104,
                "y":-48,
                "height":768,
                "width":768,
                "immediateRender":false
            });
            this.prestigeTimeline.call(this.swapPrestigeIcon,[],"+=1");
            this.prestigeTimeline.set(this.animPrestigeIcon,{
                "visible":true,
                "alpha":0,
                "immediateRender":false
            });
            this.prestigeTimeline.to(this.animPrestigeIcon,10,{
                "alpha":1,
                "x":232,
                "y":80,
                "height":512,
                "width":512,
                "ease":Power4.easeIn,
                "immediateRender":false
            });
            this.prestigeTimeline.add(TweenMax.allTo([this.animPerkIcon,this.animPrestigeIcon],2,{
                "x":"-4",
                "y":"+4",
                "ease":Cubic.easeOut,
                "immediateRender":false
            }));
            this.prestigeTimeline.add(TweenMax.allTo([this.animPerkIcon,this.animPrestigeIcon],2,{
                "x":"+6",
                "y":"-6",
                "ease":Cubic.easeOut,
                "immediateRender":false
            }));
            this.prestigeTimeline.add(TweenMax.allTo([this.animPerkIcon,this.animPrestigeIcon],2,{
                "x":"-3",
                "y":"+3",
                "ease":Cubic.easeOut,
                "immediateRender":false
            }));
            this.prestigeTimeline.add(TweenMax.allTo([this.animPerkIcon,this.animPrestigeIcon],2,{
                "x":"+1",
                "y":"-1",
                "ease":Cubic.easeOut,
                "immediateRender":false
            }));
            this.prestigeTimeline.to(this,25,{});
            this.prestigeTimeline.add(TweenMax.allFromTo([this.animPerkIcon,this.animPrestigeIcon],10,{"alpha":1},{
                "alpha":0,
                "ease":Cubic.easeOut,
                "immediateRender":false
            }));
            this.prestigeTimeline.addLabel("end");
            this.prestigeTimeline.pause("start");
        }
        
        public function swapPrestigeIcon() : void
        {
            this.animPrestigeIcon.source = this.animNextPrestigeName;
        }
        
        public function toggleAnimIcons(param1:Boolean) : void
        {
            this.animPerkIcon.visible = param1;
            this.animPrestigeIcon.visible = this.animPrestigeName != "" ? Boolean(param1) : false;
        }
        
        public function resetAnimIcons() : void
        {
            this.animPerkName = this.animPrestigeName = this.animNextPrestigeName = "";
            this.animPerkIcon.width = this.animPerkIcon.height = this.MAX_PERK_SIZE;
            this.animPerkIcon.x = this.MAX_PERK_X;
            this.animPerkIcon.y = this.MAX_PERK_Y;
            this.animPrestigeIcon.width = this.animPrestigeIcon.height = this.MAX_PRESTIGE_SIZE;
            this.animPrestigeIcon.x = this.MAX_PRESTIGE_X;
            this.animPrestigeIcon.y = this.MAX_PRESTIGE_Y;
        }
        
        public function get userAtMaxLevel() : Boolean
        {
            return this.bIsMaxLevel;
        }
        
        public function set userAtMaxLevel(param1:Boolean) : void
        {
            this.bIsMaxLevel = param1;
            this.currRankTitleTextfield.visible = !param1;
            this.nextRankTextfield.visible = !param1;
            this.rewardsTextfield.visible = !param1;
            this.doshTextField.visible = !param1;
            this.vaultDoshBG.visible = !param1;
            this.warningLine1Textfield.visible = !param1;
            this.warningLine2Textfield.visible = !param1;
            this.warningLine3Textfield.visible = !param1;
            this.prestigeDescriptionTextfield.visible = !param1;
            this.atMaxRankTextfield.visible = param1;
            this.warningIcon1.visible = !param1;
            this.warningIcon2.visible = !param1;
            this.warningIcon3.visible = !param1;
            this.rewardBackgroundMC.visible = !param1;
            this.rewardDecorMC.visible = !param1;
            this.maxLevelWarning.visible = false;
            this.confirmButton.visible = !param1;
            this.nextRankIcon.visible = !param1;
            this.currRankIcon.visible = !param1;
            this.rewardIcon.visible = !param1;
            this.toggleAnimIcons(param1);
            this.animPerkIcon.alpha = !!param1 ? Number(1) : Number(0);
            this.animPrestigeIcon.alpha = param1 && this.animPrestigeName != "" ? Number(1) : Number(0);
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.cancelButton.visible = !bManagerUsingGamepad;
        }
        
        override public function openContainer(param1:Boolean = true) : void
        {
            this.prestigeTimeline.pause("start");
            super.openContainer(param1);
            this.cancelButton.visible = !bManagerUsingGamepad;
            this.userAtMaxLevel = this.bIsMaxLevel;
            ExternalInterface.call("Callback_PerkResetStateChanged");
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            ExternalInterface.call("Callback_PerkResetStateChanged");
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.cancelButton.addEventListener(ButtonEvent.PRESS,this.onCancelPress,false,0,true);
            this.confirmButton.addEventListener(ButtonEvent.PRESS,this.onConfirmPress,false,0,true);
            visible = false;
            this.makePrestigeTimeline();
        }
        
        public function onConfirmPress(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_ConfirmPerkReset");
        }
        
        public function onCancelPress(param1:ButtonEvent) : void
        {
            this.closeButton.dispatchEvent(new ButtonEvent(ButtonEvent.CLICK));
        }
    }
}
