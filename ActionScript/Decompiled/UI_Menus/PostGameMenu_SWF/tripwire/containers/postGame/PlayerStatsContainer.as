package tripwire.containers.postGame
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Linear;
    import com.greensock.events.TweenEvent;
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.controls.ScrollBar;
    import scaleform.clik.data.DataProvider;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripScrollArea;
    import tripwire.menus.PostGameMenu;
    
    public class PlayerStatsContainer extends TripContainer
    {
        
        public static var PLAY_NEXT_ANIM = "PlayerNextAnim";
         
        
        public var playerStatsTextField:TextField;
        
        public var topWeaponsTextField:TextField;
        
        public var zedKillsHeaderTextField:TextField;
        
        public var scrollBar:ScrollBar;
        
        public var playerStatsList:TripScrollArea;
        
        public var maxAwardsShown:int = 4;
        
        public var bAnimationsPlayed:Boolean;
        
        public var playerGeneralStatsList;
        
        public var topWeaponContainer;
        
        public var currentStatAnimIndex:int = -1;
        
        public var topWeaponAnimIndex:int = -1;
        
        private const GerneralStatObjects:int = 6;
        
        public const scrollAmount:Number = 688;
        
        public const playerStatsTextX:int = 3;
        
        public const playerStatsTextY:int = -7;
        
        public const playerGeneralStatsY:Number = 32;
        
        public const topWeaponsTextY:int = 160;
        
        public const topWeaponContainerY:Number = 208;
        
        public const zedKillsHeaderTextY:int = 681;
        
        public const scrollHeight = 1376;
        
        public function PlayerStatsContainer()
        {
            super();
        }
        
        public function playAnimations() : void
        {
            if(!this.bAnimationsPlayed)
            {
                this.bAnimationsPlayed = true;
                this.playNextAnim();
            }
        }
        
        public function playNextAnim(param1:Event = null) : void
        {
            var _loc2_:* = undefined;
            if(this.currentStatAnimIndex < this.playerGeneralStatsList.playerGeneralStatsList.dataProvider.length - 1)
            {
                ++this.currentStatAnimIndex;
                _loc2_ = this.playerGeneralStatsList.playerGeneralStatsList.getRendererAt(this.currentStatAnimIndex);
            }
            else if(this.topWeaponAnimIndex < this.topWeaponContainer.topWeaponList.dataProvider.length - 1)
            {
                ++this.topWeaponAnimIndex;
                _loc2_ = this.topWeaponContainer.topWeaponList.getRendererAt(this.topWeaponAnimIndex);
            }
            else
            {
                dispatchEvent(new Event(PostGameMenu.NEXT_PAGE));
            }
            if(_loc2_ != null)
            {
                _loc2_.awardAnimIn(PostGameMenu.bkillAnims);
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.playerStatsList.addDisplayObject(this.playerStatsTextField);
            this.playerStatsTextField.y = this.playerStatsTextY;
            this.playerStatsList.addDisplayObject(this.playerGeneralStatsList);
            this.playerGeneralStatsList.y = this.playerGeneralStatsY;
            this.playerStatsList.addDisplayObject(this.topWeaponsTextField);
            this.topWeaponsTextField.y = this.topWeaponsTextY;
            this.playerStatsList.addDisplayObject(this.topWeaponContainer);
            this.topWeaponContainer.y = this.topWeaponContainerY;
            this.playerStatsList.addDisplayObject(this.zedKillsHeaderTextField);
            this.zedKillsHeaderTextField.y = this.zedKillsHeaderTextY;
            this.playerStatsTextField.x = this.playerStatsTextX;
            this.topWeaponsTextField.x = this.playerStatsTextX;
            this.zedKillsHeaderTextField.x = this.playerStatsTextX;
            this.setScrollSize();
            this.playerGeneralStatsList.addEventListener(PLAY_NEXT_ANIM,this.playNextAnim,false,0,true);
            this.topWeaponContainer.addEventListener(PLAY_NEXT_ANIM,this.playNextAnim,false,0,true);
            this.playerStatsList.scrollBar.scrollRate = this.scrollAmount;
            this.playerStatsList.stepSize = this.scrollAmount;
            defaultFirstElement = currentElement = this.playerStatsList.scrollBar;
            this.playerStatsList.scrollBar.tabIndex = 1;
        }
        
        override protected function openAnimation() : *
        {
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
                "onComplete":this.onOpened
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
        
        override protected function onOpened(param1:TweenEvent = null) : void
        {
            super.onOpened(param1);
            this.playAnimations();
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.playerStatsTextField.text = !!param1.playerStats ? param1.playerStats : "";
                this.zedKillsHeaderTextField.text = !!param1.zedKills ? param1.zedKills : "";
                this.topWeaponsTextField.text = !!param1.topWeapons ? param1.topWeapons : "";
            }
        }
        
        override public function openContainer() : void
        {
            super.openContainer();
            this.playerStatsList.enabled = true;
        }
        
        public function set topWeapons(param1:Array) : void
        {
            this.topWeaponContainer.topWeaponList.dataProvider = new DataProvider(param1);
        }
        
        public function set playerAdvancedStats(param1:Array) : void
        {
            this.playerStatsList.Data = param1;
            this.setScrollSize();
        }
        
        public function setScrollSize() : void
        {
            this.playerStatsList.scrollObject.height = this.scrollHeight;
            this.playerStatsList.updateScrollSize();
        }
        
        public function set playerGeneralStats(param1:Array) : void
        {
            this.playerGeneralStatsList.playerGeneralStatsList.dataProvider = new DataProvider(param1);
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            this.playerStatsList.enabled = false;
        }
    }
}
