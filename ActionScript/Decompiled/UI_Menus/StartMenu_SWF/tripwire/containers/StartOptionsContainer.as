package tripwire.containers
{
    import com.greensock.TimelineMax;
    import com.greensock.easing.Circ;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import flash.ui.Keyboard;
    import scaleform.clik.controls.UILoader;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.interfaces.IDataProvider;
    import scaleform.clik.managers.FocusHandler;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.FocusManager;
    import tripwire.controls.CategoryButton;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripScrollingList;
    import tripwire.managers.MenuManager;
    
    public class StartOptionsContainer extends TripSubContainer
    {
         
        
        public var helperTextContainer:TextContainer;
        
        public var optionsHeader:SectionHeaderContainer;
        
        public var backButton:TripButton;
        
        public var startGameButton:TripButton;
        
        public var mutatorButton:TripButton;
        
        public var modeButton:CategoryButton;
        
        public var mapButton:CategoryButton;
        
        public var difficultyButton:CategoryButton;
        
        public var lengthButton:CategoryButton;
        
        public var serverTypeButton:CategoryButton;
        
        public var privacyButton:CategoryButton;
        
        public var inProgressButton:CategoryButton;
        
        public var modeList:TripScrollingList;
        
        public var mapList:TripScrollingList;
        
        public var difficultyList:TripScrollingList;
        
        public var lengthList:TripScrollingList;
        
        public var privacyList:TripScrollingList;
        
        public var serverTypeList:TripScrollingList;
        
        public var inProgressList:TripScrollingList;
        
        private var _currentLoadedImageIndex:int = -1;
        
        private var _currentSelectedMapIndex:int = -1;
        
        private var _currentList:TripScrollingList;
        
        public var soloGameString:String = "_Solo Game";
        
        public var matchMakingString:String = "_Matchnaking";
        
        public var leaveMatchmakingString:String = "_leave Matchmaking";
        
        public var backString:String = "_back";
        
        public var lauchGameString:String = "_Launch Game";
        
        public var multiplayerLaunchString:String = "_Play Game";
        
        public var searchingString:String = "_Searching";
        
        private var _bIsSoloGame:Boolean;
        
        private var _bSearchingForGame:Boolean;
        
        private var _bPublicGame:Boolean;
        
        private var _bGameInProgress:Boolean;
        
        public var createGameMapImageContainerMC:MovieClip;
        
        public var fadeTimeline:TimelineMax;
        
        public function StartOptionsContainer()
        {
            this.fadeTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            super();
            currentElement = defaultFirstElement = this.startGameButton;
            sectionHeader = this.optionsHeader;
            defaultNumPrompts = 2;
        }
        
        public function set helpText(param1:String) : void
        {
            if(param1 != "")
            {
                this.helperTextContainer.text = param1;
                if(this.helperTextContainer.alpha != 1)
                {
                    this.fadeTimeline.play();
                }
            }
            else
            {
                this.closeHelpText();
            }
        }
        
        public function closeHelpText() : void
        {
            if(this.helperTextContainer.visible)
            {
                this.fadeTimeline.reverse(0);
            }
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.soloGameString = !!param1.soloGameString ? param1.soloGameString : "";
            this.matchMakingString = !!param1.matchMakingString ? param1.matchMakingString : "";
            this.leaveMatchmakingString = !!param1.leaveMatchmakingString ? param1.leaveMatchmakingString : "";
            this.backString = !!param1.backString ? param1.backString : "";
            this.lauchGameString = !!param1.lauchGameString ? param1.lauchGameString : "";
            this.multiplayerLaunchString = !!param1.multiplayerLaunchString ? param1.multiplayerLaunchString : "";
            this.searchingString = !!param1.searchingString ? param1.searchingString : "";
            this.modeButton.label = !!param1.mode ? param1.mode : "";
            this.mapButton.label = !!param1.map ? param1.map : "";
            this.difficultyButton.label = !!param1.difficulty ? param1.difficulty : "";
            this.lengthButton.label = !!param1.length ? param1.length : "";
            this.privacyButton.label = !!param1.privacy ? param1.privacy : "";
            this.serverTypeButton.label = !!param1.serverType ? param1.serverType : "";
            this.inProgressButton.label = !!param1.inProgress ? param1.inProgress : "";
            if(param1.modeList)
            {
                this.setObjectList(this.modeList,param1.modeList);
            }
            if(param1.mapList)
            {
                this.setObjectList(this.mapList,param1.mapList);
            }
            if(param1.difficultyList)
            {
                this.setObjectList(this.difficultyList,param1.difficultyList);
            }
            if(param1.lengthList)
            {
                this.setObjectList(this.lengthList,param1.lengthList);
            }
            if(param1.privacyList)
            {
                this.setObjectList(this.privacyList,param1.privacyList);
            }
            if(param1.serverTypeList)
            {
                this.setObjectList(this.serverTypeList,param1.serverTypeList);
            }
            if(param1.inProgressList)
            {
                this.setObjectList(this.inProgressList,param1.inProgressList);
            }
        }
        
        public function set bIsSoloGame(param1:Boolean) : void
        {
            this._bIsSoloGame = param1;
            this.serverTypeButton.visible = !param1;
            this.privacyButton.visible = false;
            this.inProgressButton.visible = !param1;
            if(param1)
            {
                this.startGameButton.y = this.lengthButton.y + this.lengthButton.height + 24;
                this.backButton.y = this.startGameButton.y + this.startGameButton.height;
                this.optionsHeader.text = this.soloGameString;
                this.backButton.label = this.backString;
                this.startGameButton.label = this.lauchGameString;
            }
            else
            {
                this.startGameButton.y = this.inProgressButton.y + this.inProgressButton.height + 24;
                this.backButton.y = this.startGameButton.y + this.startGameButton.height;
                this.optionsHeader.text = this.matchMakingString;
                this.backButton.label = this.leaveMatchmakingString;
                this.startGameButton.label = this.multiplayerLaunchString;
            }
            ExternalInterface.call("Callback_StartMenuRequestReinit");
        }
        
        public function get bIsSoloGame() : Boolean
        {
            return this._bIsSoloGame;
        }
        
        public function set bSearchingForGame(param1:Boolean) : void
        {
            this._bSearchingForGame = param1;
            if(this._bSearchingForGame)
            {
                this.startGameButton.label = this.searchingString;
            }
            else
            {
                this.startGameButton.label = this.multiplayerLaunchString;
            }
            this.privacyButton.enabled = !param1;
            this.inProgressButton.enabled = !param1;
            this.serverTypeButton.enabled = !param1;
            this.lengthButton.enabled = !param1;
            this.difficultyButton.enabled = !param1;
            this.mapButton.enabled = !param1;
            this.modeButton.enabled = !param1;
        }
        
        public function set bPublicGame(param1:Boolean) : void
        {
            this._bPublicGame = param1;
            if(!this._bSearchingForGame)
            {
                this.inProgressButton.enabled = param1;
                this.inProgressButton.infoTextField.visible = param1;
            }
        }
        
        public function set bAllowGameInProgress(param1:Boolean) : void
        {
            this._bGameInProgress = param1;
            if(!this._bSearchingForGame)
            {
                this.privacyButton.enabled = !param1;
                this.privacyButton.infoTextField.visible = !param1;
            }
        }
        
        public function get options() : Object
        {
            var _loc1_:Object = new Object();
            _loc1_.mode = this.modeList.selectedIndex;
            _loc1_.difficulty = this.difficultyList.selectedIndex;
            _loc1_.length = this.lengthList.selectedIndex;
            _loc1_.serverType = this.serverTypeList.selectedIndex;
            _loc1_.inProgress = this.inProgressList.selectedIndex;
            _loc1_.permissions = this.privacyList.selectedIndex;
            return _loc1_;
        }
        
        protected function setObjectList(param1:TripScrollingList, param2:Object) : void
        {
            param1.dataProvider = !!param2.dataProvider ? new DataProvider(param2.dataProvider) : null;
            param1.selectedIndex = !!param2.selectedIndex ? int(param2.selectedIndex) : 0;
            param1.invalidate();
            if(param1.selectedIndex == 255)
            {
                param1.selectedIndex = 0;
            }
            if(param1.associatedButton)
            {
                if(param2.selectedIndex >= 0 && param2.selectedIndex < param1.dataProvider.length)
                {
                    (param1.associatedButton as CategoryButton).infoString = param1.dataProvider[param2.selectedIndex].label;
                }
            }
        }
        
        public function setTabIndex() : void
        {
            this.modeButton.tabIndex = 1;
            this.mapButton.tabIndex = 2;
            this.difficultyButton.tabIndex = 3;
            this.lengthButton.tabIndex = 4;
            this.privacyButton.tabIndex = 5;
            this.startGameButton.tabIndex = 6;
            this.serverTypeButton.tabIndex = 7;
            this.inProgressButton.tabIndex = 8;
            this.backButton.tabIndex = 9;
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            this.backButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.startGameButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.modeButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.mapButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.difficultyButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.lengthButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.privacyButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.serverTypeButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.inProgressButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            stage.addEventListener(KeyboardEvent.KEY_UP,this.onUserKeyUp,false,0,true);
            if(bManagerUsingGamepad && !MenuManager.manager.bPopUpOpen)
            {
                FocusHandler.getInstance().setFocus(currentElement);
                showDimLeftSide(false);
            }
            this.backButton.visible = !bManagerUsingGamepad;
        }
        
        override public function deselectContainer() : void
        {
            currentElement = !!this._currentList ? this._currentList.associatedButton : FocusManager.getFocus() as UIComponent;
            super.deselectContainer();
            this.backButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.startGameButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.modeButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.mapButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.difficultyButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.lengthButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.privacyButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.serverTypeButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.inProgressButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            stage.removeEventListener(KeyboardEvent.KEY_UP,this.onUserKeyUp);
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.helperTextContainer.visible = false;
            currentElement = defaultFirstElement = this.startGameButton;
            this.initializeLists();
            this.setTabIndex();
            this.backButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.startGameButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.modeButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.mapButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.difficultyButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.lengthButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.privacyButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.serverTypeButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.inProgressButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.optionsHeader.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.createGameMapImageContainerMC.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.modeList.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.mapList.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.difficultyList.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.lengthList.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.serverTypeList.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.privacyList.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.inProgressList.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            leftSidePanels.push(this.backButton);
            leftSidePanels.push(this.startGameButton);
            leftSidePanels.push(this.modeButton);
            leftSidePanels.push(this.mapButton);
            leftSidePanels.push(this.difficultyButton);
            leftSidePanels.push(this.lengthButton);
            leftSidePanels.push(this.privacyButton);
            leftSidePanels.push(this.serverTypeButton);
            leftSidePanels.push(this.inProgressButton);
            leftSidePanels.push(this.optionsHeader);
            leftSidePanels.push(this.createGameMapImageContainerMC);
            rightSidePanels.push(this.modeList);
            rightSidePanels.push(this.mapList);
            rightSidePanels.push(this.difficultyList);
            rightSidePanels.push(this.lengthList);
            rightSidePanels.push(this.serverTypeList);
            rightSidePanels.push(this.privacyList);
            rightSidePanels.push(this.inProgressList);
            this.makeAnims();
        }
        
        public function makeAnims() : void
        {
            this.fadeTimeline.set(this.helperTextContainer,{"visible":false});
            this.fadeTimeline.fromTo(this.helperTextContainer,6,{
                "alpha":0,
                "visible":true
            },{
                "alpha":1,
                "visible":true,
                "ease":Circ.easeOut
            });
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.backButton.visible = !bManagerUsingGamepad;
        }
        
        function initializeLists() : *
        {
            this.setListProps(this.modeList,this.modeButton);
            this.setListProps(this.mapList,this.mapButton);
            this.setListProps(this.difficultyList,this.difficultyButton);
            this.setListProps(this.lengthList,this.lengthButton);
            this.setListProps(this.privacyList,this.privacyButton);
            this.setListProps(this.serverTypeList,this.serverTypeButton);
            this.setListProps(this.inProgressList,this.inProgressButton);
        }
        
        function setListProps(param1:TripScrollingList, param2:TripButton = null) : *
        {
            var _loc3_:Array = new Array();
            param1.dataProvider = new DataProvider(_loc3_);
            param1.addEventListener(IndexEvent.INDEX_CHANGE,this.onBack,false,0,true);
            param1.visible = false;
            param1.associatedButton = param2;
        }
        
        public function onUserKeyUp(param1:KeyboardEvent) : void
        {
            if(bManagerUsingGamepad)
            {
                return;
            }
            if(param1.keyCode == Keyboard.ESCAPE)
            {
                this.onBack(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
                this._currentList = null;
            }
        }
        
        protected function handleButtonEvent(param1:ButtonEvent) : void
        {
            switch(param1.currentTarget)
            {
                case this.backButton:
                    this.attemptLeaveMenu();
                    break;
                case this.modeButton:
                    this.showOptions(this.modeList);
                    break;
                case this.mapButton:
                    this.showOptions(this.mapList);
                    break;
                case this.difficultyButton:
                    this.showOptions(this.difficultyList);
                    break;
                case this.lengthButton:
                    this.showOptions(this.lengthList);
                    break;
                case this.privacyButton:
                    this.showOptions(this.privacyList);
                    break;
                case this.serverTypeButton:
                    this.showOptions(this.serverTypeList);
                    break;
                case this.inProgressButton:
                    this.showOptions(this.inProgressList);
                    break;
                case this.startGameButton:
                    if(this._bIsSoloGame)
                    {
                        ExternalInterface.call("Callback_StartOfflineGame");
                    }
                    else if(this._bSearchingForGame)
                    {
                        ExternalInterface.call("Callback_CancelSearch");
                    }
                    else
                    {
                        ExternalInterface.call("Callback_StartOnlineGame");
                    }
            }
        }
        
        public function attemptLeaveMenu() : *
        {
            if(this._bIsSoloGame)
            {
                dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
            }
            else
            {
                ExternalInterface.call("Callback_RequestLeaveMatchmaking");
            }
        }
        
        public function set approveMatchMakingLeave(param1:Boolean) : void
        {
            if(param1)
            {
                dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
            }
        }
        
        public function get currentSelectedMapIndex() : *
        {
            return this._currentSelectedMapIndex;
        }
        
        public function set currentSelectedMapIndex(param1:int) : *
        {
            if(param1 > -1)
            {
                this._currentSelectedMapIndex = param1;
                this.onItemRollOver(null);
            }
        }
        
        private function showOptions(param1:TripScrollingList) : void
        {
            param1.bOpen = true;
            this._currentList = param1;
            this._currentList.addEventListener(ListEvent.ITEM_ROLL_OVER,this.onItemRollOver,false,0,true);
            this._currentList.addEventListener(ListEvent.INDEX_CHANGE,this.onItemRollOver,false,0,true);
            if(bManagerUsingGamepad)
            {
                showDimLeftSide(true);
            }
        }
        
        private function onItemRollOver(param1:ListEvent) : *
        {
            var _loc3_:Object = null;
            var _loc4_:int = 0;
            var _loc2_:UILoader = this.createGameMapImageContainerMC.mapImageLoader;
            if(param1 != null)
            {
                _loc4_ = param1.index;
                if(this._currentList != this.mapList)
                {
                    ExternalInterface.call("Callback_OptionListOpened",this._currentList.name,_loc4_);
                }
            }
            else
            {
                _loc4_ = this._currentSelectedMapIndex;
            }
            if(_loc4_ != this._currentLoadedImageIndex)
            {
                this._currentLoadedImageIndex = _loc4_;
                if(this.mapList.bOpen)
                {
                    ExternalInterface.call("Callback_RecieveMap",_loc4_);
                }
            }
        }
        
        public function set mapSource(param1:String) : *
        {
            var _loc2_:UILoader = this.createGameMapImageContainerMC.mapImageLoader;
            var _loc3_:String = param1;
            if(_loc3_ != _loc2_.source)
            {
                _loc2_.source = param1;
            }
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            if(this._currentList)
            {
                this._currentList = null;
            }
            this.attemptLeaveMenu();
        }
        
        protected function onBack(param1:IndexEvent) : *
        {
            if(!this._currentList)
            {
                this.attemptLeaveMenu();
            }
            else
            {
                if(param1.index != CANCELLED_INDEX)
                {
                    (this._currentList.associatedButton as CategoryButton).infoString = this._currentList.dataProvider[param1.index].label;
                    switch(this._currentList)
                    {
                        case this.modeList:
                            ExternalInterface.call("Callback_Mode",param1.index);
                            break;
                        case this.lengthList:
                            ExternalInterface.call("Callback_Length",param1.index);
                            break;
                        case this.difficultyList:
                            ExternalInterface.call("Callback_Difficulty",param1.index);
                            break;
                        case this.mapList:
                            this._currentSelectedMapIndex = param1.index;
                            ExternalInterface.call("Callback_MapSelection",param1.index);
                            break;
                        case this.privacyList:
                            ExternalInterface.call("Callback_Privacy",param1.index);
                            break;
                        case this.serverTypeList:
                            ExternalInterface.call("Callback_ServerType",param1.index);
                            break;
                        case this.inProgressList:
                            ExternalInterface.call("Callback_InProgress",param1.index);
                    }
                    this.closeHelpText();
                    this._currentList.removeEventListener(ListEvent.ITEM_ROLL_OVER,this.onItemRollOver);
                    this._currentList.removeEventListener(ListEvent.INDEX_CHANGE,this.onItemRollOver);
                }
                else
                {
                    if(this._currentList == this.mapList)
                    {
                        this.resetMapOption();
                    }
                    this.closeHelpText();
                    this._currentList.removeEventListener(ListEvent.ITEM_ROLL_OVER,this.onItemRollOver);
                    this._currentList.removeEventListener(ListEvent.INDEX_CHANGE,this.onItemRollOver);
                }
                showDimLeftSide(false);
            }
        }
        
        private function resetMapOption() : *
        {
            ExternalInterface.call("Callback_RecieveMap",this._currentSelectedMapIndex);
        }
    }
}
