package tripwire.containers.postGame
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import com.greensock.easing.Linear;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.controls.ScrollingList;
    import scaleform.clik.data.DataProvider;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripScrollArea;
    import tripwire.controls.postGameMenu.TeamAwardListItemRenderer;
    import tripwire.menus.PostGameMenu;
    
    public class TeamAwardsContainer extends TripContainer
    {
         
        
        public var playerStatsList:TripScrollArea;
        
        public var teamAwardList:ScrollingList;
        
        public var personalBestList:ScrollingList;
        
        public var teamAwardsObject;
        
        public var personalBestsObject;
        
        public var noAwardsTextField:TextField;
        
        public var teamAwardsTextField:TextField;
        
        public var personalBestsTextField:TextField;
        
        public var bAnimationsPlayed:Boolean;
        
        private var bPlayPlayerAnimations:Boolean;
        
        private var currentTeamIndex:int = 0;
        
        private var currentPlayerIndex:int = 0;
        
        public var currentAwardContainer:TeamAwardListItemRenderer;
        
        public var teamAwardsTextContainer:MovieClip;
        
        public var personalBestsTextContainer:MovieClip;
        
        public var scrollDelay:Number = 60;
        
        public const scrollAmount:Number = 688;
        
        public const teamAwardsTextX:int = 3;
        
        public const teamAwardsTextY:int = -12;
        
        public const teamAwardsObjectY:Number = 48;
        
        public const personalBestsTextY:int = 676;
        
        public const personalBestsObjectY:Number = 736;
        
        public function TeamAwardsContainer()
        {
            super();
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.noAwardsTextField.text = !!param1.noAwards ? param1.noAwards : "";
                this.teamAwardsTextField.text = !!param1.teamAwards ? param1.teamAwards : "";
                this.personalBestsTextField.text = !!param1.personalBests ? param1.personalBests : "";
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.teamAwardList = this.teamAwardsObject.awardList;
            this.personalBestList = this.personalBestsObject.awardList;
            var _loc2_:Array = new Array();
            this.teamAwardsObject.addEventListener("PlayerNextAnim",this.playNextAnim,false,0,true);
            this.personalBestsObject.addEventListener("PlayerNextAnim",this.playNextAnim,false,0,true);
            this.noAwardsTextField = this.teamAwardList.getChildByName("noAwardsTextField") as TextField;
            (this.personalBestList.getChildByName("noAwardsTextField") as TextField).visible = false;
            this.playerStatsList.addDisplayObject(this.teamAwardsTextField);
            this.teamAwardsTextField.y = this.teamAwardsTextY;
            this.playerStatsList.addDisplayObject(this.teamAwardsObject);
            this.teamAwardsObject.y = this.teamAwardsObjectY;
            this.playerStatsList.addDisplayObject(this.personalBestsTextField);
            this.personalBestsTextField.y = this.personalBestsTextY;
            this.playerStatsList.addDisplayObject(this.personalBestsObject);
            this.personalBestsObject.y = this.personalBestsObjectY;
            this.teamAwardsTextField.x = this.teamAwardsTextX;
            this.personalBestsTextField.x = this.teamAwardsTextX;
            this.noAwardsTextField.visible = false;
            this.playerStatsList.stepSize = this.scrollAmount;
            this.playerStatsList.scrollBar.scrollRate = this.scrollAmount;
        }
        
        override public function openContainer() : void
        {
            super.openContainer();
            this.playerStatsList.enabled = true;
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            this.playerStatsList.enabled = false;
        }
        
        public function playNextAnim(param1:Event = null) : void
        {
            if(this.currentTeamIndex < this.teamAwardList.dataProvider.length)
            {
                this.playNextTeamAnimation();
            }
            else if(!this.bPlayPlayerAnimations && !PostGameMenu.bkillAnims)
            {
                TweenMax.fromTo(this.playerStatsList.scrollBar,8,{"position":this.playerStatsList.scrollBar.position},{
                    "delay":this.scrollDelay,
                    "position":this.scrollAmount,
                    "ease":Cubic.easeInOut,
                    "useFrames":true,
                    "onComplete":this.scrollComplete
                });
            }
            else if(this.currentPlayerIndex < this.personalBestList.dataProvider.length)
            {
                this.playNextPlayerAnimation();
            }
            else
            {
                dispatchEvent(new Event(PostGameMenu.NEXT_PAGE));
            }
        }
        
        public function scrollComplete(param1:Event = null) : void
        {
            this.bPlayPlayerAnimations = true;
            this.playNextAnim();
        }
        
        public function playNextTeamAnimation() : void
        {
            if(this.currentTeamIndex < this.teamAwardList.dataProvider.length)
            {
                this.currentAwardContainer = this.teamAwardList.getRendererAt(this.currentTeamIndex) as TeamAwardListItemRenderer;
                if(this.currentAwardContainer != null)
                {
                    if(this.currentAwardContainer.animate())
                    {
                    }
                }
            }
            ++this.currentTeamIndex;
        }
        
        public function playNextPlayerAnimation() : void
        {
            if(this.currentPlayerIndex < this.personalBestList.dataProvider.length)
            {
                this.currentAwardContainer = this.personalBestList.getRendererAt(this.currentPlayerIndex) as TeamAwardListItemRenderer;
                if(this.currentAwardContainer != null)
                {
                    if(this.currentAwardContainer.animate())
                    {
                    }
                }
            }
            ++this.currentPlayerIndex;
        }
        
        public function playAnimations() : void
        {
            if(!this.bAnimationsPlayed)
            {
                this.playNextAnim();
                this.bAnimationsPlayed = true;
            }
        }
        
        override protected function openAnimation() : *
        {
            this.playerStatsList.scrollBar.position = 0;
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,ANIM_TIME,{
                "alpha":0,
                "ease":Linear.easeNone,
                "useFrames":true
            },{
                "alpha":_defaultAlpha,
                "ease":Linear.easeNone,
                "delay":ANIM_TIME,
                "useFrames":true,
                "onComplete":onOpened
            });
        }
        
        override protected function closeAnimation() : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,ANIM_TIME,{
                "alpha":_defaultAlpha,
                "ease":Linear.easeNone,
                "useFrames":true
            },{
                "alpha":0,
                "ease":Linear.easeNone,
                "useFrames":true,
                "onComplete":onClosed
            });
        }
        
        public function set teamAwards(param1:Array) : void
        {
            this.teamAwardList.dataProvider = new DataProvider(param1);
            this.playAnimations();
        }
        
        public function set personalBests(param1:Array) : void
        {
            this.personalBestList.dataProvider = new DataProvider(param1);
        }
        
        public function makeFakeAwards() : *
        {
            var _loc2_:Object = null;
            var _loc1_:Array = new Array();
            var _loc3_:int = 0;
            while(_loc3_ < 8)
            {
                _loc2_ = new Object();
                _loc2_.playerName = "[TW] Shoe";
                _loc2_.stat = "1337 leet!";
                _loc2_.highLight = _loc3_ % 2 == 1;
                if(_loc3_ % 2 == 1)
                {
                    _loc2_.label = "Most Dishonorable";
                    _loc2_.icon = "maxresdefault.jpg";
                }
                else
                {
                    _loc2_.label = "Much Wow!";
                    _loc2_.icon = "doge.png";
                }
                _loc1_.push(_loc2_);
                _loc3_++;
            }
            this.teamAwards = _loc1_;
            this.personalBests = _loc1_;
        }
    }
}
