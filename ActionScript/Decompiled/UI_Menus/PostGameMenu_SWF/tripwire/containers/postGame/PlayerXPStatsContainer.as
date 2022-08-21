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
    import tripwire.controls.TripTileList;
    import tripwire.controls.postGameMenu.PerkXPTileObject;
    import tripwire.menus.PostGameMenu;
    
    public class PlayerXPStatsContainer extends TripContainer
    {
        
        public static var PLAY_NEXT_ANIM = "PlayerNextAnim";
         
        
        public var perkXPList:TripTileList;
        
        public var scrollBar:ScrollBar;
        
        public var headerTextField:TextField;
        
        public var bAnimationsPlayed:Boolean;
        
        public var dataArray:Array;
        
        public const NUM_OF_PERKS = 10;
        
        public var currentAnimIndex:int = -1;
        
        public var currentXPContainer:PerkXPTileObject;
        
        public function PlayerXPStatsContainer()
        {
            super();
            enableInitCallback = true;
            defaultFirstElement = currentElement = this.scrollBar;
            this.scrollBar.tabIndex = 1;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            addEventListener(PLAY_NEXT_ANIM,this.playNextAnim,false,0,true);
        }
        
        public function playNextAnim(param1:Event = null) : void
        {
            ++this.currentAnimIndex;
            if(this.currentAnimIndex < this.perkXPList.dataProvider.length)
            {
                this.currentXPContainer = this.perkXPList.getRendererAt(this.currentAnimIndex) as PerkXPTileObject;
                if(this.currentXPContainer != null)
                {
                    if(this.currentXPContainer.animate())
                    {
                    }
                }
            }
            else
            {
                dispatchEvent(new Event(PostGameMenu.NEXT_PAGE));
            }
        }
        
        public function playAnimations() : void
        {
            if(!this.bAnimationsPlayed)
            {
                if(this.dataArray)
                {
                    this.xpList = this.dataArray;
                }
                this.bAnimationsPlayed = true;
            }
        }
        
        override protected function openAnimation(param1:Boolean = true) : *
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
        
        public function set xpList(param1:Array) : void
        {
            if(bOpen)
            {
                this.perkXPList.dataProvider = new DataProvider(param1);
                this.playNextAnim();
            }
            else
            {
                this.dataArray = param1;
            }
        }
    }
}
