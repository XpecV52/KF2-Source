package tripwire.controls.postGameMenu
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.controls.ListItemRenderer;
    import scaleform.gfx.Extensions;
    import tripwire.controls.TripUILoader;
    
    public class TopWeaponDataContainer extends ListItemRenderer
    {
         
        
        public var weaponIconLoader:TripUILoader;
        
        public var titleTextField:TextField;
        
        public var damageTextField:TextField;
        
        public var headshotTextField:TextField;
        
        public var largeZedTextField:TextField;
        
        public var damageValueTextField:TextField;
        
        public var headshotValueTextField:TextField;
        
        public var largeZedValueTextField:TextField;
        
        public var currentHeadShotsValue:int = 0;
        
        public var finishHeadShotsValue:int = 0;
        
        public var currentDamageValue:int = 0;
        
        public var finishDamageValue:int = 0;
        
        public var currentLargeZedsValue:int = 0;
        
        public var finishLargeZedsValue:int = 0;
        
        public var awardBG:MovieClip;
        
        public var awardInfo;
        
        public var timeDialation:Number = 1;
        
        public const awardWidth:Number = 1088;
        
        public function TopWeaponDataContainer()
        {
            super();
            alpha = 0;
        }
        
        public function awardAnimIn(param1:Boolean = false) : void
        {
            Extensions.gfxProcessSound(this,"AAR","Top_Weapon");
            if(!param1)
            {
                TweenMax.fromTo(this,4 * this.timeDialation,{
                    "alpha":0,
                    "visible":true
                },{
                    "alpha":1,
                    "ease":Cubic.easeOut,
                    "useFrames":true
                });
                TweenMax.to(this.awardBG,4 * this.timeDialation,{
                    "delay":4 * this.timeDialation,
                    "width":this.awardWidth,
                    "ease":Cubic.easeOut,
                    "useFrames":true
                });
                TweenMax.to(this.awardInfo,4 * this.timeDialation,{
                    "delay":8 * this.timeDialation,
                    "autoAlpha":1,
                    "ease":Cubic.easeOut,
                    "useFrames":true
                });
                TweenMax.to(this,8 * this.timeDialation,{
                    "delay":12 * this.timeDialation,
                    "currentDamageValue":this.finishDamageValue,
                    "onUpdate":this.changeDamageNum,
                    "useFrames":true,
                    "ease":Cubic.easeOut
                });
                TweenMax.to(this,8 * this.timeDialation,{
                    "delay":12 * this.timeDialation,
                    "currentHeadShotsValue":this.finishHeadShotsValue,
                    "onUpdate":this.changeHeadShotNum,
                    "useFrames":true,
                    "ease":Cubic.easeOut
                });
                TweenMax.to(this,8 * this.timeDialation,{
                    "delay":12 * this.timeDialation,
                    "currentLargeZedsValue":this.finishLargeZedsValue,
                    "onUpdate":this.changeLargeZedsNum,
                    "useFrames":true,
                    "ease":Cubic.easeOut,
                    "onComplete":this.doneAndDone
                });
            }
            else if(param1)
            {
                this.alpha = 1;
                this.awardBG.width = this.awardWidth;
                this.awardInfo.alpha = 1;
                this.awardInfo.damageValueTextField.text = this.finishDamageValue;
                this.awardInfo.headshotValueTextField.text = this.finishHeadShotsValue;
                this.awardInfo.largeZedValueTextField.text = this.finishLargeZedsValue;
                this.doneAndDone();
            }
        }
        
        public function doneAndDone(param1:Event = null) : void
        {
            parent.dispatchEvent(new Event("PlayerNextAnim"));
        }
        
        private function changeDamageNum() : void
        {
            this.awardInfo.damageValueTextField.text = this.currentDamageValue.toString();
        }
        
        private function changeHeadShotNum() : void
        {
            this.awardInfo.headshotValueTextField.text = this.currentHeadShotsValue.toString();
        }
        
        private function changeLargeZedsNum() : void
        {
            this.awardInfo.largeZedValueTextField.text = this.currentLargeZedsValue.toString();
        }
        
        override public function set data(param1:Object) : void
        {
            super.data = param1;
            if(param1 != null)
            {
                this.awardInfo.titleTextField.text = !!param1.weaponName ? param1.weaponName : "";
                visible = param1.damage > 0;
                this.weaponIconLoader.source = !!param1.weaponIcon ? param1.weaponIcon : "";
                this.awardInfo.damageTextField.text = !!param1.damageText ? param1.damageText : "";
                this.awardInfo.headshotTextField.text = !!param1.headshotsText ? param1.headshotsText : "";
                this.awardInfo.largeZedTextField.text = !!param1.largeZedText ? param1.largeZedText : "";
                this.finishDamageValue = !!param1.damage ? int(param1.damage) : 0;
                this.finishHeadShotsValue = !!param1.headshots ? int(param1.headshots) : 0;
                this.finishLargeZedsValue = !!param1.largeZed ? int(param1.largeZed) : 0;
            }
            else
            {
                visible = false;
            }
        }
    }
}
