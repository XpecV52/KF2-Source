package tripwire.containers.serverBrowser
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.Button;
    import scaleform.clik.controls.CheckBox;
    import scaleform.clik.controls.Label;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.ui.InputDetails;
    import tripwire.containers.TripSubContainer;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripCheckBox;
    import tripwire.controls.TripScrollingList;
    import tripwire.managers.MenuManager;
    
    public class ServerBrowserFilterContainer extends TripSubContainer
    {
         
        
        public var filterCheckBox0:TripCheckBox;
        
        public var filterCheckBox1:TripCheckBox;
        
        public var filterCheckBox2:TripCheckBox;
        
        public var filterCheckBox3:TripCheckBox;
        
        public var filterCheckBox4:TripCheckBox;
        
        public var filterCheckBox5:TripCheckBox;
        
        public var filterCheckBox6:TripCheckBox;
        
        public var filterCheckBox7:TripCheckBox;
        
        public var filterCheckBox8:TripCheckBox;
        
        public var filterCheckBox9:TripCheckBox;
        
        public var filterCheckBox10:TripCheckBox;
        
        public var filterChangeFunction:Function;
        
        public var titleText:Label;
        
        public var backButton:Button;
        
        public var gameModeButton:TripButton;
        
        public var mapButton:TripButton;
        
        public var difficultyButton:TripButton;
        
        public var lengthButton:TripButton;
        
        public var pingButton:TripButton;
        
        public var resetButton:TripButton;
        
        public var applyButton:TripButton;
        
        public var gameModeScrollingList:TripScrollingList;
        
        public var mapScrollingList:TripScrollingList;
        
        public var difficultyScrollingList:TripScrollingList;
        
        public var lengthScrollingList:TripScrollingList;
        
        public var pingScrollingList:TripScrollingList;
        
        public var gameModeLabel:TextField;
        
        public var mapLabel:TextField;
        
        public var difficultyLabel:TextField;
        
        public var lengthLabel:TextField;
        
        public var pingLabel:TextField;
        
        private var filterListArray:Array;
        
        private var _lastTabIndex:int = -1;
        
        private const NUM_OF_FILTERS:int = 11;
        
        private const STARTING_TABINDEX:int = 8;
        
        public function ServerBrowserFilterContainer()
        {
            super();
            this.backButton.focusable = false;
            this.initCheckBoxes();
            this.initLists();
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            this.initCheckBoxes();
            this.initLists();
            this.initButtons();
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            var _loc1_:int = 0;
            while(_loc1_ < this.NUM_OF_FILTERS)
            {
                this["filterCheckBox" + _loc1_].removeEventListener(ButtonEvent.CLICK,this.onFilterClick);
                _loc1_++;
            }
            this.backButton.removeEventListener(ButtonEvent.CLICK,this.handleButtonEvent);
            this.applyButton.removeEventListener(ButtonEvent.CLICK,this.handleButtonEvent);
            this.resetButton.removeEventListener(ButtonEvent.CLICK,this.handleButtonEvent);
            this.deactivateList(this.gameModeScrollingList,this.gameModeButton);
            this.deactivateList(this.mapScrollingList,this.mapButton);
            this.deactivateList(this.difficultyScrollingList,this.difficultyButton);
            this.deactivateList(this.lengthScrollingList,this.lengthButton);
            this.deactivateList(this.pingScrollingList,this.pingButton);
            this.filterListArray = null;
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            this.onBack(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            defaultFirstElement = currentElement = this.filterCheckBox0;
            visible = false;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.backButton.label = param1.back;
            this.resetButton.label = param1.reset;
            this.applyButton.label = param1.apply;
            this.titleText.text = param1.filters;
            this.gameModeLabel.text = param1.gameMode;
            this.mapLabel.text = param1.map;
            this.difficultyLabel.text = param1.difficulty;
            this.lengthLabel.text = param1.length;
            this.pingLabel.text = param1.ping;
        }
        
        public function set filterLabels(param1:Object) : void
        {
            var _loc2_:int = 0;
            while(_loc2_ < this.NUM_OF_FILTERS + 1)
            {
                if(_loc2_ < param1.length)
                {
                    this["filterCheckBox" + _loc2_].visible = true;
                    this["filterCheckBox" + _loc2_].label = param1[_loc2_].label;
                    this["filterCheckBox" + _loc2_].Key = param1[_loc2_].key;
                    this["filterCheckBox" + _loc2_].selected = param1[_loc2_].selected;
                }
                else
                {
                    this["filterCheckBox" + _loc2_].visible = false;
                }
                _loc2_++;
            }
        }
        
        private function initLists() : void
        {
            this.filterListArray = new Array();
            this.setUpList(this.gameModeScrollingList,this.gameModeButton);
            this.setUpList(this.mapScrollingList,this.mapButton);
            this.setUpList(this.difficultyScrollingList,this.difficultyButton);
            this.setUpList(this.lengthScrollingList,this.lengthButton);
            this.setUpList(this.pingScrollingList,this.pingButton);
        }
        
        private function initCheckBoxes() : void
        {
            var _loc1_:int = 0;
            while(_loc1_ < this.NUM_OF_FILTERS)
            {
                this["filterCheckBox" + _loc1_].addEventListener(Event.SELECT,this.onFilterClick,false,0,true);
                this["filterCheckBox" + _loc1_].tabIndex = _loc1_ + this.STARTING_TABINDEX;
                _loc1_++;
            }
            this._lastTabIndex = _loc1_;
        }
        
        private function initButtons() : void
        {
            this.backButton.addEventListener(ButtonEvent.CLICK,this.handleButtonEvent,false,0,true);
            this.applyButton.addEventListener(ButtonEvent.CLICK,this.handleButtonEvent,false,0,true);
            this.resetButton.addEventListener(ButtonEvent.CLICK,this.handleButtonEvent,false,0,true);
            this.backButton.tabIndex = this._lastTabIndex;
            ++this._lastTabIndex;
            this.applyButton.tabIndex = this._lastTabIndex;
            ++this._lastTabIndex;
            this.resetButton.tabIndex = this._lastTabIndex;
            ++this._lastTabIndex;
        }
        
        private function onFilterClick(param1:Event) : *
        {
            var _loc2_:CheckBox = TripCheckBox(param1.currentTarget);
            if(this.filterChangeFunction != null)
            {
                this.filterChangeFunction(_loc2_);
            }
        }
        
        private function setUpList(param1:TripScrollingList, param2:TripButton) : void
        {
            this.filterListArray.push(param1);
            param1.addEventListener(IndexEvent.INDEX_CHANGE,this.onBack,false,0,true);
            param1.bOpen = false;
            param1.associatedButton = param2;
            param2.addEventListener(ButtonEvent.CLICK,this.handleButtonEvent,false,0,true);
            param2.tabIndex = this._lastTabIndex;
            ++this._lastTabIndex;
        }
        
        private function deactivateList(param1:TripScrollingList, param2:TripButton) : void
        {
            param1.removeEventListener(IndexEvent.INDEX_CHANGE,this.onBack);
            param2.removeEventListener(ButtonEvent.CLICK,this.handleButtonEvent);
        }
        
        private function resetFilters() : void
        {
            var _loc1_:int = 0;
            while(_loc1_ < this.NUM_OF_FILTERS)
            {
                this["filterCheckBox" + _loc1_].selected = false;
                _loc1_++;
            }
            this.gameModeScrollingList.selectedIndex = 0;
            this.mapScrollingList.selectedIndex = 0;
            this.difficultyScrollingList.selectedIndex = 0;
            this.lengthScrollingList.selectedIndex = 0;
            this.pingScrollingList.selectedIndex = 0;
            this.gameModeScrollingList.associatedButton.label = "-";
            this.mapScrollingList.associatedButton.label = "-";
            this.difficultyScrollingList.associatedButton.label = "-";
            this.lengthScrollingList.associatedButton.label = "-";
            this.pingScrollingList.associatedButton.label = "-";
            this.filterChangeFunction(null,true);
            ExternalInterface.call("Callback_ResetFilters");
        }
        
        protected function handleButtonEvent(param1:ButtonEvent) : void
        {
            currentElement = param1.currentTarget as UIComponent;
            switch(currentElement)
            {
                case this.backButton:
                    this.onBack(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
                    break;
                case this.resetButton:
                    this.resetFilters();
                    break;
                case this.applyButton:
                    ExternalInterface.call("Callback_FiltersApplied");
                    this.onBack(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
                    break;
                case this.gameModeButton:
                    this.gameModeScrollingList.bOpen = true;
                    break;
                case this.mapButton:
                    this.mapScrollingList.bOpen = true;
                    break;
                case this.difficultyButton:
                    this.difficultyScrollingList.bOpen = true;
                    break;
                case this.lengthButton:
                    this.lengthScrollingList.bOpen = true;
                    break;
                case this.pingButton:
                    this.pingScrollingList.bOpen = true;
            }
        }
        
        private function get currentList() : TripScrollingList
        {
            var _loc1_:TripScrollingList = null;
            if(this.filterListArray)
            {
                for each(_loc1_ in this.filterListArray)
                {
                    if(_loc1_.bOpen)
                    {
                        return _loc1_;
                    }
                }
            }
            return null;
        }
        
        protected function onBack(param1:IndexEvent) : void
        {
            var _loc2_:TripScrollingList = this.currentList;
            if(!_loc2_)
            {
                dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
            }
            else
            {
                if(MenuManager.manager != null && MenuManager.manager.bUsingGamepad)
                {
                    if(_loc2_.associatedButton != null)
                    {
                        _loc2_.associatedButton.focused = 1;
                    }
                }
                this.closeAllLists();
                if(param1.index != CANCELLED_INDEX)
                {
                    switch(param1.currentTarget)
                    {
                        case this.gameModeScrollingList:
                            ExternalInterface.call("Callback_ModeFilter",param1.index);
                            break;
                        case this.lengthScrollingList:
                            ExternalInterface.call("Callback_LengthFilter",param1.index);
                            break;
                        case this.difficultyScrollingList:
                            ExternalInterface.call("Callback_DifficultyFilter",param1.index);
                            break;
                        case this.mapScrollingList:
                            ExternalInterface.call("Callback_MapFilter",param1.index);
                            break;
                        case this.pingScrollingList:
                            ExternalInterface.call("Callback_PingFilter",param1.index);
                    }
                    _loc2_.associatedButton.label = _loc2_.dataProvider[param1.index].label;
                }
            }
        }
        
        private function closeAllLists() : void
        {
            this.gameModeScrollingList.bOpen = false;
            this.mapScrollingList.bOpen = false;
            this.difficultyScrollingList.bOpen = false;
            this.lengthScrollingList.bOpen = false;
            this.pingScrollingList.bOpen = false;
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
                "useFrames":true
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
                "useFrames":true
            });
        }
    }
}
