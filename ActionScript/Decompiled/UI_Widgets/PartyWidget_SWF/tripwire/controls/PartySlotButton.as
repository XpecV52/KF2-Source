package tripwire.controls
{
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.UILoader;
    import scaleform.clik.events.IndexEvent;
    import tripwire.containers.TripContainer;
    
    public class PartySlotButton extends TripButton
    {
         
        
        public var optionsList:TripScrollingList;
        
        public var perksList:TripScrollingList;
        
        public var leaderIcon:MovieClip;
        
        public var voipIcon:MovieClip;
        
        public var BG:MovieClip;
        
        public var orangeBG:MovieClip;
        
        public var HighlightBG:MovieClip;
        
        public var addPlayerImage:MovieClip;
        
        public var addPlayerHighLight:MovieClip;
        
        public var addPlayerBlackBG:MovieClip;
        
        public var addPlayerRedBG:MovieClip;
        
        public var HitboxMC:MovieClip;
        
        public var AddHitboxMC:MovieClip;
        
        public var profileImageContainer:MovieClip;
        
        public var perkIconLoader:UILoader;
        
        public var perkIconLoaderContainer:MovieClip;
        
        public var perkLevelText:TextField;
        
        public var playerNameText:TextField;
        
        public var activeList:MovieClip;
        
        private var _type:String;
        
        private var _bIsMyPlayer;
        
        private var _bIsLeader;
        
        private var _bIsOccupied:Boolean;
        
        public var slotIndex:int;
        
        private var activeColor:uint = 16503487;
        
        private var inactiveColor:uint = 12234399;
        
        private var iconTint:Color;
        
        public function PartySlotButton()
        {
            this.iconTint = new Color();
            super();
            doAnimations = true;
            preventAutosizing = true;
            this.ready = false;
            this.perkIconLoader = this.perkIconLoaderContainer.perkIconLoader;
            this.tintItems(this.inactiveColor);
        }
        
        override public function set selected(param1:Boolean) : void
        {
            super.selected = param1;
            if(param1)
            {
                this.HighlightBG.alpha = 1;
                this.tintItems(this.activeColor);
            }
            else
            {
                this.HighlightBG.alpha = 0;
                this.tintItems(this.inactiveColor);
            }
        }
        
        override protected function highlightButton() : *
        {
            super.highlightButton();
            this.HighlightBG.alpha = 1;
            this.tintItems(this.activeColor);
            if(doAnimations)
            {
                this.HitboxMC.z = 32;
            }
        }
        
        override protected function unhighlightButton() : *
        {
            super.unhighlightButton();
            this.HighlightBG.alpha = 0;
            this.tintItems(this.inactiveColor);
            if(doAnimations)
            {
                this.HitboxMC.z = 0;
            }
        }
        
        public function set bIsOccupied(param1:Boolean) : void
        {
            this._bIsOccupied = param1;
            if(this.BG)
            {
                this.BG.visible = param1;
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
            this.optionsList.visible = false;
            this.perksList.visible = false;
            this.isTalking = false;
            this._bIsMyPlayer = param1;
            this.activeList = !!param1 ? this.perksList : this.optionsList;
            this.activeList.addEventListener(IndexEvent.INDEX_CHANGE,this.onBack);
            this.activeList.associatedButton = this;
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
        
        public function handleGamePadB() : *
        {
            if(this.activeList != null && this.activeList.visible)
            {
                this.closeList();
            }
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
                this.perkIconLoader.source = param1;
            }
            else
            {
                this.perkIconLoader.visible = false;
            }
        }
        
        public function set readyText(param1:String) : void
        {
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
            this.voipIcon.visible = param1;
        }
        
        override public function set visible(param1:Boolean) : void
        {
            super.visible = param1;
        }
        
        public function openList() : *
        {
            if(this.activeList == this.perksList)
            {
                return;
            }
            if((this.activeList as TripScrollingList).dataProvider.length > 0)
            {
                mouseEnabled = false;
                mouseChildren = true;
                this.activeList.bOpen = true;
            }
        }
        
        public function closeList() : *
        {
            if(this.activeList == this.perksList)
            {
                return;
            }
            if(this.activeList.bOpen)
            {
                mouseEnabled = true;
                mouseChildren = false;
                this.activeList.bOpen = false;
            }
        }
        
        protected function onBack(param1:IndexEvent) : *
        {
            if(param1.index != TripContainer.CANCELLED_INDEX)
            {
                if(this.activeList == this.perksList)
                {
                    ExternalInterface.call("Callback_PerkChanged",param1.index);
                }
                else
                {
                    ExternalInterface.call("Callback_ProfileOption",param1.index,this.slotIndex);
                }
            }
            this.closeList();
        }
        
        public function tintItems(param1:uint) : *
        {
            this.iconTint.setTint(param1,1);
            this.perkIconLoaderContainer.transform.colorTransform = this.iconTint;
            if(this.leaderIcon != null)
            {
                this.leaderIcon.transform.colorTransform = this.iconTint;
            }
            this.perkLevelText.textColor = param1;
        }
    }
}
