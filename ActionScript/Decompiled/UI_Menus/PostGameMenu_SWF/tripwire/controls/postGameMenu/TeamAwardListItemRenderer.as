package tripwire.controls.postGameMenu
{
    import com.greensock.TimelineMax;
    import com.greensock.easing.Cubic;
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.controls.ListItemRenderer;
    import scaleform.clik.controls.UILoader;
    import scaleform.gfx.Extensions;
    import tripwire.menus.PostGameMenu;
    
    public class TeamAwardListItemRenderer extends ListItemRenderer
    {
         
        
        public var playerNameTextfield:TextField;
        
        public var statTextfield:TextField;
        
        public var awardIconLoader:UILoader;
        
        public var awardInfo;
        
        public var awardBG:MovieClip;
        
        public var awardFrame:MovieClip;
        
        public var personalBG:MovieClip;
        
        public var timeDialation:Number = 1;
        
        public var Arrows:MovieClip;
        
        public const frameWidth:Number = 392;
        
        protected var _bHighlight:Boolean = false;
        
        private var activeColor:uint = 4836490;
        
        private var _bgColor:Color;
        
        public var teamAwardTimeline;
        
        public var teamAwardSoundEffect:String = "AAR_PERSONALBEST_NEWPERSONALBEST";
        
        public function TeamAwardListItemRenderer()
        {
            this._bgColor = new Color();
            this.teamAwardTimeline = new TimelineMax({
                "useFrames":true,
                "paused":true
            });
            super();
            preventAutosizing = true;
            alpha = 0;
            this.Arrows.visible = false;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        public function setAnimations() : void
        {
            this.teamAwardTimeline.fromTo(this,8,{
                "alpha":0,
                "visible":true
            },{
                "alpha":1,
                "ease":Cubic.easeOut,
                "onStart":this.playSound,
                "onStartParams":[this.teamAwardSoundEffect]
            }).to(this.awardBG,1,{"alpha":1}).to(this.awardBG,7,{
                "width":this.frameWidth,
                "ease":Cubic.easeOut
            }).to(this.awardInfo,4,{
                "autoAlpha":1,
                "ease":Cubic.easeOut,
                "onComplete":this.doneAndDone
            });
        }
        
        public function animate() : void
        {
            if(PostGameMenu.bkillAnims)
            {
                this.teamAwardTimeline.timeScale(20);
                this.teamAwardTimeline.play();
            }
            else if(!PostGameMenu.bkillAnims)
            {
                this.teamAwardTimeline.timeScale(this.timeDialation);
                this.teamAwardTimeline.play();
            }
        }
        
        public function playSound(param1:String) : void
        {
            if(Extensions.enabled)
            {
                Extensions.gfxProcessSound(this,"UI",param1);
            }
        }
        
        public function set highLight(param1:Boolean) : void
        {
            this._bHighlight = param1;
            if(param1)
            {
                this.Arrows.visible = true;
                this._bgColor.setTint(this.activeColor,1);
                this.personalBG.transform.colorTransform = this._bgColor;
                this.awardInfo.statNameTextField.textColor = this.activeColor;
                this.awardInfo.statTextfield.textColor = this.activeColor;
            }
        }
        
        protected function doneAndDone() : *
        {
            parent.dispatchEvent(new Event("PlayerNextAnim"));
        }
        
        override public function set data(param1:Object) : void
        {
            super.data = param1;
            if(param1)
            {
                this.awardInfo.playerNameTextfield.text = !!param1.playerName ? param1.playerName : "";
                this.awardInfo.statNameTextField.text = !!param1.stat ? param1.stat : "";
                this.awardInfo.statTextfield.text = !!param1.statValue ? param1.statValue : "";
                this.highLight = !!param1.highLight ? Boolean(param1.highLight) : false;
                if(param1.icon != "")
                {
                    this.awardIconLoader.source = param1.icon;
                }
            }
            this.setAnimations();
        }
    }
}
