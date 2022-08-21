package tripwire.containers.optionsControls
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import scaleform.clik.controls.ScrollBar;
    import scaleform.clik.events.ButtonEvent;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripButton;
    
    public class ControlsBindingContainer extends TripContainer
    {
        
        public static const DISABLE_LISTS:String = "DisableLists";
        
        public static const CANCEL_BIND:String = "CancelBind";
         
        
        public var popupContainer:BindingConflictContainer;
        
        public var resetButton:TripButton;
        
        public var bindingSections:MovieClip;
        
        public var scrollBar:ScrollBar;
        
        public var bindingMask:MovieClip;
        
        private var _sectionList:Array;
        
        private var _selectedSectionIndex:int;
        
        private var _scrollRate:int = 48;
        
        private var _scrollPosition:Number;
        
        private var _pageSize:int;
        
        private var _scrollDistance:int;
        
        public function ControlsBindingContainer()
        {
            super();
            this.bindingSections.height = 0;
            this._sectionList = new Array();
            this.bindingSections.addEventListener(MouseEvent.MOUSE_WHEEL,this.handleMouseWheel,false,0,true);
            this.scrollBar.addEventListener(Event.SCROLL,this.handleScroll,false,0,true);
            this.resetButton.addEventListener(ButtonEvent.PRESS,this.onResetControls,false,0,true);
            this.popupContainer.addEventListener(CANCEL_BIND,this.onCancelBind,false,0,true);
            this.popupContainer.visible = false;
        }
        
        public function set localizedText(param1:Object) : *
        {
            this.resetButton.label = param1.resetLabel;
        }
        
        public function set localizedPopup(param1:Object) : *
        {
            this.popupContainer.localizedPopup = param1;
        }
        
        public function set commandList(param1:Array) : *
        {
            this.createNewSection(param1);
        }
        
        private function createNewSection(param1:Array) : *
        {
            var _loc2_:BindingSection = new BindingSection();
            _loc2_.sectionIndex = param1.sectionIndex;
            _loc2_.bindingHeader = param1.bindingHeader;
            _loc2_.pressKeyString = param1.pressKeyString;
            _loc2_.setCommandData(param1);
            _loc2_.addEventListener(DISABLE_LISTS,this.onDisableLists,false,0,true);
            _loc2_.y = this.bindingSections.height;
            this.bindingSections.height += Math.ceil(param1.length / 2) * _loc2_.itemRendererSize + _loc2_.headerBuffer;
            this.bindingSections.addChild(_loc2_);
            this._sectionList.push(_loc2_);
            var _loc3_:int = this.bindingSections.height;
            this._pageSize = this.bindingMask.height;
            this._scrollDistance = _loc3_ - this._pageSize - 4;
            this.updateScrollBar();
        }
        
        public function setSectionBindings(param1:int, param2:Array) : *
        {
            this.enableLists();
            this._sectionList[param1].setBindData(param2);
        }
        
        public function setConflictMessage(param1:String, param2:String, param3:String, param4:int) : *
        {
            this._selectedSectionIndex = param4;
            this.popupContainer.openContainer();
            this.popupContainer.setConflictMessage(param1,param2,param3);
        }
        
        private function enableLists() : *
        {
            var _loc1_:int = 0;
            while(_loc1_ < this._sectionList.length)
            {
                this._sectionList[_loc1_].mouseChildren = true;
                this._sectionList[_loc1_].bindList1.enabled = true;
                this._sectionList[_loc1_].bindList2.enabled = true;
                this._sectionList[_loc1_].bindList1.selectedIndex = -1;
                this._sectionList[_loc1_].bindList2.selectedIndex = -1;
                _loc1_++;
            }
        }
        
        private function disableLists() : *
        {
            var _loc1_:int = 0;
            while(_loc1_ < this._sectionList.length)
            {
                this._sectionList[_loc1_].mouseChildren = false;
                this._sectionList[_loc1_].bindList1.enabled = false;
                this._sectionList[_loc1_].bindList2.enabled = false;
                _loc1_++;
            }
        }
        
        private function onDisableLists(param1:Event) : *
        {
            this.disableLists();
        }
        
        private function onCancelBind(param1:Event) : *
        {
            this.enableLists();
            this._sectionList[this._selectedSectionIndex].resetPressKey();
        }
        
        private function handleMouseWheel(param1:MouseEvent) : *
        {
            var _loc2_:int = 0;
            if(this._scrollDistance > 0)
            {
                _loc2_ = 0;
                this.bindingSections.y += param1.delta > 0 ? this._scrollRate : -this._scrollRate;
                this.bindingSections.y = Math.max(Math.min(this.bindingSections.y,_loc2_),-this._scrollDistance);
            }
            this.updateScrollBar();
        }
        
        private function handleScroll(param1:Event) : *
        {
            this.bindingSections.y = -this.scrollBar.position;
        }
        
        private function updateScrollBar() : *
        {
            this.scrollBar.setScrollProperties(this._pageSize,0,this._scrollDistance,this._scrollRate);
            this.scrollBar.position = -this.bindingSections.y;
            this.scrollBar.validateNow();
        }
        
        private function onResetControls(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_ResetControls");
        }
        
        private function testLists() : *
        {
            var _loc1_:Array = new Array();
            var _loc2_:int = 1;
            while(_loc2_ < 10)
            {
                _loc1_.push({
                    "label":"MyItem " + _loc2_,
                    "index":_loc2_
                });
                _loc2_++;
            }
            this.createNewSection(_loc1_);
            this.createNewSection(_loc1_);
            this.createNewSection(_loc1_);
            this.setSectionBindings(0,_loc1_);
        }
        
        override protected function openAnimation(param1:Boolean = true) : *
        {
            alpha = 1;
            visible = true;
            _bReadyForInput = true;
            mouseEnabled = mouseChildren = true;
        }
        
        override protected function closeAnimation() : *
        {
            mouseEnabled = mouseChildren = false;
            _bReadyForInput = false;
            visible = false;
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            if(this.popupContainer != null)
            {
                this.popupContainer.closeContainer();
            }
        }
        
        override protected function pushToBackAnimation() : *
        {
        }
    }
}
