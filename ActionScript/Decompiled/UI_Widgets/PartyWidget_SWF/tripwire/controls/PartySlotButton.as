package tripwire.controls
{
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import scaleform.clik.controls.UILoader;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.managers.FocusHandler;
    import scaleform.gfx.TextFieldEx;
    import tripwire.containers.TripContainer;
    import tripwire.managers.MenuManager;
    
    public class PartySlotButton extends TripButton
    {
         
        
        public var optionsList:TripScrollingList;
        
        public var leaderIcon:MovieClip;
        
        public var voipIcon:MovieClip;
        
        public var mutedIcon:MovieClip;
        
        public var BG:MovieClip;
        
        public var orangeBG:MovieClip;
        
        public var HighlightBG:MovieClip;
        
        public var addPlayerImage:MovieClip;
        
        public var addPlayerHighLight:MovieClip;
        
        public var addPlayerBlackBG:MovieClip;
        
        public var addPlayerRedBG:MovieClip;
        
        public var HitboxMC:MovieClip;
        
        public var AddHitboxMC:MovieClip;
        
        public var profileLoader:UILoader;
        
        public var profileImageContainer:MovieClip;
        
        public var perkIconLoader:UILoader;
        
        public var perkIconLoaderContainer:MovieClip;
        
        public var perkLevelText:TextField;
        
        public var playerNameText:TextField;
        
        protected var _activeList:MovieClip;
        
        private var _type:String;
        
        private var _bIsMyPlayer;
        
        private var _bIsLeader;
        
        private var _bIsOccupied:Boolean;
        
        public var slotIndex:int;
        
        public var activeColor:uint = 16503487;
        
        public var inactiveColor:uint = 12234399;
        
        public var iconTint:Color;
        
        public var humanColor:uint = 12255231;
        
        public var zedColor:uint = 12453376;
        
        public var playerNameFormat:TextFormat;
        
        private const PLAYER_NAME_SIZE_OFFSET:int = 5;
        
        private const PS4_NAME_LIMIT:int = 16;
        
        public var playerNameOriginalSize:int;
        
        public var currentPlayerNameString:String;
        
        private var _bIsMuted:Boolean;
        
        var previousTeamID:int;
        
        public function PartySlotButton()
        {
            this.iconTint = new Color();
            this.playerNameFormat = new TextFormat();
            super();
            preventAutosizing = true;
            this.ready = false;
            this.profileLoader = UILoader(this.profileImageContainer.profileLoader);
            this.perkIconLoader = UILoader(this.perkIconLoaderContainer.perkIconLoader);
            this.isMuted = false;
            this.playerNameFormat = this.playerNameText.defaultTextFormat;
            this.playerNameOriginalSize = int(this.playerNameFormat.size);
            TextFieldEx.setVerticalAlign(this.playerNameText,TextFieldEx.VALIGN_CENTER);
        }
        
        override public function set data(param1:Object) : void
        {
            super.data = param1;
            if(param1)
            {
                this.bIsOccupied = true;
                this.perkLevelText.text = !!param1.perkLevel ? param1.perkLevel : "";
                this.perkImageSource = !!param1.perkIconPath ? param1.perkIconPath : "";
                this.playerNameString = !!param1.playerName ? param1.playerName : "";
                this.profileImageSource = !!param1.profileImageSource ? param1.profileImageSource : "";
                this.isMuted = !!param1.muted ? Boolean(param1.muted) : false;
                this.ready = !!param1.ready ? Boolean(param1.ready) : false;
                this.bIsLeader = !!param1.bLeader ? Boolean(param1.bLeader) : false;
            }
            else
            {
                this.perkLevelText.text = "";
                this.perkImageSource = "";
                this.profileImageSource = "";
                this.playerNameText.text = "";
                this.isMuted = false;
                this.ready = false;
                this.bIsLeader = false;
                this.bIsOccupied = false;
            }
        }
        
        override public function set selected(param1:Boolean) : void
        {
            super.selected = param1;
            if(param1)
            {
                this.HighlightBG.alpha = 1;
            }
            else
            {
                this.HighlightBG.alpha = 0;
            }
        }
        
        public function set activeList(param1:MovieClip) : void
        {
            this._activeList = param1;
            this.optionsList = TripScrollingList(param1);
            this.optionsList.addEventListener(IndexEvent.INDEX_CHANGE,this.onBack);
        }
        
        public function get activeList() : MovieClip
        {
            return this._activeList;
        }
        
        public function set team(param1:int) : void
        {
            if(this.previousTeamID != param1)
            {
                this.previousTeamID = param1;
                if(param1 == 255)
                {
                    this.perkLevelText.textColor = this.zedColor;
                    this.playerNameText.textColor = this.zedColor;
                    this.iconTint.setTint(this.zedColor,1);
                    this.perkIconLoaderContainer.transform.colorTransform = this.iconTint;
                    this.activeColor = this.zedColor;
                    this.inactiveColor = this.zedColor;
                }
                else
                {
                    this.perkLevelText.textColor = this.humanColor;
                    this.playerNameText.textColor = this.humanColor;
                    this.iconTint.setTint(this.humanColor,1);
                    this.perkIconLoaderContainer.transform.colorTransform = this.iconTint;
                    this.activeColor = this.humanColor;
                    this.inactiveColor = this.humanColor;
                }
                this.playerNameFormat.color = this.activeColor;
                this.playerNameText.setTextFormat(this.playerNameFormat);
            }
        }
        
        override protected function highlightButton() : *
        {
            super.highlightButton();
            this.HighlightBG.alpha = 1;
        }
        
        override protected function unhighlightButton() : *
        {
            super.unhighlightButton();
            this.HighlightBG.alpha = 0;
        }
        
        public function set bIsOccupied(param1:Boolean) : void
        {
            this._bIsOccupied = param1;
            if(this.BG)
            {
                this.BG.visible = param1;
            }
            if(param1 == false)
            {
                this.isMuted = false;
                this.isTalking = false;
            }
            this.profileImageContainer.visible = param1;
            this.orangeBG.visible = param1;
            this.HitboxMC.visible = param1;
            this.playerNameText.visible = param1;
            this.perkIconLoader.visible = param1;
            this.perkLevelText.visible = param1;
            this.HighlightBG.visible = param1;
            this.addPlayerImage.visible = !param1;
            this.addPlayerHighLight.visible = !param1;
            this.addPlayerBlackBG.visible = !param1;
            this.addPlayerRedBG.visible = !param1;
            this.AddHitboxMC.visible = !param1;
        }
        
        public function get bIsOccupied() : Boolean
        {
            return this._bIsOccupied;
        }
        
        public function get bIsMyPlayer() : Boolean
        {
            return this._bIsMyPlayer;
        }
        
        public function set bIsMyPlayer(param1:Boolean) : void
        {
            if(this._bIsMyPlayer == param1)
            {
                return;
            }
            if(this.optionsList != null)
            {
                this._activeList = this.optionsList;
            }
            this.isTalking = false;
            this._bIsMyPlayer = param1;
        }
        
        public function get bIsLeader() : Boolean
        {
            return this._bIsLeader;
        }
        
        public function set bIsLeader(param1:Boolean) : void
        {
            this._bIsLeader = param1;
            if(this.leaderIcon != null)
            {
                this.leaderIcon.visible = param1;
            }
        }
        
        public function set playerNameString(param1:String) : void
        {
            var _loc2_:int = 0;
            var _loc3_:int = 0;
            this.playerNameText.text = param1;
            this.playerNameFormat.size = this.playerNameOriginalSize;
            this.playerNameText.setTextFormat(this.playerNameFormat);
            if(this.playerNameText.textWidth > this.playerNameText.width)
            {
                this.playerNameFormat.size = this.playerNameOriginalSize - this.PLAYER_NAME_SIZE_OFFSET;
                this.playerNameText.setTextFormat(this.playerNameFormat);
                if(param1.length > this.PS4_NAME_LIMIT)
                {
                    _loc2_ = this.playerNameText.getCharIndexAtPoint(this.playerNameText.width - 16,this.playerNameText.height / 2);
                    _loc3_ = this.playerNameText.getCharIndexAtPoint(this.playerNameText.width - 2,this.playerNameText.height / 2);
                    _loc3_ -= _loc3_ < param1.length ? _loc3_ - _loc2_ : 0;
                    this.playerNameText.text = param1.slice(0,_loc3_);
                    this.playerNameText.appendText(_loc3_ < param1.length ? "..." : "");
                    this.playerNameText.setTextFormat(this.playerNameFormat);
                }
            }
        }
        
        public function handleGamePadB() : Boolean
        {
            if(this._activeList != null && this._activeList.visible && this._activeList.associatedButton == this)
            {
                this.closeList();
                return true;
            }
            return false;
        }
        
        public function updatePerk(param1:String, param2:String, param3:String) : *
        {
            if(param1 && param1 != "")
            {
                this.bIsOccupied = true;
            }
            this.perkLevelText.text = param2 + " " + param1;
            this.perkImageSource = param3;
        }
        
        public function set profileImageSource(param1:String) : *
        {
            if(param1 && param1 != "")
            {
                this.profileImageContainer.visible = true;
                this.profileImageContainer.profileLoader.source = param1;
            }
            else
            {
                this.profileImageContainer.visible = false;
            }
        }
        
        public function get profileImageSource() : String
        {
            return this.profileImageContainer.profileLoader.source;
        }
        
        public function set perkImageSource(param1:String) : *
        {
            if(param1 && param1 != "")
            {
                this.perkIconLoader.visible = true;
                this.perkIconLoaderContainer.perkIconLoader.source = param1;
            }
            else
            {
                this.perkIconLoader.visible = false;
            }
        }
        
        public function set ready(param1:Boolean) : *
        {
            if(param1)
            {
                this.HighlightBG.gotoAndStop(2);
                this.orangeBG.gotoAndStop(2);
            }
            if(!param1)
            {
                this.HighlightBG.gotoAndStop(1);
                this.orangeBG.gotoAndStop(1);
            }
        }
        
        public function set isTalking(param1:Boolean) : *
        {
            if(!this._bIsMuted)
            {
                this.voipIcon.visible = param1 && this._bIsOccupied;
            }
        }
        
        public function set isMuted(param1:Boolean) : *
        {
            this._bIsMuted = param1;
            if(this._bIsMuted && this.voipIcon.visible)
            {
                this.voipIcon.visible = false;
            }
            this.mutedIcon.visible = this._bIsMuted;
        }
        
        override public function set visible(param1:Boolean) : void
        {
            super.visible = param1;
        }
        
        public function openList() : *
        {
            if((this._activeList as TripScrollingList).dataProvider.length > 0)
            {
                mouseEnabled = false;
                mouseChildren = true;
                this._activeList.bOpen = true;
                this._activeList.associatedButton = this;
            }
        }
        
        public function closeList() : *
        {
            if(this._activeList.bOpen && this._activeList.associatedButton == this)
            {
                this.optionsList.removeEventListener(IndexEvent.INDEX_CHANGE,this.onBack);
                this._activeList.associatedButton = null;
                mouseEnabled = true;
                mouseChildren = false;
                this._activeList.bOpen = false;
                if(!MenuManager.manager.bPopUpOpen)
                {
                    FocusHandler.getInstance().setFocus(this);
                }
            }
        }
        
        public function onBack(param1:IndexEvent) : *
        {
            if(param1.index != TripContainer.CANCELLED_INDEX)
            {
                if(this.optionsList)
                {
                    ExternalInterface.call("Callback_ProfileOption",this.optionsList.dataProvider.requestItemAt(param1.index).optionKey,this.slotIndex);
                }
            }
            this.closeList();
        }
        
        public function tintItems(param1:uint) : *
        {
            this.iconTint.setTint(param1,1);
            this.perkIconLoaderContainer.transform.colorTransform = this.iconTint;
            this.perkLevelText.textColor = param1;
        }
        
        public function get leaderText() : String
        {
            return this.leaderIcon.leaderText.text;
        }
        
        public function set leaderText(param1:String) : *
        {
        }
    }
}
