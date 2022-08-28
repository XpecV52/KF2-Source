package tripwire.containers
{
    import com.greensock.*;
    import com.greensock.easing.*;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import flash.ui.Keyboard;
    import scaleform.clik.controls.UILoader;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.interfaces.IDataProvider;
    import scaleform.clik.ui.InputDetails;
    import tripwire.controls.CategoryButton;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripScrollingList;
    import tripwire.managers.MenuManager;
    import tripwire.menus.StartMenu;
    
    public class StartOptionsContainer extends TripSubContainer
    {
         
        
        public var myStartMenu:StartMenu;
        
        public var helperTextContainer:TextContainer;
        
        public var optionsHeader:SectionHeaderContainer;
        
        public var backButton:TripButton;
        
        public var startGameButton:TripButton;
        
        public var mutatorButton:TripButton;
        
        public var menuBinder:MovieClip;
        
        public var modeButton:CategoryButton;
        
        public var mapButton:CategoryButton;
        
        public var difficultyButton:CategoryButton;
        
        public var lengthButton:CategoryButton;
        
        public var privacyButton:CategoryButton;
        
        public var regionButton:CategoryButton;
        
        public var modeList:TripScrollingList;
        
        public var mapList:TripScrollingList;
        
        public var difficultyList:TripScrollingList;
        
        public var lengthList:TripScrollingList;
        
        public var privacyList:TripScrollingList;
        
        public var regionList:TripScrollingList;
        
        private var _currentLoadedImageIndex:int = -1;
        
        private var _currentSelectedMapIndex:int = -1;
        
        private var _currentList:TripScrollingList;
        
        public var soloGameString:String = "_Solo Game";
        
        public var matchMakingString:String = "_Matchnaking";
        
        public var createGameString:String = "_create";
        
        public var leaveMatchmakingString:String = "_leave Matchmaking";
        
        public var backString:String = "_back";
        
        public var lauchGameString:String = "_Launch Game";
        
        public var multiplayerLaunchString:String = "_Play Game";
        
        public var searchingString:String = "_Searching";
        
        private var _bIsSoloGame:Boolean;
        
        private var _bSearchingForGame:Boolean;
        
        private var _bPublicGame:Boolean;
        
        private const HELPERTEXT_DEFAULT_Y:int = 400;
        
        private var _currentMenuState:int = -1;
        
        public var createGameMapImageContainerMC:MovieClip;
        
        public var fadeTimeline:TimelineMax;
        
        private var modeUIComponents:Vector.<MovieClip>;
        
        private var mapUIComponents:Vector.<MovieClip>;
        
        private var difficultyUIComponents:Vector.<MovieClip>;
        
        private var lengthUIComponents:Vector.<MovieClip>;
        
        private var privacyUIComponents:Vector.<MovieClip>;
        
        private var regionUIComponents:Vector.<MovieClip>;
        
        public function StartOptionsContainer()
        {
            this.fadeTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.modeUIComponents = new Vector.<MovieClip>();
            this.mapUIComponents = new Vector.<MovieClip>();
            this.difficultyUIComponents = new Vector.<MovieClip>();
            this.lengthUIComponents = new Vector.<MovieClip>();
            this.privacyUIComponents = new Vector.<MovieClip>();
            this.regionUIComponents = new Vector.<MovieClip>();
            super();
            currentElement = defaultFirstElement = this.startGameButton;
            sectionHeader = this.optionsHeader;
            defaultNumPrompts = 2;
            this.regionButton.visible = false;
        }
        
        public function set helpText(param1:String) : void
        {
            if(param1 != "")
            {
                this.helperTextContainer.text = param1;
                if(!this._bSearchingForGame)
                {
                    if(this.helperTextContainer.alpha != 1)
                    {
                        this.helperTextContainer.visible = true;
                        this.fadeTimeline.play();
                    }
                }
                else
                {
                    this.fadeTimeline.stop();
                    this.helperTextContainer.y = this.HELPERTEXT_DEFAULT_Y;
                    this.helperTextContainer.alpha = 1;
                    this.helperTextContainer.visible = true;
                }
            }
            else
            {
                this.closeHelpText();
            }
        }
        
        public function closeHelpText() : void
        {
            if(this.helperTextContainer.alpha > 0)
            {
                this.fadeTimeline.reverse(0);
                this.helperTextContainer.visible = false;
            }
            else
            {
                this.fadeTimeline.stop();
                this.helperTextContainer.visible = false;
            }
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.soloGameString = !!param1.soloGameString ? param1.soloGameString : "";
            this.matchMakingString = !!param1.matchMakingString ? param1.matchMakingString : "";
            this.createGameString = !!param1.createGameString ? param1.createGameString : "";
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
            this.regionButton.label = !!param1.regionTitle ? param1.regionTitle : "";
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
            if(param1.regionList)
            {
                this.setObjectList(this.regionList,param1.regionList);
            }
        }
        
        public function set regionListData(param1:Object) : void
        {
            this.setObjectList(this.regionList,param1);
        }
        
        public function set bIsSoloGame(param1:Boolean) : void
        {
            this._bIsSoloGame = param1;
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
                this.dispatchEvent(new Event("FadeOutMissionObjectives"));
            }
            else
            {
                this.startGameButton.label = this.multiplayerLaunchString;
                this.dispatchEvent(new Event("FadeInMissionObjectives"));
            }
            this.privacyButton.enabled = !param1;
            this.lengthButton.enabled = !param1;
            this.difficultyButton.enabled = !param1;
            this.mapButton.enabled = !param1;
            this.modeButton.enabled = !param1;
            this.regionButton.enabled = !param1;
        }
        
        public function get menuState() : int
        {
            return this._currentMenuState;
        }
        
        public function set menuState(param1:int) : void
        {
            if(param1 != this._currentMenuState)
            {
                switch(param1)
                {
                    case StartMenu.MENU_STATE_CREATE_GAME:
                        this.setToCreateGameOptions();
                        ExternalInterface.call("Callback_StartMenuRequestReinit");
                        break;
                    case StartMenu.MENU_STATE_FIND_GAME:
                        this.setToFindGameOptions();
                        ExternalInterface.call("Callback_StartMenuRequestReinit");
                        break;
                    case StartMenu.MENU_STATE_SOLO_GAME:
                        this.setSoloGameOptions();
                        ExternalInterface.call("Callback_StartMenuRequestReinit");
                        break;
                    default:
                        this.setToCreateGameOptions();
                }
                this._currentMenuState = param1;
            }
        }
        
        public function setElementsVisible(param1:Boolean, param2:Vector.<MovieClip>) : void
        {
            var _loc3_:MovieClip = null;
            for each(_loc3_ in param2)
            {
                _loc3_.visible = param1;
            }
        }
        
        public function setElementsYValue(param1:Number, param2:Vector.<MovieClip>) : void
        {
            var _loc3_:MovieClip = null;
            for each(_loc3_ in param2)
            {
                _loc3_.y = param1;
            }
        }
        
        private function setToCreateGameOptions() : *
        {
            this.modeButton.visible = true;
            this.mapButton.visible = true;
            this.difficultyButton.visible = true;
            this.lengthButton.visible = true;
            this.regionButton.visible = bManagerConsoleBuild;
            this.privacyButton.visible = true;
            this.createGameMapImageContainerMC.visible = true;
            this.setElementsYValue(414,this.mapUIComponents);
            this.setElementsYValue(468,this.modeUIComponents);
            this.createGameMapImageContainerMC.y = 144;
            this.setElementsYValue(522,this.difficultyUIComponents);
            this.setElementsYValue(578,this.lengthUIComponents);
            this.setElementsYValue(634,this.privacyUIComponents);
            this.setElementsYValue(690,this.regionUIComponents);
            this.menuBinder.height = !!bManagerConsoleBuild ? Number(this.regionButton.y - this.startGameButton.y + this.regionButton.height) : Number(this.privacyButton.y - this.startGameButton.y + this.privacyButton.height);
            this.bIsSoloGame = false;
            this.backButton.visible = !bManagerUsingGamepad;
            this.optionsHeader.text = this.createGameString;
            this.backButton.label = this.leaveMatchmakingString;
            this.startGameButton.label = this.multiplayerLaunchString;
        }
        
        private function setToFindGameOptions() : *
        {
            this.modeButton.visible = true;
            this.mapButton.visible = false;
            this.mapList.visible = false;
            this.createGameMapImageContainerMC.visible = false;
            this.difficultyButton.visible = true;
            this.lengthButton.visible = true;
            this.setElementsVisible(false,this.privacyUIComponents);
            this.regionButton.visible = bManagerConsoleBuild;
            this.setElementsYValue(136,this.modeUIComponents);
            this.setElementsYValue(190,this.difficultyUIComponents);
            this.setElementsYValue(244,this.lengthUIComponents);
            this.setElementsYValue(300,this.regionUIComponents);
            this.menuBinder.height = !!bManagerConsoleBuild ? Number(this.regionButton.y - this.startGameButton.y + this.regionButton.height) : Number(this.lengthButton.y - this.startGameButton.y + this.lengthButton.height);
            this.bIsSoloGame = false;
            this.backButton.visible = !bManagerUsingGamepad;
            this.optionsHeader.text = this.matchMakingString;
            this.backButton.label = this.leaveMatchmakingString;
            this.startGameButton.label = this.multiplayerLaunchString;
        }
        
        private function setSoloGameOptions() : *
        {
            this.modeButton.visible = true;
            this.mapButton.visible = true;
            this.createGameMapImageContainerMC.visible = true;
            this.difficultyButton.visible = true;
            this.lengthButton.visible = true;
            this.setElementsVisible(false,this.privacyUIComponents);
            this.setElementsVisible(false,this.regionUIComponents);
            this.setElementsYValue(414,this.mapUIComponents);
            this.setElementsYValue(468,this.modeUIComponents);
            this.createGameMapImageContainerMC.y = 144;
            this.setElementsYValue(522,this.difficultyUIComponents);
            this.setElementsYValue(578,this.lengthUIComponents);
            this.menuBinder.height = this.lengthButton.y - this.startGameButton.y + this.lengthButton.height;
            this.bIsSoloGame = true;
            this.backButton.visible = !bManagerUsingGamepad;
            this.optionsHeader.text = this.soloGameString;
            this.backButton.label = this.backString;
            this.startGameButton.label = this.lauchGameString;
        }
        
        public function set bPublicGame(param1:Boolean) : void
        {
            this._bPublicGame = param1;
        }
        
        public function get options() : Object
        {
            var _loc1_:Object = new Object();
            _loc1_.mode = this.modeList.selectedIndex;
            _loc1_.difficulty = this.difficultyList.selectedIndex;
            _loc1_.length = this.lengthList.selectedIndex;
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
            if(param1 == this.mapList)
            {
                if(param2.selectedIndex >= 0 && param2.selectedIndex < param1.dataProvider.length)
                {
                    this.mapSource = param1.dataProvider[param2.selectedIndex].imagePath;
                    this._currentSelectedMapIndex = param2.selectedIndex;
                }
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
            this.regionButton.tabIndex = 6;
            this.startGameButton.tabIndex = 7;
            this.backButton.tabIndex = 8;
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
            this.regionButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            stage.addEventListener(KeyboardEvent.KEY_UP,this.onUserKeyUp,false,0,true);
        }
        
        override public function deselectContainer() : void
        {
            this.closeHelpText();
            super.deselectContainer();
            this.backButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.startGameButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.modeButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.mapButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.difficultyButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.lengthButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.privacyButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.regionButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            stage.removeEventListener(KeyboardEvent.KEY_UP,this.onUserKeyUp);
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.helperTextContainer.visible = false;
            currentElement = defaultFirstElement = this.startGameButton;
            this.initializeLists();
            this.setTabIndex();
            this.mapList.alpha = 0;
            this.backButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.startGameButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.modeButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.mapButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.difficultyButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.lengthButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.privacyButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.regionButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.optionsHeader.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.createGameMapImageContainerMC.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.modeList.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.mapList.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.difficultyList.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.lengthList.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.privacyList.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            stage.addEventListener(MenuManager.PARTYFOCUS_CHANGED,this.onPartyFocusChanged,false,0,true);
            leftSidePanels.push(this.backButton);
            leftSidePanels.push(this.startGameButton);
            leftSidePanels.push(this.modeButton);
            leftSidePanels.push(this.mapButton);
            leftSidePanels.push(this.difficultyButton);
            leftSidePanels.push(this.lengthButton);
            leftSidePanels.push(this.privacyButton);
            leftSidePanels.push(this.regionButton);
            leftSidePanels.push(this.optionsHeader);
            leftSidePanels.push(this.createGameMapImageContainerMC);
            rightSidePanels.push(this.modeList);
            rightSidePanels.push(this.mapList);
            rightSidePanels.push(this.difficultyList);
            rightSidePanels.push(this.lengthList);
            rightSidePanels.push(this.privacyList);
            this.makeAnims();
            this.mapList.addEventListener(MouseEvent.ROLL_OUT,this.resetMap,false,0,true);
            this.modeUIComponents.push(this.modeButton,this.modeList);
            this.mapUIComponents.push(this.mapButton,this.mapList);
            this.difficultyUIComponents.push(this.difficultyButton,this.difficultyList);
            this.lengthUIComponents.push(this.lengthButton,this.lengthList);
            this.privacyUIComponents.push(this.privacyButton,this.privacyList);
            this.regionUIComponents.push(this.regionButton,this.regionList);
            this.backButton.visible = !bManagerUsingGamepad;
        }
        
        public function resetMap(param1:MouseEvent) : void
        {
            this.mapSource = !!this.mapList.dataProvider[this._currentSelectedMapIndex].imagePath ? this.mapList.dataProvider[this._currentSelectedMapIndex].imagePath : "";
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
            this.setListProps(this.regionList,this.regionButton);
        }
        
        function setListProps(param1:TripScrollingList, param2:TripButton = null) : *
        {
            var _loc3_:Array = new Array();
            param1.dataProvider = new DataProvider(_loc3_);
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
                case this.regionButton:
                    this.showOptions(this.regionList);
                    break;
                case this.startGameButton:
                    if(this._bIsSoloGame)
                    {
                        ExternalInterface.call("Callback_StartGame");
                    }
                    else if(this.myStartMenu.menuState == StartMenu.MENU_STATE_FIND_GAME)
                    {
                        if(this._bSearchingForGame)
                        {
                            ExternalInterface.call("Callback_CancelSearch");
                        }
                        else
                        {
                            ExternalInterface.call("Callback_StartOnlineGame");
                        }
                    }
                    else if(this.myStartMenu.menuState == StartMenu.MENU_STATE_CREATE_GAME)
                    {
                        ExternalInterface.call("Callback_CreateOnlineGame");
                    }
            }
        }
        
        public function attemptLeaveMenu() : *
        {
            this.myStartMenu.menuState = StartMenu.MENU_STATE_HOME;
        }
        
        public function set approveMatchMakingLeave(param1:Boolean) : void
        {
            if(param1)
            {
                this.myStartMenu.menuState = StartMenu.MENU_STATE_HOME;
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
            }
        }
        
        private function showOptions(param1:TripScrollingList) : void
        {
            param1.bOpen = true;
            this._currentList = param1;
            this._currentList.addEventListener(ListEvent.ITEM_ROLL_OVER,this.onItemRollOver,false,0,true);
            this._currentList.addEventListener(ListEvent.INDEX_CHANGE,this.onItemRollOver,false,0,true);
            this._currentList.addEventListener(IndexEvent.INDEX_CHANGE,this.onBack,false,0,true);
            this.dispatchEvent(new Event("FadeOutMissionObjectives"));
            if(bManagerUsingGamepad)
            {
                showDimLeftSide(true);
                ExternalInterface.call("Callback_OptionListOpened",this._currentList.name,this._currentList.selectedIndex);
            }
            this.helperTextContainer.y = this._currentList.y + this._currentList.height - 16;
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
                if(this._currentList == this.mapList && this.mapList.alpha == 1 && this.mapList.bOpen)
                {
                    this.mapSource = !!param1.itemData.imagePath ? param1.itemData.imagePath : "";
                }
            }
        }
        
        public function set mapSource(param1:String) : *
        {
            var _loc2_:UILoader = this.createGameMapImageContainerMC.mapImageLoader;
            var _loc3_:String = param1;
            _loc2_.source = param1;
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
                            ExternalInterface.call("Callback_MapSelection",this._currentList.dataProvider[param1.index].mapItemKey);
                            break;
                        case this.privacyList:
                            ExternalInterface.call("Callback_Privacy",param1.index);
                            break;
                        case this.regionList:
                            ExternalInterface.call("Callback_Region",param1.index);
                    }
                    this.closeHelpText();
                }
                else
                {
                    if(this._currentList == this.mapList)
                    {
                        this.resetMap(null);
                    }
                    this.closeHelpText();
                }
                if(this._currentList != null)
                {
                    this._currentList.removeEventListener(IndexEvent.INDEX_CHANGE,this.onBack);
                    this._currentList.removeEventListener(ListEvent.ITEM_ROLL_OVER,this.onItemRollOver);
                    this._currentList.removeEventListener(ListEvent.INDEX_CHANGE,this.onItemRollOver);
                }
                showDimLeftSide(false);
                this.dispatchEvent(new Event("FadeInMissionObjectives"));
            }
        }
        
        private function resetMapOption() : *
        {
        }
        
        protected function onPartyFocusChanged(param1:Event) : *
        {
            this.helperTextContainer.visible = false;
            if(bManagerUsingGamepad && MenuManager.manager.bPartyWidgetFocused)
            {
                this.closeHelpText();
                this.helperTextContainer.visible = false;
            }
        }
        
        override protected function closeAnimation() : *
        {
            visible = false;
        }
    }
}
