package tripwire.controls.postGameMenu
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.controls.ListItemRenderer;
    import scaleform.clik.controls.UILoader;
    import scaleform.gfx.Extensions;
    import tripwire.menus.PostGameMenu;
    
    public class PerkXPTileObject extends ListItemRenderer
    {
         
        
        public var perkIconLoader:UILoader;
        
        public var perkNameTextField:TextField;
        
        public var objective1TextField:TextField;
        
        public var objective2TextField:TextField;
        
        public var objective1ValueTextField:TextField;
        
        public var objective2ValueTextField:TextField;
        
        public var startXPPercentage:Number;
        
        public var finishXPPercentage:Number;
        
        public var xpCounter:int = 0;
        
        public var xpDelta:int;
        
        public var startSubXP1:int = 0;
        
        public var finishSubXP1:int;
        
        public var startSubXP2:int = 0;
        
        public var finishSubXP2:int;
        
        public var perkLevel;
        
        public var perkInfo;
        
        public var perksubXP1;
        
        public var perksubXP2;
        
        public var perksubXP1Mask;
        
        public var perksubXP2Mask;
        
        public const perklevelFinX:Number = 480;
        
        public const perkSubWidth:Number = 532;
        
        public var startLevel:int;
        
        public var finishLevel:int;
        
        public var timeDialation:Number = 1;
        
        public const XPBarWidth:Number = 416;
        
        private var bReadyToPlay:Boolean;
        
        private var levelsToIncrement:int = 0;
        
        public function PerkXPTileObject()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        public function animate() : Boolean
        {
            if(visible)
            {
                if(PostGameMenu.bkillAnims)
                {
                    this.animDone();
                }
                else
                {
                    this.awardAnimIn();
                }
                return true;
            }
            this.bReadyToPlay = true;
            return false;
        }
        
        public function levelUpAnim() : void
        {
            TweenMax.to(this.perkInfo.perkXPBar,8 * this.timeDialation,{
                "delay":12 * this.timeDialation,
                "width":this.XPBarWidth,
                "useFrames":true,
                "ease":Cubic.easeOut,
                "onComplete":this.levelUpComplete
            });
        }
        
        public function levelUpComplete(param1:Event = null) : void
        {
            --this.levelsToIncrement;
            this.perkLevel.text = this.finishLevel - this.levelsToIncrement;
            this.perkInfo.perkXPBar.width = 0;
            if(this.levelsToIncrement > 0)
            {
                this.perkInfo.perkXPBar.width = 0;
                this.levelUpAnim();
            }
            else
            {
                TweenMax.to(this.perkInfo.perkXPBar,8 * this.timeDialation,{
                    "delay":12 * this.timeDialation,
                    "width":this.finishXPPercentage / 100 * this.XPBarWidth,
                    "useFrames":true,
                    "ease":Cubic.easeOut,
                    "onComplete":this.doneAndDone
                });
            }
            Extensions.gfxProcessSound(this,"AAR","Level_UP_AAR");
        }
        
        public function awardAnimIn() : void
        {
            if(this.xpDelta == 0)
            {
                this.perkInfo.perkXPBar.width = this.finishXPPercentage / 100 * this.XPBarWidth;
            }
            Extensions.gfxProcessSound(this,"AAR","NumberUpdate");
            TweenMax.fromTo(this,4 * this.timeDialation,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.perkLevel,4 * this.timeDialation,{
                "delay":4 * this.timeDialation,
                "x":this.perklevelFinX,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.perkInfo,4 * this.timeDialation,{
                "delay":8 * this.timeDialation,
                "autoAlpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this,8 * this.timeDialation,{
                "delay":12 * this.timeDialation,
                "xpCounter":this.xpDelta,
                "onUpdate":this.changeXP,
                "useFrames":true,
                "ease":Cubic.easeOut
            });
            TweenMax.to(this.perksubXP1,1 * this.timeDialation,{
                "delay":20 * this.timeDialation,
                "alpha":1,
                "useFrames":true
            });
            TweenMax.to(this.perksubXP1Mask,3 * this.timeDialation,{
                "delay":21 * this.timeDialation,
                "width":this.perkSubWidth,
                "useFrames":true
            });
            TweenMax.to(this,8 * this.timeDialation,{
                "delay":24 * this.timeDialation,
                "startSubXP1":this.finishSubXP1,
                "onUpdate":this.changeSubXP1,
                "useFrames":true,
                "ease":Cubic.easeOut
            });
            TweenMax.to(this.perksubXP2,1 * this.timeDialation,{
                "delay":20 * this.timeDialation,
                "alpha":1,
                "useFrames":true
            });
            TweenMax.to(this.perksubXP2Mask,3 * this.timeDialation,{
                "delay":21 * this.timeDialation,
                "width":this.perkSubWidth,
                "useFrames":true
            });
            if(this.startLevel == this.finishLevel)
            {
                TweenMax.to(this.perkInfo.perkXPBar,8 * this.timeDialation,{
                    "delay":12 * this.timeDialation,
                    "width":this.finishXPPercentage / 100 * this.XPBarWidth,
                    "useFrames":true,
                    "ease":Cubic.easeOut
                });
                TweenMax.to(this,8 * this.timeDialation,{
                    "delay":24 * this.timeDialation,
                    "startSubXP2":this.finishSubXP2,
                    "onUpdate":this.changeSubXP2,
                    "useFrames":true,
                    "ease":Cubic.easeOut,
                    "onComplete":this.doneAndDone
                });
            }
            else
            {
                this.levelsToIncrement = this.finishLevel - this.startLevel;
                this.levelUpAnim();
                TweenMax.to(this,8 * this.timeDialation,{
                    "delay":24 * this.timeDialation,
                    "startSubXP2":this.finishSubXP2,
                    "onUpdate":this.changeSubXP2,
                    "useFrames":true,
                    "ease":Cubic.easeOut
                });
            }
        }
        
        private function doneAndDone() : *
        {
            parent.dispatchEvent(new Event("PlayerNextAnim"));
            Extensions.gfxProcessSound(this,"AAR","Generic_Beep");
        }
        
        public function animDone() : *
        {
            this.alpha = 1;
            this.perkLevel.text = this.finishLevel;
            this.perkInfo.perkXPNum.text = "+" + this.xpDelta + "XP";
            this.perkLevel.x = this.perklevelFinX;
            this.perkInfo.alpha = 1;
            this.perksubXP1Mask.width = this.perkSubWidth;
            this.perksubXP2Mask.width = this.perkSubWidth;
            this.perksubXP1.alpha = 1;
            this.perksubXP2.alpha = 1;
            this.perksubXP1.perksubxpNum.text = "+" + this.finishSubXP1;
            this.perksubXP2.perksubxpNum.text = "+" + this.finishSubXP2;
            this.perkInfo.perkXPBar.width = this.finishXPPercentage;
            this.doneAndDone();
        }
        
        private function changeXP() : void
        {
            this.perkInfo.perkXPNum.text = "+" + String(this.xpCounter) + "XP";
        }
        
        private function changeSubXP1() : void
        {
            this.perksubXP1.perksubxpNum.text = "+" + this.startSubXP1.toString();
        }
        
        private function changeSubXP2() : void
        {
            this.perksubXP2.perksubxpNum.text = "+" + this.startSubXP2.toString();
        }
        
        override public function set data(param1:Object) : void
        {
            visible = param1 != null;
            if(param1)
            {
                this.perkIconLoader.source = !!param1.perkIcon ? param1.perkIcon : "";
                this.perkInfo.perkName.text = !!param1.perkName ? param1.perkName : "";
                this.startLevel = !!param1.perkLevel ? int(param1.perkLevel) : 0;
                this.finishLevel = !!param1.finishLevel ? int(param1.finishLevel) : 0;
                this.perksubXP1.perksubxpName.text = !!param1.objective1 ? param1.objective1 : "";
                this.finishSubXP1 = !!param1.objective1Value ? int(param1.objective1Value) : 0;
                this.perksubXP2.perksubxpName.text = !!param1.objective2 ? param1.objective2 : "";
                this.finishSubXP2 = !!param1.objective2Value ? int(param1.objective2Value) : 0;
                this.startXPPercentage = !!param1.startXP ? Number(param1.startXP) : Number(0);
                this.finishXPPercentage = !!param1.finishXP ? Number(param1.finishXP) : Number(0);
                this.xpDelta = !!param1.xpDelta ? int(param1.xpDelta) : 0;
                this.perkLevel.text = this.startLevel;
                if(this.bReadyToPlay)
                {
                    this.animate();
                }
            }
        }
    }
}
