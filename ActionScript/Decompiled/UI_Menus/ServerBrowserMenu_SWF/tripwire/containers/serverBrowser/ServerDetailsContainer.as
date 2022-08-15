package tripwire.containers.serverBrowser
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.ScrollingList;
    import scaleform.clik.controls.UILoader;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import tripwire.containers.TripSubContainer;
    import tripwire.controls.TripButton;
    
    public class ServerDetailsContainer extends TripSubContainer
    {
         
        
        public var favoriteButton:TripButton;
        
        public var refreshButton:TripButton;
        
        public var backButton:TripButton;
        
        public var mapImageLoader:UILoader;
        
        public var playerList:ScrollingList;
        
        public var matchStatusText:TextField;
        
        public var mapNameText:TextField;
        
        public var gameModeDifficultyText:TextField;
        
        public var playersText:TextField;
        
        public var playerCountText:TextField;
        
        public var waveText:TextField;
        
        public var waveCountText:TextField;
        
        public var vacLabelText:TextField;
        
        public var vacValueText:TextField;
        
        public var zedCountLabelText:TextField;
        
        public var rankedLabelText:TextField;
        
        public var zedCountText:TextField;
        
        public var mutatorsLabelText:TextField;
        
        public var mutatorsValueText:TextField;
        
        public var favoriteString:String;
        
        public var unfavoriteString:String;
        
        public var titleText:TextField;
        
        public var serverNameText:TextField;
        
        public var serverIPText:TextField;
        
        public var rankedString:String;
        
        public var unrankedString:String;
        
        public var rankedIcon:MovieClip;
        
        public function ServerDetailsContainer()
        {
            super();
            ANIM_OFFSET_X = 0;
            this.refreshButton.visible = false;
            this.vacLabelText.visible = false;
            this.vacValueText.visible = false;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.waveText.text = param1.wave;
            this.playersText.text = param1.players;
            this.vacLabelText.text = param1.vacSecure;
            this.zedCountLabelText.text = param1.zedCount;
            this.mutatorsLabelText.text = param1.mutators;
            this.rankedString = param1.ranked;
            this.unrankedString = param1.unranked;
            this.titleText.text = param1.serverInfo;
            this.favoriteButton.label = param1.favorite;
            this.favoriteString = !!param1.favorite ? param1.favorite : "";
            this.unfavoriteString = !!param1.unfavorite ? param1.unfavorite : "";
        }
        
        public function set serverDetails(param1:Object) : void
        {
            if(param1)
            {
                this.matchStatusText.text = !!param1.gameStatus ? param1.gameStatus : "";
                this.gameModeDifficultyText.text = (!!param1.mode ? param1.mode : "") + " - " + (!!param1.difficulty ? param1.difficulty : "");
                this.playerCountText.text = (!!param1.playerCount ? param1.playerCount : "0") + "/" + (!!param1.maxPlayerCount ? param1.maxPlayerCount : "0");
                this.waveCountText.text = (!!param1.waveCount ? param1.waveCount : "0") + "/" + (!!param1.maxWaveCount ? param1.maxWaveCount : "0");
                this.zedCountText.text = (!!param1.zedCount ? param1.zedCount : "0") + "/" + (!!param1.maxZedCount ? param1.maxZedCount : "0");
                this.vacValueText.text = !!param1.vacEnable ? param1.vacEnable : "";
                this.mutatorsValueText.text = !!param1.mutators ? param1.mutators : "";
                this.rankedLabelText.text = !!param1.ranked ? this.rankedString : this.unrankedString;
                this.rankedIcon.gotoAndStop(!!param1.ranked ? 1 : 2);
                this.mapNameText.text = !!param1.map ? param1.map : "";
                this.mapImagePath = !!param1.mapImagePath ? param1.mapImagePath : "";
                this.serverNameText.text = !!param1.serverName ? param1.serverName : "";
                this.serverIPText.text = !!param1.serverIP ? param1.serverIP : "";
                this.playersData = !!param1.playersData ? param1.playersData : null;
                if(visible)
                {
                }
            }
            else if(!visible)
            {
            }
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            this.favoriteButton.addEventListener(ButtonEvent.CLICK,this.onButtonClick,false,0,true);
            this.refreshButton.addEventListener(ButtonEvent.CLICK,this.onButtonClick,false,0,true);
            this.backButton.addEventListener(ButtonEvent.CLICK,this.onButtonClick,false,0,true);
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            this.favoriteButton.removeEventListener(ButtonEvent.CLICK,this.onButtonClick);
            this.refreshButton.removeEventListener(ButtonEvent.CLICK,this.onButtonClick);
            this.backButton.removeEventListener(ButtonEvent.CLICK,this.onButtonClick);
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.initFocusables();
            defaultFirstElement = this.refreshButton;
            this.favoriteButton.preventAutosizing = true;
            this.setTabIndexes();
        }
        
        private function setTabIndexes() : *
        {
            this.refreshButton.tabIndex = 1;
            this.favoriteButton.tabIndex = 2;
        }
        
        private function initFocusables() : *
        {
            this.playerList.focusable = false;
            this.mapImageLoader.focusable = false;
            focusable = false;
        }
        
        public function onButtonClick(param1:ButtonEvent) : *
        {
            switch(param1.currentTarget)
            {
                case this.backButton:
                    dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
                    break;
                case this.favoriteButton:
                    ExternalInterface.call("CallBack_ServerFavorited",this.favoriteButton.selected);
                    break;
                case this.refreshButton:
                    ExternalInterface.call("CallBack_ServerRefesh");
            }
        }
        
        public function set favoriteButtonSelected(param1:Boolean) : void
        {
            this.favoriteButton.selected = param1;
            if(param1)
            {
                this.favoriteButton.label = this.unfavoriteString;
            }
            else
            {
                this.favoriteButton.label = this.favoriteString;
            }
        }
        
        public function get favoriteButtonSelected() : Boolean
        {
            return this.favoriteButton.selected;
        }
        
        public function set playersData(param1:Array) : void
        {
            if(param1)
            {
                this.playerList.dataProvider = new DataProvider(param1);
            }
        }
        
        public function set mapImagePath(param1:String) : void
        {
            if(param1 && param1 != "")
            {
                this.mapImageLoader.source = param1;
            }
        }
        
        override protected function openAnimation() : *
        {
            TweenMax.fromTo(this,6,{
                "z":-128,
                "autoAlpha":0,
                "blurFilter":{
                    "blurX":12,
                    "blurY":12,
                    "quality":1
                }
            },{
                "z":0,
                "autoAlpha":1,
                "blurFilter":{
                    "blurX":0,
                    "blurY":0,
                    "quality":1,
                    "remove":true
                },
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":onOpened
            });
        }
        
        override protected function closeAnimation() : *
        {
            TweenMax.fromTo(this,6,{
                "z":0,
                "alpha":1
            },{
                "visible":false,
                "z":-128,
                "alpha":0,
                "blurFilter":{
                    "blurX":12,
                    "blurY":12,
                    "quality":1,
                    "remove":true
                },
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":onClosed
            });
        }
    }
}
