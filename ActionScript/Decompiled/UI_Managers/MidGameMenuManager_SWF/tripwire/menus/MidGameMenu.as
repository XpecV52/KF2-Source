package tripwire.menus
{
    import com.greensock.TimelineMax;
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import com.greensock.easing.Expo;
    import com.greensock.plugins.GlowFilterPlugin;
    import com.greensock.plugins.TweenPlugin;
    import com.greensock.plugins.TypewriterPlugin;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import flash.ui.Keyboard;
    import tripwire.containers.TripContainer;
    
    public class MidGameMenu extends TripContainer
    {
        
        public static var PLAY_ANIM = "PlayAnimation";
        
        public static var NEXT_ANIM = "FinishAnimation";
         
        
        public var roundResultsTitleText:TextField;
        
        public var roundResultsText:TextField;
        
        public var matchResultsTitleText:TextField;
        
        public var matchResultsText:TextField;
        
        public var teamswapText:TextField;
        
        public var introTimeline;
        
        public var switchingTeamsTimeline;
        
        public var compareRoundsTimeline;
        
        public var matchWinnerTimeline;
        
        public var roundResultsTitleString:String;
        
        public var roundResultsString:String;
        
        public var matchResultsTitleString:String;
        
        public var matchResultsString:String;
        
        public var roundOneContainer:RoundResultsContainer;
        
        public var roundTwoContainer:RoundResultsContainer;
        
        public var blackBG:MovieClip;
        
        public var iconMask:MovieClip;
        
        public var iconBG:MovieClip;
        
        public var round1X:int = 0;
        
        public var round2X:int = 0;
        
        public var roundStartX:int = 0;
        
        public const CENTER_X:int = 616;
        
        public const STAGE_CENTER:int = 960;
        
        public const OFF_STAGE_POINT:int = -320;
        
        public const BLACK_BG_ALPHA:Number = 0.64;
        
        public const MOVE_OFFSET:Number = 128;
        
        public const TEAM_SWAP_ALPHA:Number = 0.24;
        
        public const LOSER_ALPHA:Number = 0.48;
        
        public const MATCH_GLOW_STRENGTH:int = 16;
        
        public const MATCH_OFFSET_Z:int = -48;
        
        public const ICON_BG_TIME:int = 16;
        
        public const TITLE_TYPE_TIME:int = 10;
        
        public const TEAM_SWAP_TIME:int = 24;
        
        public const COMPARE_ROUNDS_TIME:int = 12;
        
        public const goldColor:uint = 15573775;
        
        public const blueColor:uint = 12255231;
        
        public const whiteColor:uint = 14538703;
        
        public var colors:Object;
        
        public function MidGameMenu()
        {
            this.introTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.switchingTeamsTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.compareRoundsTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.matchWinnerTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.colors = {"shineColor":16777215};
            super();
            enableInitCallback = true;
            TweenPlugin.activate([TypewriterPlugin]);
            TweenPlugin.activate([GlowFilterPlugin]);
            this.round1X = this.roundOneContainer.x;
            this.round2X = this.roundTwoContainer.x;
            this.roundStartX = this.roundResultsText.x;
            this.blackBG.alpha = 0;
            this.iconBG.alpha = 0;
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.roundResultsTitleString = !!param1.roundResultsTitle ? param1.roundResultsTitle : "";
                this.matchResultsTitleString = !!param1.matchResultsTitle ? param1.matchResultsTitle : "";
            }
        }
        
        public function set Data(param1:Object) : void
        {
            if(param1)
            {
                this.roundResultsString = !!param1.roundResults ? param1.roundResults : "";
                this.matchResultsString = !!param1.matchResults ? param1.matchResults : "";
            }
        }
        
        public function playAnimation(param1:Event = null) : void
        {
            this.resetAnims();
            this.makeIntroTimeline();
            this.makeSwitchingTeamsTimeline();
            this.makeMatchWinnerTimeline();
            this.makeCompareRoundsTimeline();
            this.introTimeline.play(0);
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.resetAnims();
            this.roundOneContainer.addEventListener(PLAY_ANIM,this.playAnimation,false,0,true);
            this.addEventListener(NEXT_ANIM,this.finishAnimation,false,0,true);
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
        }
        
        public function resetAnims() : void
        {
            this.introTimeline.stop();
            this.matchWinnerTimeline.stop();
            this.switchingTeamsTimeline.stop();
            this.compareRoundsTimeline.stop();
            this.roundResultsTitleText.text = "";
            this.roundResultsText.text = "";
            this.matchResultsTitleText.text = "";
            this.matchResultsText.text = "";
            this.teamswapText.text = "";
            this.alpha = 1;
            this.blackBG.alpha = 0;
            this.iconBG.alpha = 0;
            this.roundOneContainer.x = this.round1X;
            this.roundTwoContainer.x = this.round2X;
            this.roundOneContainer.alpha = 1;
            this.roundTwoContainer.alpha = 1;
        }
        
        public function makeIntroTimeline() : void
        {
            this.introTimeline.clear();
            this.introTimeline.to(this.blackBG,12,{
                "alpha":this.BLACK_BG_ALPHA,
                "ease":Cubic.easeOut
            });
            this.introTimeline.fromTo(this.iconMask,this.ICON_BG_TIME,{
                "width":0,
                "x":this.STAGE_CENTER
            },{
                "alpha":1,
                "width":2560,
                "x":this.OFF_STAGE_POINT,
                "ease":Cubic.easeOut
            },"-=4");
            this.introTimeline.to(this.iconBG,this.ICON_BG_TIME,{
                "alpha":1,
                "ease":Cubic.easeOut
            },"-=" + String(this.ICON_BG_TIME));
            this.introTimeline.to(this.roundResultsTitleText,this.TITLE_TYPE_TIME,{
                "typewriter":this.roundResultsTitleString,
                "ease":Cubic.easeInOut
            },"-=8");
            this.introTimeline.fromTo(this.roundResultsTitleText,16,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeInOut
            },"-=" + String(this.TITLE_TYPE_TIME));
            this.introTimeline.to(this.roundResultsText,1,{"typewriter":this.roundResultsString},"-=6");
            this.introTimeline.fromTo(this.roundResultsText,8,{
                "alpha":0,
                "x":this.roundStartX - this.MOVE_OFFSET
            },{
                "glowFilter":{
                    "color":this.blueColor,
                    "blurX":12,
                    "blurY":12,
                    "strength":2,
                    "alpha":1
                },
                "alpha":1,
                "x":this.roundStartX,
                "ease":Cubic.easeOut
            },"-=6");
            this.introTimeline.to(this.roundResultsText,10,{
                "glowFilter":{
                    "color":this.blueColor,
                    "blurX":0,
                    "blurY":0,
                    "remove":true
                },
                "z":0,
                "ease":Cubic.easeIn
            });
            this.introTimeline.append(TweenMax.delayedCall(6,this.startRoundScore,[],true));
        }
        
        public function makeSwitchingTeamsTimeline() : void
        {
            this.switchingTeamsTimeline.clear();
            this.switchingTeamsTimeline.to(this.teamswapText,1,{
                "z":0,
                "alpha":0,
                "typewriter":this.matchResultsString
            });
            this.switchingTeamsTimeline.to(this.teamswapText,this.TEAM_SWAP_TIME,{
                "alpha":1,
                "ease":Cubic.easeInOut
            });
            this.switchingTeamsTimeline.append(TweenMax.fromTo(this.teamswapText,this.TEAM_SWAP_TIME,{"alpha":1},{
                "alpha":this.TEAM_SWAP_ALPHA,
                "ease":Cubic.easeIn,
                "repeat":-1,
                "yoyo":true
            }));
        }
        
        public function makeCompareRoundsTimeline() : void
        {
            this.compareRoundsTimeline.clear();
            this.compareRoundsTimeline.to(this.roundTwoContainer,this.COMPARE_ROUNDS_TIME,{
                "x":this.round2X,
                "ease":Expo.easeInOut
            });
            this.compareRoundsTimeline.to(this.roundOneContainer,this.COMPARE_ROUNDS_TIME,{
                "alpha":1,
                "ease":Cubic.easeInOut
            },"-=8");
            this.determineWinner(this.roundOneContainer.totalNum,this.roundTwoContainer.totalNum);
            this.compareRoundsTimeline.append(TweenMax.delayedCall(1,this.matchWinnerTimeline.restart,[0],true),"-=9");
        }
        
        public function determineWinner(param1:int, param2:int) : void
        {
            var _loc3_:RoundResultsContainer = new RoundResultsContainer();
            var _loc4_:RoundResultsContainer = new RoundResultsContainer();
            if(param1 != param2)
            {
                _loc3_ = param1 > param2 ? this.roundOneContainer : this.roundTwoContainer;
                _loc4_ = param1 < param2 ? this.roundOneContainer : this.roundTwoContainer;
                this.compareRoundsTimeline.append(TweenMax.delayedCall(1,_loc3_.goldenTotalTimeline.play,[],true));
                this.compareRoundsTimeline.to(_loc4_,8,{
                    "alpha":this.LOSER_ALPHA,
                    "ease":Cubic.easeOut
                });
            }
        }
        
        public function playSoundCall() : void
        {
            trace("ExternalInterface.call(Callback_WinnerAnimationComplete);");
            ExternalInterface.call("Callback_WinnerAnimationComplete");
        }
        
        public function makeMatchWinnerTimeline() : void
        {
            this.matchWinnerTimeline.clear();
            this.matchWinnerTimeline.set(this,{},"+=8");
            this.matchWinnerTimeline.to(this.matchResultsTitleText,this.TITLE_TYPE_TIME,{
                "typewriter":this.matchResultsTitleString,
                "ease":Cubic.easeInOut
            });
            this.matchWinnerTimeline.fromTo(this.matchResultsTitleText,16,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeInOut
            },"-=" + String(this.TITLE_TYPE_TIME));
            this.matchWinnerTimeline.to(this.matchResultsText,1,{
                "alpha":0,
                "z":this.MOVE_OFFSET,
                "typewriter":this.matchResultsString
            });
            this.matchWinnerTimeline.to(this.matchResultsText,8,{
                "glowFilter":{
                    "color":this.goldColor,
                    "blurX":this.MATCH_GLOW_STRENGTH,
                    "blurY":this.MATCH_GLOW_STRENGTH,
                    "strength":2,
                    "alpha":1
                },
                "alpha":1,
                "z":this.MATCH_OFFSET_Z,
                "ease":Cubic.easeOut,
                "onStart":this.playSoundCall
            });
            this.matchWinnerTimeline.to(this.matchResultsText,10,{
                "glowFilter":{
                    "color":this.goldColor,
                    "blurX":0,
                    "blurY":0,
                    "remove":true
                },
                "z":0,
                "ease":Cubic.easeIn
            });
        }
        
        public function startRoundScore() : void
        {
            if(this.roundTwoContainer._bHasData == false)
            {
                this.roundOneContainer.x = this.CENTER_X;
                this.roundOneContainer.playAnimation();
            }
            else
            {
                this.roundOneContainer.x = this.round1X;
                this.roundOneContainer.alpha = 0;
                this.roundOneContainer.noAnims();
                this.roundTwoContainer.x = this.CENTER_X;
                this.roundTwoContainer.playAnimation();
            }
        }
        
        public function finishAnimation(param1:Event = null) : void
        {
            if(this.roundTwoContainer._bHasData == false)
            {
                this.switchingTeamsTimeline.play(0);
            }
            else
            {
                this.compareRoundsTimeline.play(0);
            }
        }
        
        public function testAnims(param1:KeyboardEvent) : void
        {
            if(param1.keyCode == Keyboard.A)
            {
                this.resetAnims();
                this.roundResultsTitleString = "Round 1 Results";
                this.roundResultsString = "Survivor Victory!";
                this.matchResultsTitleString = "Overall Winner";
                this.matchResultsString = "Switching Teams...";
                this.roundTwoContainer.testAnimation("Opposing",0,0,0,0);
                this.roundOneContainer.testAnimation("Your",4000,10000,-1100,0);
            }
            else if(param1.keyCode == Keyboard.S)
            {
                this.resetAnims();
                this.roundResultsTitleString = "Round 2 Results";
                this.roundResultsString = "ZED Victory!";
                this.matchResultsTitleString = "Overall Winner";
                this.matchResultsString = "Your Team Wins!";
                this.roundTwoContainer.testAnimation("Opposing",3000,0,-400,0);
                this.roundOneContainer.testAnimation("Your",4000,10000,-1100,0);
            }
            else if(param1.keyCode == Keyboard.D)
            {
                this.resetAnims();
                this.roundResultsTitleString = "Round 2 Results";
                this.roundResultsString = "Survivor Victory!";
                this.matchResultsTitleString = "Overall Winner";
                this.matchResultsString = "Opposing Team Wins!";
                this.roundTwoContainer.testAnimation("Opposing",4000,10000,-400,0);
                this.roundOneContainer.testAnimation("Your",4000,10000,-1100,0);
            }
            else if(param1.keyCode == Keyboard.F)
            {
                this.resetAnims();
                this.roundResultsTitleString = "Round 2 Results";
                this.roundResultsString = "Survivor Victory!";
                this.matchResultsTitleString = "Overall Winner";
                this.matchResultsString = "Tie!";
                this.roundTwoContainer.testAnimation("Opposing",4000,10000,-400,0);
                this.roundOneContainer.testAnimation("Your",4000,10000,-400,0);
            }
        }
    }
}
