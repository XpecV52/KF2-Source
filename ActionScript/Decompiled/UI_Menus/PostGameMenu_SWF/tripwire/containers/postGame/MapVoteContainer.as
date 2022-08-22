package tripwire.containers.postGame
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Linear;
    import com.greensock.events.TweenEvent;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.ScrollingList;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.FocusManager;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripUILoaderQueue;
    import tripwire.menus.PostGameMenu;
    
    public class MapVoteContainer extends TripContainer
    {
         
        
        public var mapVoteList:ScrollingList;
        
        public var _currentLoadedImageIndex:int = -1;
        
        public var _currentSelectedMapIndex:int = -1;
        
        public var yourMapVoteIndex:int = -1;
        
        public var mapImageLoader:TripUILoaderQueue;
        
        public var votedMapNameText:TextField;
        
        public var currentVotesList:ScrollingList;
        
        public const maxVotesShown:int = 3;
        
        public var yourVoteText:TextField;
        
        public var mapListTextfield:TextField;
        
        public var topVoteText:TextField;
        
        public var postGameMenu:PostGameMenu;
        
        public var bAnimationsPlayed:Boolean;
        
        public function MapVoteContainer()
        {
            super();
            defaultFirstElement = this.mapVoteList;
            currentElement = this.mapVoteList;
            this.mapVoteList.tabIndex = 1;
            this.closeContainer();
        }
        
        public function playAnimations() : void
        {
            if(this.bAnimationsPlayed)
            {
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
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.topVoteText.text = !!param1.topVotes ? param1.topVotes : "";
                this.yourVoteText.text = !!param1.yourVote ? param1.yourVote : "";
                this.mapListTextfield.text = !!param1.mapList ? param1.mapList : "";
            }
        }
        
        override public function openContainer(param1:Boolean = true) : void
        {
            super.openContainer();
            this.mapVoteList.addEventListener(ListEvent.ITEM_ROLL_OVER,this.onItemRollOver,false,0,true);
            this.mapVoteList.addEventListener(ListEvent.INDEX_CHANGE,this.onItemRollOver,false,0,true);
            this.mapVoteList.addEventListener(ListEvent.ITEM_PRESS,this.mapSelected,false,0,true);
            this.mapVoteList.addEventListener(ListEvent.ITEM_DOUBLE_CLICK,this.mapSelectedDoubleClick,false,0,true);
            this.mapVoteList.addEventListener(MouseEvent.MOUSE_OUT,this.mouseOffMapVote,false,0,true);
        }
        
        override protected function onOpened(param1:TweenEvent = null) : void
        {
            super.onOpened(param1);
            this.playAnimations();
            if(this.mapVoteList.selectedIndex == -1)
            {
                if(!bManagerUsingGamepad)
                {
                    this.mapVoteList.selectedIndex = -1;
                    this.mapVoteList.invalidateSelectedIndex();
                }
                else if(bManagerUsingGamepad)
                {
                    this.mapVoteList.selectedIndex = 0;
                    this.mapVoteList.invalidateSelectedIndex();
                }
            }
            if(!bManagerPopUpOpen)
            {
                FocusManager.setFocus(this.mapVoteList);
            }
        }
        
        public function mouseOffMapVote(param1:MouseEvent) : void
        {
            this.onItemRollOver(null);
        }
        
        public function set currentVotes(param1:Array) : void
        {
            if(param1)
            {
                if(param1.length > this.maxVotesShown)
                {
                    param1.length = this.maxVotesShown;
                }
                this.currentVotesList.dataProvider = new DataProvider(param1);
            }
        }
        
        public function set mapChoices(param1:Array) : void
        {
            if(param1)
            {
                this.mapVoteList.dataProvider = new DataProvider(param1);
            }
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            if(param1.handled)
            {
                return;
            }
            super.handleInput(param1);
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_A:
                        if(this.mapVoteList.selectedIndex != -1)
                        {
                            this.castVote(this.mapVoteList.selectedIndex);
                        }
                }
            }
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            this.mapVoteList.removeEventListener(ListEvent.ITEM_ROLL_OVER,this.onItemRollOver);
            this.mapVoteList.removeEventListener(ListEvent.INDEX_CHANGE,this.onItemRollOver);
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        public function setTabIndexOnElements() : *
        {
            this.mapVoteList.tabIndex = 1;
        }
        
        private function onItemRollOver(param1:ListEvent = null) : *
        {
            var _loc3_:Object = null;
            var _loc4_:int = 0;
            var _loc2_:TripUILoaderQueue = this.mapImageLoader;
            if(this.mapVoteList.dataProvider.length == 0)
            {
                return;
            }
            if(param1 != null)
            {
                _loc4_ = param1.index;
            }
            else
            {
                _loc4_ = this._currentSelectedMapIndex;
            }
            if(_loc4_ != this._currentLoadedImageIndex && _loc4_ != -1)
            {
                this._currentLoadedImageIndex = _loc4_;
                if(this.yourMapVoteIndex == -1)
                {
                    this.mapSource = this.mapVoteList.dataProvider.requestItemAt(_loc4_).mapSource;
                }
            }
        }
        
        public function mapSelected(param1:ListEvent) : void
        {
            this._currentSelectedMapIndex = param1.index;
            this.castVote(param1.index);
        }
        
        public function mapSelectedDoubleClick(param1:ListEvent) : void
        {
            this._currentSelectedMapIndex = param1.index;
            this.castVote(param1.index,true);
        }
        
        public function castVote(param1:int, param2:Boolean = false) : void
        {
            this.yourMapVoteIndex = param1;
            ExternalInterface.call("Callback_MapVote",param1,param2);
            this.votedMapNameText.text = this.mapVoteList.dataProvider.requestItemAt(param1).label;
            this.mapSource = this.mapVoteList.dataProvider.requestItemAt(this.yourMapVoteIndex).mapSource;
        }
        
        public function set mapSource(param1:String) : *
        {
            var _loc2_:TripUILoaderQueue = this.mapImageLoader;
            var _loc3_:String = param1;
            if(_loc3_ != _loc2_.source)
            {
                _loc2_.source = param1;
            }
        }
        
        public function makeFakeMapChoices() : *
        {
            var _loc1_:Object = {
                "label":"Live or Die",
                "mapSource":"maxresdefault.jpg"
            };
            var _loc2_:Object = {
                "label":"Doge",
                "mapSource":"doge.png"
            };
            var _loc3_:Array = new Array();
            var _loc4_:Array = new Array();
            var _loc5_:int = 0;
            while(_loc5_ < 100)
            {
                if(_loc5_ % 2 == 0)
                {
                    _loc3_.push({
                        "label":"Live or Die",
                        "mapSource":"maxresdefault.jpg"
                    });
                }
                else
                {
                    _loc3_.push({
                        "label":"Doge",
                        "mapSource":"doge.png"
                    });
                }
                _loc5_++;
            }
            this.mapChoices = _loc3_;
            var _loc6_:Object = {
                "label":"Live or Die",
                "secondaryText":"2"
            };
            var _loc7_:Object = {
                "label":"Doge",
                "secondaryText":"1"
            };
            _loc4_ = [_loc6_,_loc7_];
            this.currentVotes = _loc4_;
        }
    }
}
