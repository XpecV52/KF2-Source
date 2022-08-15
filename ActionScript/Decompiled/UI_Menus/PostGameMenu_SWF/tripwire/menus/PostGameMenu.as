package tripwire.menus
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import com.greensock.easing.Linear;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.text.TextField;
    import flash.utils.Timer;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.Button;
    import scaleform.clik.controls.ButtonBar;
    import scaleform.clik.controls.ScrollingList;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonBarEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.ui.InputDetails;
    import tripwire.Tools.TextfieldUtil;
    import tripwire.containers.PlayerNamePlateContainer;
    import tripwire.containers.TripContainer;
    import tripwire.containers.postGame.MapVoteContainer;
    import tripwire.containers.postGame.PlayerStatsContainer;
    import tripwire.containers.postGame.PostGameItemDropContainer;
    import tripwire.containers.postGame.PostGameSummaryContainer;
    import tripwire.containers.postGame.TeamAwardsContainer;
    import tripwire.controls.TripUILoader;
    
    public class PostGameMenu extends TripContainer
    {
        
        public static var NEXT_PAGE = "NextPage";
        
        public static var bkillAnims:Boolean = false;
         
        
        public var button:Button;
        
        public var currentMenu:TripContainer;
        
        public var playerStatsContainer:PlayerStatsContainer;
        
        public var playerXPContainer:PlayerXPStatsContainer;
        
        public var mapVoteContainer:MapVoteContainer;
        
        public var teamAwardsContainer:TeamAwardsContainer;
        
        public var chatBoxWidget:PlayerChatWidget;
        
        public var itemDropContainer:PostGameItemDropContainer;
        
        public var playerNamePlate:PlayerNamePlateContainer;
        
        public var summaryContainer:PostGameSummaryContainer;
        
        public var currentContainer:TripContainer;
        
        public var controllerIcon_Left:MovieClip;
        
        public var controllerIcon_Right:MovieClip;
        
        public var topButtonBar:ButtonBar;
        
        public const MENU_TEAM_AWARDS:int = 0;
        
        public const MENU_PLAYER_XP:int = 2;
        
        public const MENU_PLAYER_STATS:int = 1;
        
        public const MENU_MAP_VOTE:int = 3;
        
        public const MENU_MAX:int = 4;
        
        public var gameInfoText:TextField;
        
        public var playerLevelText:TextField;
        
        public var playerNameText:TextField;
        
        public var serverNameText:TextField;
        
        public var serverIPText:TextField;
        
        public var nextMapText:TextField;
        
        public var nextMapTimerText:TextField;
        
        public var mapVoteString:String;
        
        public var playerStatsString:String;
        
        public var teamAwardsString:String;
        
        public var xpString:String;
        
        public var barSlider:MovieClip;
        
        public var perkIconLoader:TripUILoader;
        
        public var playerSlotList:ScrollingList;
        
        private var _selectedMenu:int = -1;
        
        private var _nextMapTimer:Timer;
        
        private var _currentTime:int;
        
        private var playAnims:Boolean = true;
        
        public function PostGameMenu()
        {
            super();
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.nextMapText.text = !!param1.nextMap ? param1.nextMap : "";
                this.mapVoteString = !!param1.mapVote ? param1.mapVote : "_mapvote";
                this.playerStatsString = !!param1.playerStats ? param1.playerStats : "_playerstats";
                this.teamAwardsString = !!param1.teamAwards ? param1.teamAwards : "_teamAwards";
                this.xpString = !!param1.xp ? param1.xp : "_xp";
                this.serverNameText.text = !!param1.serverName ? param1.serverName : "";
                this.serverIPText.text = !!param1.serverIP ? param1.serverIP : "";
                this.itemDropContainer.dropTitleText.text = !!param1.dropTitle ? param1.dropTitle : "";
                this.tabButtons = [this.teamAwardsString,this.playerStatsString,this.xpString,this.mapVoteString];
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.updateIconVisibility();
            this.closeContainers();
            this.alpha = 0;
            this.openAnimation();
            this.topButtonBar.focusable = false;
            this.topButtonBar.addEventListener(ButtonBarEvent.BUTTON_SELECT,this.onButtonBarChange,false,0,true);
            stage.addEventListener(InputEvent.INPUT,this.handleUserInput,false,0,true);
            this._nextMapTimer = new Timer(1000);
            this._nextMapTimer.addEventListener(TimerEvent.TIMER,this.countdownTimer,false,0,true);
            this.chatBoxWidget.InitializeAsPartyChat();
            this.mapVoteContainer.postGameMenu = this;
            this.selectedMenu = 0;
            this.playerStatsContainer.addEventListener(NEXT_PAGE,this.nextPage,false,0,true);
            this.playerXPContainer.addEventListener(NEXT_PAGE,this.nextPage,false,0,true);
            this.teamAwardsContainer.addEventListener(NEXT_PAGE,this.nextPage,false,0,true);
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.updateIconVisibility();
        }
        
        public function travelToNextPage(param1:Event = null) : *
        {
            if(this.playAnims)
            {
                if(this._selectedMenu < this.MENU_MAX)
                {
                    this.selectedMenu = this._selectedMenu + 1;
                }
            }
        }
        
        public function nextPage(param1:Event = null) : void
        {
            var _loc2_:Timer = new Timer(1000,1);
            _loc2_.addEventListener(TimerEvent.TIMER_COMPLETE,this.travelToNextPage,false,0,true);
            _loc2_.start();
        }
        
        override public function openContainer() : void
        {
            super.openContainer();
            if(stage && !hasEventListener(InputEvent.INPUT))
            {
                stage.addEventListener(InputEvent.INPUT,this.handleUserInput,false,0,true);
            }
            if(this.currentMenu != null)
            {
                this.currentMenu.selectContainer();
            }
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            stage.removeEventListener(InputEvent.INPUT,this.handleUserInput);
        }
        
        public function handleUserInput(param1:InputEvent) : void
        {
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(param1.details.navEquivalent)
                {
                    case NavigationCode.RIGHT:
                        if(this._selectedMenu < this.MENU_MAX - 1)
                        {
                            this.selectedMenu = this._selectedMenu + 1;
                            this.playAnims = false;
                            bkillAnims = true;
                        }
                        break;
                    case NavigationCode.LEFT:
                        if(this._selectedMenu > 0)
                        {
                            this.selectedMenu = this._selectedMenu - 1;
                            this.playAnims = false;
                            bkillAnims = true;
                        }
                }
            }
        }
        
        public function set itemDrop(param1:Object) : void
        {
            if(this.itemDropContainer != null)
            {
                this.itemDropContainer.data = param1;
            }
        }
        
        public function set playerList(param1:Array) : void
        {
            if(param1)
            {
                this.playerSlotList.dataProvider = new DataProvider(param1);
                this.playerSlotList.dataProvider.invalidate();
            }
        }
        
        public function set gameSummary(param1:Object) : void
        {
            if(param1)
            {
                this.summaryContainer.data = param1;
            }
        }
        
        public function set playerInfo(param1:Object) : void
        {
            if(param1)
            {
                this.playerNamePlate.data = param1;
            }
        }
        
        public function set nextMapTime(param1:int) : void
        {
            this.nextMapTimerText.text = TextfieldUtil.instance.getFormattedTimeFromSeconds(param1);
        }
        
        public function onButtonBarChange(param1:ButtonBarEvent) : void
        {
            this.playAnims = false;
            bkillAnims = true;
            this.selectedMenu = param1.index;
        }
        
        public function set tabButtons(param1:Array) : void
        {
            this.topButtonBar.dataProvider = new DataProvider(param1);
        }
        
        public function closeContainers() : *
        {
            this.playerStatsContainer.visible = false;
            this.mapVoteContainer.visible = false;
            this.teamAwardsContainer.visible = false;
            this.playerXPContainer.visible = false;
        }
        
        public function set selectedMenu(param1:int) : void
        {
            var _loc2_:* = undefined;
            if(param1 != this._selectedMenu)
            {
                if(this.currentMenu != null)
                {
                    this.currentMenu.closeContainer();
                }
                switch(param1)
                {
                    case this.MENU_TEAM_AWARDS:
                        this.currentMenu = this.teamAwardsContainer;
                        break;
                    case this.MENU_PLAYER_STATS:
                        this.currentMenu = this.playerStatsContainer;
                        break;
                    case this.MENU_MAP_VOTE:
                        this.currentMenu = this.mapVoteContainer;
                        break;
                    case this.MENU_PLAYER_XP:
                        this.currentMenu = this.playerXPContainer;
                }
                this.currentMenu.openContainer();
                this._selectedMenu = param1;
                this.topButtonBar.selectedIndex = this._selectedMenu;
                _loc2_ = this.topButtonBar.getButtonAt(this._selectedMenu);
                if(_loc2_)
                {
                    TweenMax.killTweensOf(this.barSlider);
                    TweenMax.fromTo(this.barSlider,4,{
                        "x":this.barSlider.x,
                        "ease":Cubic.easeOut,
                        "useFrames":true
                    },{
                        "x":_loc2_.x + this.topButtonBar.x,
                        "ease":Cubic.easeOut,
                        "useFrames":true
                    });
                }
            }
        }
        
        public function set remainingTime(param1:int) : void
        {
            this._currentTime = param1 - 1;
            this.nextMapTime = param1;
            this._nextMapTimer.repeatCount = param1;
            this._nextMapTimer.reset();
            this._nextMapTimer.start();
        }
        
        private function countdownTimer(param1:TimerEvent) : void
        {
            this._currentTime = Math.max(this._currentTime - 1,0);
            this.nextMapTime = this._currentTime;
        }
        
        override protected function openAnimation() : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,ANIM_TIME,{
                "z":ANIM_OFFSET_Z,
                "alpha":0,
                "ease":Linear.easeNone,
                "useFrames":true
            },{
                "z":ANIM_START_Z,
                "alpha":_defaultAlpha,
                "ease":Linear.easeNone,
                "useFrames":true,
                "onComplete":onOpened
            });
        }
        
        override protected function closeAnimation() : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,ANIM_TIME,{
                "z":ANIM_START_Z,
                "alpha":_defaultAlpha,
                "ease":Linear.easeNone,
                "useFrames":true
            },{
                "z":ANIM_OFFSET_Z,
                "alpha":0,
                "ease":Linear.easeNone,
                "useFrames":true,
                "onComplete":onClosed
            });
        }
        
        override protected function pushToBackAnimation() : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,ANIM_TIME,{
                "z":ANIM_START_Z,
                "alpha":_defaultAlpha,
                "ease":Linear.easeNone,
                "useFrames":true
            },{
                "z":ANIM_OFFSET_Z,
                "alpha":0,
                "ease":Linear.easeNone,
                "useFrames":true,
                "onComplete":onClosed
            });
        }
        
        public function updateIconVisibility() : void
        {
            this.controllerIcon_Left.visible = bManagerUsingGamepad;
            this.controllerIcon_Right.visible = bManagerUsingGamepad;
        }
    }
}
