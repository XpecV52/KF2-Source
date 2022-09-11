package tripwire.popups
{
    import flash.display.SimpleButton;
    import flash.events.*;
    import flash.external.*;
    import flash.text.TextField;
    import flash.ui.*;
    import flash.utils.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.data.*;
    import scaleform.clik.events.*;
    import scaleform.clik.ui.InputDetails;
    import tripwire.controls.FriendsTitle;
    import tripwire.controls.OtherFriendsTitle;
    import tripwire.controls.TripButton;
    import tripwire.managers.*;
    
    public class FriendsListPopup extends BasePopup
    {
         
        
        private var showLog:Boolean = false;
        
        public var clearButton:SimpleButton;
        
        public var friendNameInputField:TextInput;
        
        private var findFriendTimer:Timer;
        
        private var timerDelay:int = 100;
        
        private var storeFriendsList:Array;
        
        private var storeOtherFriendsList:Array;
        
        public var btnBack:TripButton;
        
        public var title:TextField;
        
        public var listViewFriends:TileList;
        
        public var listViewOtherFriends:TileList;
        
        public var scrollbarFriends:ScrollBar;
        
        public var scrollbarOtherFriends:ScrollBar;
        
        public var friendsTitle:FriendsTitle;
        
        public var otherFriendsTitle:OtherFriendsTitle;
        
        private var friendsList:Array;
        
        private var otherFriendsList:Array;
        
        private const margin:uint = 8;
        
        private var friendsListY:uint;
        
        private var otherFriendsListY:uint;
        
        private var otherFriendsTitleY:uint;
        
        private var friendsListHeight:uint;
        
        private var otherFriendsListHeight:uint;
        
        private var friendsScrollbarHeight:uint;
        
        private var otherFriendsScrollbarHeight:uint;
        
        private var friendsListEmpty:Boolean;
        
        private var otherFriendsListEmpty:Boolean;
        
        private var friendBlockCollapsed:Boolean;
        
        private var otherFriendBlockCollapsed:Boolean;
        
        public var searchFriendName:TextField;
        
        public var btnLink:SimpleButton;
        
        public var labelLink:TextField;
        
        private var _FriendSelectedIndex:int = -1;
        
        private var _OtherFriendSelectedIndex:int = -1;
        
        public function FriendsListPopup()
        {
            this.listViewFriends = new TileList();
            this.listViewOtherFriends = new TileList();
            super();
            this.friendsListY = this.listViewFriends.y;
            this.otherFriendsListY = this.listViewOtherFriends.y;
            this.otherFriendsTitleY = this.otherFriendsTitle.y;
            this.friendsListHeight = this.listViewFriends.height;
            this.otherFriendsListHeight = this.listViewOtherFriends.height;
            this.friendsScrollbarHeight = this.scrollbarFriends.height;
            this.otherFriendsScrollbarHeight = this.scrollbarOtherFriends.height;
            friendsBlockCollapsed = false;
            otherFriendsBlockCollapsed = false;
        }
        
        public function set fillFriendsList(param1:Array) : void
        {
            this.log("fillFriendsList.length:" + param1.length);
            this.friendsList = param1;
            this.storeFriendsList = param1;
            this.listViewFriends.dataProvider = new DataProvider(param1);
            this.friendsListEmpty = this.friendsList.length == 0;
            this.log("friendsListEmpty:" + this.friendsListEmpty);
            this.showFriendsList(!this.friendsListEmpty);
            if(this.friendsListEmpty)
            {
                this.collapseFriendsBlock();
                this.listViewFriends.height = this.margin;
            }
            else
            {
                this.expandFriendsBlock();
            }
        }
        
        public function set fillOtherFriendsList(param1:Array) : void
        {
            this.log("fillOtherFriendsList.length:" + param1.length);
            this.otherFriendsList = param1;
            this.storeOtherFriendsList = param1;
            this.listViewOtherFriends.dataProvider = new DataProvider(param1);
            this.otherFriendsListEmpty = this.otherFriendsList.length == 0;
            this.log("otherFriendsListEmpty:" + this.otherFriendsListEmpty);
            this.showOtherFriendsList(!this.otherFriendsListEmpty);
            if(this.otherFriendsListEmpty)
            {
                this.collapseOtherFriendsBlock();
            }
            else
            {
                this.expandOtherFriendBlock();
            }
        }
        
        public function set setTextLocalized(param1:Object) : *
        {
            this.title.text = param1.titleText;
            this.friendsTitle.titleTextField.text = param1.friendsBlockTitleText;
            this.otherFriendsTitle.titleTextField.text = param1.otherFriendsBlockTitleText;
            this.labelLink.text = param1.linkText;
            this.searchFriendName.text = param1.friendName;
        }
        
        override public function openPopup() : void
        {
            super.openPopup();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.openPopup();
            this.btnBack.addEventListener(ButtonEvent.PRESS,this.onBtnBackClick,false,0,true);
            this.friendsTitle.tabEnabled = true;
            this.friendsTitle.tabChildren = true;
            this.friendsTitle.addEventListener(FocusHandlerEvent.FOCUS_IN,this.onFriendsTitleFocusIn,false,0,true);
            this.friendsTitle.addEventListener(FocusHandlerEvent.FOCUS_OUT,this.onFriendsTitleFocusOut,false,0,true);
            this.friendsTitle.addEventListener(MouseEvent.CLICK,this.onFriendsTitleClick,false,0,true);
            this.friendsTitle.addEventListener(KeyboardEvent.KEY_UP,this.onFriendsTitleKeyUP,false,0,true);
            this.otherFriendsTitle.tabEnabled = true;
            this.otherFriendsTitle.tabChildren = true;
            this.otherFriendsTitle.addEventListener(FocusHandlerEvent.FOCUS_IN,this.onOtherFriendsTitleFocusIn,false,0,true);
            this.otherFriendsTitle.addEventListener(FocusHandlerEvent.FOCUS_OUT,this.onOtherFriendsTitleFocusOut,false,0,true);
            this.otherFriendsTitle.addEventListener(MouseEvent.CLICK,this.onOtherFriendsTitleClick,false,0,true);
            this.otherFriendsTitle.addEventListener(KeyboardEvent.KEY_UP,this.onOtherFriendsTitleKeyUP,false,0,true);
            this.listViewFriends.addEventListener(ListEvent.ITEM_CLICK,this.onFriendsListClicked,false,0,true);
            this.listViewOtherFriends.addEventListener(ListEvent.ITEM_CLICK,this.onOtherFriendsListClicked,false,0,true);
            this.listViewFriends.addEventListener(FocusHandlerEvent.FOCUS_IN,this.onFriendListFocusChange,false,0,true);
            this.listViewFriends.addEventListener(FocusHandlerEvent.FOCUS_OUT,this.onFriendListFocusChange,false,0,true);
            this.listViewOtherFriends.addEventListener(FocusHandlerEvent.FOCUS_IN,this.onOtherFriendListFocusChange,false,0,true);
            this.listViewOtherFriends.addEventListener(FocusHandlerEvent.FOCUS_OUT,this.onOtherFriendListFocusChange,false,0,true);
            this.friendNameInputField.tabEnabled = true;
            this.friendNameInputField.addEventListener(KeyboardEvent.KEY_UP,this.restartTimer,false,0,true);
            this.btnLink.tabEnabled = true;
            this.btnLink.addEventListener(MouseEvent.CLICK,this.onBtnLinkClick,false,0,true);
            this.btnLink.addEventListener(KeyboardEvent.KEY_UP,this.onBtnLinkKeyUp,false,0,true);
            this.clearButton.addEventListener(MouseEvent.CLICK,this.onClearButtonClick,false,0,true);
            this.setDpadTabIndex();
        }
        
        public function testFocusIn(param1:FocusHandlerEvent) : void
        {
            this.log("testFocusIn");
        }
        
        public function testFocusOut(param1:FocusHandlerEvent) : void
        {
            this.log("testFocusOut");
        }
        
        public function testKeyFocusChange(param1:FocusHandlerEvent) : void
        {
            this.log("testKeyFocusChange");
        }
        
        public function testMouseFocusChange(param1:FocusHandlerEvent) : void
        {
            this.log("testMouseFocusChange");
        }
        
        protected function setDpadTabIndex() : *
        {
            var _loc1_:int = 0;
            this.btnBack.tabIndex = _loc1_ = (this.btnLink.tabIndex = int((this.listViewOtherFriends.tabIndex = int((this.otherFriendsTitle.tabIndex = int((this.listViewFriends.tabIndex = int((this.friendsTitle.tabIndex = int((this.friendNameInputField.tabIndex = int(_loc1_ + 1)) + 1)) + 1)) + 1)) + 1)) + 1)) + 1;
        }
        
        public function onFriendsTitleFocusIn(param1:FocusHandlerEvent) : void
        {
            this.log("onFriendsTitleFocusIn");
            this.friendsTitle.onFocusChange(true);
        }
        
        public function onFriendsTitleFocusOut(param1:FocusHandlerEvent) : void
        {
            this.log("onFriendsTitleFocusOut");
            this.friendsTitle.onFocusChange(false);
        }
        
        public function onFriendListFocusChange(param1:FocusHandlerEvent) : void
        {
            this.log("onStoreListFocusChange");
            if(param1.target.hasFocus)
            {
                this.log("e.target.hasFocus = true");
                param1.target.selectedIndex = this._FriendSelectedIndex;
            }
            else
            {
                this.log("e.target.hasFocus = false");
                this._FriendSelectedIndex = param1.target.selectedIndex;
                param1.target.selectedIndex = -1;
            }
        }
        
        public function onOtherFriendsTitleFocusIn(param1:FocusHandlerEvent) : void
        {
            this.log("onOtherFriendsTitleFocusIn");
            this.otherFriendsTitle.onFocusChange(true);
        }
        
        public function onOtherFriendsTitleFocusOut(param1:FocusHandlerEvent) : void
        {
            this.log("onOtherFriendsTitleFocusOut");
            this.otherFriendsTitle.onFocusChange(false);
        }
        
        public function onOtherFriendListFocusChange(param1:FocusHandlerEvent) : void
        {
            this.log("onOtherFriendListFocusChange");
            if(param1.target.hasFocus)
            {
                this.log("e.target.hasFocus = true");
                param1.target.selectedIndex = this._OtherFriendSelectedIndex;
            }
            else
            {
                this.log("e.target.hasFocus = false");
                this._OtherFriendSelectedIndex = param1.target.selectedIndex;
                param1.target.selectedIndex = -1;
            }
        }
        
        private function restartTimer(param1:KeyboardEvent) : *
        {
            this.log("restartTimer");
            this.log(param1.type);
            this.log(param1.keyCode);
            this.findFriendTimer = new Timer(this.timerDelay,1);
            this.findFriendTimer.addEventListener("timer",this.timerHandler);
            this.findFriendTimer.start();
        }
        
        private function timerHandler(param1:TimerEvent) : *
        {
            this.findFriends();
            this.findOtherFriends();
        }
        
        private function findFriends() : *
        {
            var _loc1_:* = [];
            var _loc2_:* = this.friendNameInputField.text.toLowerCase();
            var _loc3_:* = "";
            var _loc4_:int = 0;
            while(_loc4_ < this.storeFriendsList.length)
            {
                _loc3_ = String(this.storeFriendsList[_loc4_].friendName).toLowerCase();
                if(_loc3_.search(_loc2_) >= 0)
                {
                    _loc1_.push(this.storeFriendsList[_loc4_]);
                }
                _loc4_++;
            }
            if(_loc2_.length == 0)
            {
                this.friendsList = this.storeFriendsList;
            }
            else
            {
                this.friendsList = _loc1_.sort(this.sortBySearching);
            }
            this.listViewFriends.dataProvider = new DataProvider(this.friendsList);
        }
        
        private function findOtherFriends() : *
        {
            var _loc1_:* = [];
            var _loc2_:* = this.friendNameInputField.text.toLowerCase();
            var _loc3_:* = "";
            var _loc4_:int = 0;
            while(_loc4_ < this.storeOtherFriendsList.length)
            {
                _loc3_ = String(this.storeOtherFriendsList[_loc4_].friendName).toLowerCase();
                if(_loc3_.search(_loc2_) >= 0)
                {
                    _loc1_.push(this.storeOtherFriendsList[_loc4_]);
                }
                _loc4_++;
            }
            if(_loc2_.length == 0)
            {
                this.otherFriendsList = this.storeOtherFriendsList;
            }
            else
            {
                this.otherFriendsList = _loc1_.sort(this.sortBySearching);
            }
            this.listViewOtherFriends.dataProvider = new DataProvider(this.otherFriendsList);
        }
        
        private function sortBySearching(param1:*, param2:*) : Number
        {
            var _loc3_:* = this.friendNameInputField.text.toLowerCase();
            var _loc4_:* = String(param1.friendName).toLowerCase();
            var _loc5_:* = String(param2.friendName).toLowerCase();
            return _loc4_.search(_loc3_) - _loc5_.search(_loc3_);
        }
        
        private function onClearButtonClick(param1:Event) : *
        {
            this.friendNameInputField.text = "";
            this.friendsList = this.storeFriendsList;
            this.listViewFriends.dataProvider = new DataProvider(this.friendsList);
            this.otherFriendsList = this.storeOtherFriendsList;
            this.listViewOtherFriends.dataProvider = new DataProvider(this.otherFriendsList);
        }
        
        public function onFriendsListClicked(param1:ListEvent) : *
        {
            var _loc2_:uint = param1.index;
            if(!this.friendsList[_loc2_].sendInvite)
            {
                ExternalInterface.call("Callback_SendInviteToSelectedFriend",this.friendsList[_loc2_].friendUid);
            }
            this.friendsList[_loc2_].sendInvite = true;
            this.listViewFriends.invalidateData();
        }
        
        public function onOtherFriendsListClicked(param1:ListEvent) : *
        {
            var _loc2_:uint = param1.index;
            if(!this.otherFriendsList[_loc2_].sendInvite)
            {
                ExternalInterface.call("Callback_SendInviteToSelectedFriend",this.otherFriendsList[_loc2_].friendUid);
            }
            this.otherFriendsList[_loc2_].sendInvite = true;
            this.listViewOtherFriends.invalidateData();
        }
        
        public function onFriendsTitleKeyUP(param1:KeyboardEvent) : *
        {
            this.log("onFriendsTitleKeyUP");
            this.log(param1.keyCode);
            switch(param1.keyCode)
            {
                case Keyboard.TAB:
                    return;
                case Keyboard.UP:
                    return;
                case Keyboard.DOWN:
                    return;
                default:
                    this.onFriendsTitleClick(param1);
                    return;
            }
        }
        
        public function onFriendsTitleClick(param1:Event) : *
        {
            this.log("onFriendsTitleClick");
            this.log(param1.type);
            if(this.friendsTitle.btnPlus.visible)
            {
                this.onFriendsBtnPlusClick(param1);
            }
            else
            {
                this.onFriendsBtnMinusClick(param1);
            }
        }
        
        public function onFriendsBtnPlusClick(param1:Event) : *
        {
            this.friendsTitle.showMinus();
            this.showFriendsList(!this.friendsListEmpty);
            if(!this.friendsListEmpty)
            {
                this.expandFriendsBlock();
            }
        }
        
        public function onFriendsBtnMinusClick(param1:Event) : *
        {
            this.friendsTitle.showPlus();
            this.showFriendsList(false);
            if(!this.friendBlockCollapsed)
            {
                this.collapseFriendsBlock();
            }
        }
        
        private function collapseFriendsBlock() : *
        {
            if(!this.otherFriendsListEmpty && this.listViewOtherFriends.visible)
            {
                this.log("collapseFriendsBlock OtherFriends.visible");
                this.otherFriendsTitle.y = this.friendsListY;
                this.listViewOtherFriends.y = this.otherFriendsTitle.y + this.otherFriendsTitle.height + this.margin;
                this.scrollbarOtherFriends.y = this.listViewOtherFriends.y;
                this.listViewOtherFriends.height = this.otherFriendsListHeight * 2;
                this.scrollbarOtherFriends.height = this.otherFriendsScrollbarHeight * 2;
            }
            else
            {
                this.log("collapseFriendsBlock OtherFriends.gone");
                this.otherFriendsTitle.y = this.listViewFriends.y;
                this.listViewFriends.height = this.friendsListHeight;
                this.scrollbarFriends.height = this.friendsScrollbarHeight;
            }
            this.friendBlockCollapsed = true;
        }
        
        private function expandFriendsBlock() : *
        {
            if(!this.otherFriendsListEmpty && this.listViewOtherFriends.visible)
            {
                this.log("expandFriendsBlock OtherFriends.visible");
                this.otherFriendsTitle.y = this.otherFriendsTitleY;
                this.listViewOtherFriends.y = this.otherFriendsListY;
                this.scrollbarOtherFriends.y = this.listViewOtherFriends.y;
                this.listViewOtherFriends.height = this.otherFriendsListHeight;
                this.scrollbarOtherFriends.height = this.otherFriendsScrollbarHeight;
            }
            else
            {
                this.log("expandFriendsBlock OtherFriends.gone");
                this.otherFriendsTitle.y = this.listViewOtherFriends.y + this.listViewOtherFriends.height - this.otherFriendsTitle.height - this.margin;
                this.listViewFriends.height = this.friendsListHeight * 2;
                this.scrollbarFriends.height = this.friendsScrollbarHeight * 2;
            }
            this.friendBlockCollapsed = false;
        }
        
        public function onOtherFriendsTitleKeyUP(param1:KeyboardEvent) : *
        {
            this.log("onOtherFriendsTitleKeyUP");
            this.log(param1.keyCode);
            switch(param1.keyCode)
            {
                case Keyboard.TAB:
                    return;
                case Keyboard.UP:
                    return;
                case Keyboard.DOWN:
                    return;
                default:
                    this.onOtherFriendsTitleClick(param1);
                    return;
            }
        }
        
        public function onOtherFriendsTitleClick(param1:Event) : *
        {
            this.log("onOtherFriendsTitleClick");
            if(this.otherFriendsTitle.btnPlus.visible)
            {
                this.onOtherFriendsBtnPlusClick(param1);
            }
            else
            {
                this.onOtherFriendsBtnMinusClick(param1);
            }
        }
        
        public function onOtherFriendsBtnPlusClick(param1:Event) : *
        {
            this.otherFriendsTitle.showMinus();
            this.showOtherFriendsList(!this.otherFriendsListEmpty);
            if(!this.otherFriendsListEmpty)
            {
                this.expandOtherFriendBlock();
            }
        }
        
        public function onOtherFriendsBtnMinusClick(param1:Event) : *
        {
            this.otherFriendsTitle.showPlus();
            this.showOtherFriendsList(false);
            if(!this.otherFriendBlockCollapsed)
            {
                this.collapseOtherFriendsBlock();
            }
        }
        
        private function collapseOtherFriendsBlock() : *
        {
            if(!this.friendsListEmpty && this.listViewFriends.visible)
            {
                this.log("collapseOtherFriendsBlock Friends.visible");
                this.otherFriendsTitle.y = this.listViewOtherFriends.y + this.listViewOtherFriends.height - this.otherFriendsTitle.height - this.margin;
                this.listViewFriends.height = this.friendsListHeight * 2;
                this.scrollbarFriends.height = this.friendsScrollbarHeight * 2;
            }
            else
            {
                this.log("collapseOtherFriendsBlock Friends.gone");
                this.otherFriendsTitle.y = this.listViewFriends.y;
                this.listViewOtherFriends.y = this.otherFriendsListY;
                this.scrollbarOtherFriends.y = this.listViewOtherFriends.y;
                this.listViewOtherFriends.height = this.otherFriendsListHeight;
                this.scrollbarOtherFriends.height = this.otherFriendsScrollbarHeight;
            }
            this.otherFriendBlockCollapsed = true;
        }
        
        private function expandOtherFriendBlock() : *
        {
            if(!this.friendsListEmpty && this.listViewFriends.visible)
            {
                this.log("expandOtherFriendBlock Friends.visible");
                this.otherFriendsTitle.y = this.otherFriendsTitleY;
                this.listViewFriends.height = this.friendsListHeight;
                this.scrollbarFriends.height = this.friendsScrollbarHeight;
            }
            else
            {
                this.log("expandOtherFriendBlock Friends.gone");
                this.otherFriendsTitle.y = this.listViewFriends.y;
                this.listViewOtherFriends.y = this.otherFriendsTitle.y + this.otherFriendsTitle.height + this.margin;
                this.scrollbarOtherFriends.y = this.otherFriendsTitle.y + this.otherFriendsTitle.height + this.margin;
                this.listViewOtherFriends.height = this.otherFriendsListHeight * 2;
                this.scrollbarOtherFriends.height = this.otherFriendsScrollbarHeight * 2;
            }
            this.otherFriendBlockCollapsed = false;
        }
        
        private function showFriendsList(param1:Boolean) : *
        {
            this.log("showFriendsList.show: " + param1);
            if(param1)
            {
                this.listViewFriends.visible = true;
                this.scrollbarFriends.visible = true;
            }
            else
            {
                this.listViewFriends.visible = false;
                this.scrollbarFriends.visible = false;
            }
        }
        
        private function showOtherFriendsList(param1:Boolean) : *
        {
            this.log("showOtherFriendsList.show: " + param1);
            if(param1)
            {
                this.listViewOtherFriends.visible = true;
                this.scrollbarOtherFriends.visible = true;
            }
            else
            {
                this.listViewOtherFriends.visible = false;
                this.scrollbarOtherFriends.visible = false;
            }
        }
        
        override public function setPopupText(param1:String, param2:String, param3:String, param4:String, param5:String) : *
        {
            this.title.text = param1;
            this.btnBack.label = param3;
        }
        
        function onBtnBackClick(param1:Event) : *
        {
            this.log("onBtnBackClick");
            ExternalInterface.call("Callback_BtnBackClick");
            if(!MenuManager.manager.bUsingGamepad)
            {
                MenuManager.manager.setFocusBackToMenu();
            }
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            if(param1.handled)
            {
                return;
            }
            this.log("handleInput");
            var _loc2_:InputDetails = param1.details;
            this.log(param1.target);
            this.log(param1.currentTarget);
            this.log(this.friendNameInputField.focused);
            this.log(this.friendNameInputField.selected);
            if(param1.target == this.friendNameInputField)
            {
            }
            if(param1.target == stage)
            {
                this.log("[Focus to the Moon!]");
                stage.focus = this.friendNameInputField;
            }
            if(_loc2_.value == InputValue.KEY_DOWN && _loc2_.navEquivalent == NavigationCode.GAMEPAD_B)
            {
                this.log("NavigationCode.GAMEPAD_B");
                ExternalInterface.call("Callback_BtnBackClick");
            }
        }
        
        function onBtnLinkClick(param1:Event) : *
        {
            ExternalInterface.call("Callback_BtnLinkClick");
        }
        
        private function onBtnLinkKeyUp(param1:KeyboardEvent) : *
        {
            this.log("onBtnLinkKeyUp");
            this.log(param1.keyCode);
            switch(param1.keyCode)
            {
                case Keyboard.TAB:
                    return;
                case Keyboard.UP:
                    return;
                case Keyboard.DOWN:
                    return;
                default:
                    this.onBtnLinkClick(param1);
                    return;
            }
        }
        
        public function set showLink(param1:Boolean) : *
        {
            this.labelLink.visible = param1;
            this.btnLink.visible = param1;
        }
        
        private function log(param1:String) : *
        {
            if(this.showLog)
            {
                ExternalInterface.call("Callback_Log",param1);
            }
        }
        
        function showFakeData() : *
        {
            this.fillFriendsList = [{
                "friendName":"aaaa",
                "sendInvite":false
            },{
                "friendName":"aaab",
                "sendInvite":false
            },{
                "friendName":"aabb",
                "sendInvite":false
            },{
                "friendName":"abbb",
                "sendInvite":false
            },{
                "friendName":"bbbb",
                "sendInvite":false
            },{
                "friendName":"bbbc",
                "sendInvite":false
            },{
                "friendName":"bbcc",
                "sendInvite":false
            },{
                "friendName":"bccc",
                "sendInvite":false
            },{
                "friendName":"cccc",
                "sendInvite":false
            },{
                "friendName":"cccd",
                "sendInvite":false
            },{
                "friendName":"ccdd",
                "sendInvite":false
            },{
                "friendName":"cddd",
                "sendInvite":false
            }];
            this.fillOtherFriendsList = [{
                "friendName":"aaaa",
                "sendInvite":false
            },{
                "friendName":"aaab",
                "sendInvite":false
            },{
                "friendName":"aabb",
                "sendInvite":false
            },{
                "friendName":"abbb",
                "sendInvite":false
            },{
                "friendName":"bbbb",
                "sendInvite":false
            },{
                "friendName":"bbbc",
                "sendInvite":false
            },{
                "friendName":"bbcc",
                "sendInvite":false
            },{
                "friendName":"bccc",
                "sendInvite":false
            },{
                "friendName":"cccc",
                "sendInvite":false
            },{
                "friendName":"cccd",
                "sendInvite":false
            },{
                "friendName":"ccdd",
                "sendInvite":false
            },{
                "friendName":"cddd",
                "sendInvite":false
            }];
        }
    }
}
