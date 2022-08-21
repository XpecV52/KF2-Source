package tripwire.containers.midGame
{
    import com.greensock.TimelineMax;
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import com.greensock.easing.Sine;
    import com.greensock.plugins.GlowFilterPlugin;
    import com.greensock.plugins.HexColorsPlugin;
    import com.greensock.plugins.TweenPlugin;
    import com.greensock.plugins.TypewriterPlugin;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.core.UIComponent;
    
    public class RoundResultsContainer extends UIComponent
    {
         
        
        public var titleText:TextField;
        
        public var wavesCompText:TextField;
        
        public var wavesCompNumText:TextField;
        
        public var bossDeadText:TextField;
        
        public var bossDeadNumText:TextField;
        
        public var deathsText:TextField;
        
        public var deathsNumText:TextField;
        
        public var damageText:TextField;
        
        public var damageNumText:TextField;
        
        public var totalText:TextField;
        
        public var totalNumText:TextField;
        
        public var titleString:String;
        
        public var wavesCompString:String;
        
        public var wavesCompNum:int;
        
        public var bossDeadString:String;
        
        public var bossDeadNum:int;
        
        public var deathsString:String;
        
        public var deathsNum:int;
        
        public var damageString:String;
        
        public var damageNum:int;
        
        public var totalString:String;
        
        public var totalNum:int;
        
        public var divLine:MovieClip;
        
        public var scoreTallyTimeline:TimelineMax;
        
        public var goldenTotalTimeline:TimelineMax;
        
        public var animObj:Object;
        
        public var colorObj:Object;
        
        public var titleStartX:int;
        
        public const TITLE_OFFSET_X:int = 128;
        
        public const DIV_WIDTH:int = 656;
        
        public const GLOW_BLUR:int = 8;
        
        public const GLOW_STRENGTH:int = 2;
        
        public const GOLDEN_TIME_0:int = 16;
        
        public const SCORE_TYPE_TIME:int = 6;
        
        public const SCORE_SLIDE_TIME:int = 8;
        
        public const SCORE_COUNT_TIME:int = 12;
        
        public const whiteColor:uint = 14538703;
        
        public const goldColor:uint = 15573775;
        
        public var _bHasData:Boolean = false;
        
        public function RoundResultsContainer()
        {
            this.scoreTallyTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.goldenTotalTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.animObj = {"animNum":0};
            this.colorObj = {"totalColor":16777215};
            super();
            enableInitCallback = true;
            TweenPlugin.activate([TypewriterPlugin]);
            TweenPlugin.activate([GlowFilterPlugin]);
            TweenPlugin.activate([HexColorsPlugin]);
            this.titleStartX = this.totalText.x;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.titleString = !!param1.title ? param1.title : "";
                this.wavesCompString = !!param1.wavesComp ? param1.wavesComp : "";
                this.bossDeadString = !!param1.bossDead ? param1.bossDead : "";
                this.deathsString = !!param1.deaths ? param1.deaths : "";
                this.damageString = !!param1.damage ? param1.damage : "";
                this.totalString = !!param1.total ? param1.total : "";
            }
        }
        
        public function set data(param1:*) : void
        {
            if(param1)
            {
                this.resetAnims();
                this.wavesCompNum = !!param1.waveNum ? int(param1.waveNum) : 0;
                this.bossDeadNum = !!param1.bossDeadNum ? int(param1.bossDeadNum) : 0;
                this.deathsNum = !!param1.deathNum ? int(param1.deathNum) : 0;
                this.damageNum = !!param1.damagNum ? int(param1.damagNum) : 0;
                this.totalNum = !!param1.totalNum ? int(param1.totalNum) : 0;
                this._bHasData = param1.bHasData;
                this.makeScoreTallyTimeline();
                this.makeGoldenTotalTimeline();
                this.dispatchEvent(new Event("PlayAnimation"));
            }
        }
        
        public function noAnims() : void
        {
            this.scoreTallyTimeline.progress(1,false);
        }
        
        public function resetAnims() : void
        {
            this.scoreTallyTimeline.stop();
            this.goldenTotalTimeline.stop();
            this.titleText.text = "";
            this.wavesCompText.text = "";
            this.wavesCompNumText.text = "";
            this.bossDeadText.text = "";
            this.bossDeadNumText.text = "";
            this.deathsText.text = "";
            this.deathsNumText.text = "";
            this.damageText.text = "";
            this.damageNumText.text = "";
            this.totalText.text = "";
            this.totalNumText.text = "";
            this.totalText.textColor = this.whiteColor;
            this.totalNumText.textColor = this.whiteColor;
            this.divLine.width = 0;
            this.divLine.alpha = 0;
            this._bHasData = false;
        }
        
        public function makeScoreTallyTimeline() : void
        {
            this.scoreTallyTimeline.clear();
            this.scoreTallyTimeline.to(this.titleText,10,{
                "typewriter":this.titleString,
                "ease":Cubic.easeInOut
            });
            this.scoreTallyTimeline.fromTo(this.titleText,16,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeInOut
            },"-=10");
            this.scoreTallyTimeline.to(this.divLine,12,{
                "alpha":1,
                "width":this.DIV_WIDTH,
                "ease":Cubic.easeOut
            },"-=12");
            this.makeScoreLineAnims();
            this.scoreTallyTimeline.to(this.totalText,this.SCORE_TYPE_TIME,{
                "typewriter":this.totalString,
                "ease":Cubic.easeOut
            });
            this.scoreTallyTimeline.fromTo(this.totalText,this.SCORE_SLIDE_TIME,{
                "x":this.titleStartX - this.TITLE_OFFSET_X,
                "alpha":0
            },{
                "x":this.titleStartX,
                "alpha":1,
                "ease":Cubic.easeOut
            },"-=" + String(this.SCORE_TYPE_TIME));
            this.scoreTallyTimeline.fromTo(this.animObj,32,{"animNum":0},{
                "animNum":this.totalNum,
                "onUpdate":this.changeNum,
                "onUpdateParams":[this.totalNumText],
                "ease":Sine.easeIn
            },"-=4");
            this.scoreTallyTimeline.to(this.totalNumText,8,{
                "glowFilter":{
                    "color":this.whiteColor,
                    "blurX":this.GLOW_BLUR,
                    "blurY":this.GLOW_BLUR,
                    "strength":2,
                    "alpha":1
                },
                "ease":Cubic.easeOut
            });
            this.scoreTallyTimeline.to(this.totalNumText,16,{
                "glowFilter":{
                    "color":this.whiteColor,
                    "blurX":0,
                    "blurY":0,
                    "remove":true
                },
                "ease":Cubic.easeIn
            });
            this.scoreTallyTimeline.append(TweenMax.delayedCall(8,this.doneAndDone,[],true));
        }
        
        public function makeScoreLineAnims() : void
        {
            this.setScoreLineAnim(this.wavesCompText,this.wavesCompNumText,this.wavesCompString,this.wavesCompNum);
            this.setScoreLineAnim(this.bossDeadText,this.bossDeadNumText,this.bossDeadString,this.bossDeadNum);
            this.setScoreLineAnim(this.deathsText,this.deathsNumText,this.deathsString,this.deathsNum);
            this.setScoreLineAnim(this.damageText,this.damageNumText,this.damageString,this.damageNum);
        }
        
        public function setScoreLineAnim(param1:TextField, param2:TextField, param3:String, param4:int) : void
        {
            var _loc5_:* = undefined;
            this.scoreTallyTimeline.to(param1,this.SCORE_TYPE_TIME,{
                "typewriter":param3,
                "ease":Cubic.easeInOut
            },"-=2");
            this.scoreTallyTimeline.fromTo(param1,this.SCORE_SLIDE_TIME,{
                "x":this.titleStartX - this.TITLE_OFFSET_X,
                "alpha":0
            },{
                "x":this.titleStartX,
                "alpha":1,
                "ease":Cubic.easeInOut
            },"-=" + String(this.SCORE_TYPE_TIME));
            if(param4 < this.SCORE_COUNT_TIME && param4 > -this.SCORE_COUNT_TIME)
            {
                _loc5_ = param4.toString();
                this.scoreTallyTimeline.to(param2,1,{"typewriter":_loc5_},"-=4");
                this.scoreTallyTimeline.set(this,{},"+=7");
            }
            else
            {
                this.scoreTallyTimeline.fromTo(this.animObj,this.SCORE_COUNT_TIME,{"animNum":0},{
                    "animNum":param4,
                    "onUpdate":this.changeNum,
                    "onUpdateParams":[param2],
                    "ease":Sine.easeIn
                },"-=2");
            }
        }
        
        public function makeGoldenTotalTimeline() : void
        {
            this.goldenTotalTimeline.clear();
            this.goldenTotalTimeline.fromTo(this.colorObj,this.GOLDEN_TIME_0,{"hexColors":{"totalColor":this.whiteColor}},{
                "hexColors":{"totalColor":this.goldColor},
                "ease":Cubic.easeOut,
                "onUpdate":this.applyTotalGold
            });
            this.goldenTotalTimeline.append(TweenMax.allTo([this.totalText,this.totalNumText],this.GOLDEN_TIME_0,{
                "glowFilter":{
                    "color":this.goldColor,
                    "blurX":this.GLOW_BLUR,
                    "blurY":this.GLOW_BLUR,
                    "strength":2,
                    "alpha":1
                },
                "repeat":1,
                "yoyo":true,
                "ease":Cubic.easeOut
            }),"-=" + String(this.GOLDEN_TIME_0));
        }
        
        public function playAnimation() : void
        {
            this.scoreTallyTimeline.time(0);
            this.scoreTallyTimeline.play();
        }
        
        public function changeNum(param1:TextField) : void
        {
            param1.text = int(this.animObj.animNum).toString();
        }
        
        public function applyTotalGold() : void
        {
            this.totalText.textColor = this.colorObj.totalColor;
            this.totalNumText.textColor = this.colorObj.totalColor;
        }
        
        public function doneAndDone() : void
        {
            if(this.alpha == 1)
            {
                parent.dispatchEvent(new Event("FinishAnimation"));
            }
        }
        
        public function testAnimation(param1:String = "Your", param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0) : void
        {
            this.titleString = param1 + " Team\'s Score";
            this.wavesCompString = "Waves Completed Bonus";
            this.bossDeadString = "Boss Defeated";
            this.deathsString = "Player Deaths Penalty";
            this.damageString = "Damage From Boss Penalty";
            this.totalString = "Total";
            this.totalNum = param2 + param3 + param4 + param5;
            var _loc6_:Object = {
                "waveNum":param2,
                "bossDeadNum":param3,
                "deathNum":param4,
                "damagNum":param5,
                "totalNum":this.totalNum
            };
            this.data = _loc6_;
        }
    }
}
