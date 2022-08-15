package tripwire.containers.optionsControls
{
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.ScrollingList;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.interfaces.IListItemRenderer;
    import tripwire.containers.TripContainer;
    
    public class KeybindGroupContainer extends TripContainer
    {
         
        
        public var sectionTextField:TextField;
        
        public var commandList1:ScrollingList;
        
        public var commandList2:ScrollingList;
        
        public var bindList1:ScrollingList;
        
        public var bindList2:ScrollingList;
        
        public var headerBuffer:int = 48;
        
        public var itemRendererSize:int = 48;
        
        private var commandList:Vector.<String>;
        
        private var _pressKeyString:String;
        
        private var _storedKeyString:String;
        
        private var _sectionIndex:int;
        
        private var _selectedIndex:int;
        
        private var _selectedList:ScrollingList;
        
        public function KeybindGroupContainer()
        {
            super();
            this.bindList1.addEventListener(ListEvent.ITEM_CLICK,this.listClicked,false,0,true);
            this.bindList2.addEventListener(ListEvent.ITEM_CLICK,this.listClicked,false,0,true);
        }
        
        public function set sectionIndex(param1:int) : void
        {
            this._sectionIndex = param1;
        }
        
        public function set sectionHeader(param1:String) : void
        {
            this.sectionTextField.text = param1;
        }
        
        public function set pressKeyString(param1:String) : void
        {
            this._pressKeyString = param1;
        }
        
        public function setCommandData(param1:Array) : void
        {
            var _loc2_:Array = new Array();
            var _loc3_:Array = new Array();
            var _loc4_:int = 0;
            while(_loc4_ < param1.length)
            {
                if(_loc4_ % 2 == 0)
                {
                    _loc2_.push(param1[_loc4_]);
                }
                else
                {
                    _loc3_.push(param1[_loc4_]);
                }
                _loc4_++;
            }
            this.commandList1.dataProvider = new DataProvider(_loc2_);
            this.commandList2.dataProvider = new DataProvider(_loc3_);
        }
        
        public function setBindData(param1:Array) : void
        {
            var _loc2_:Array = new Array();
            var _loc3_:Array = new Array();
            this.commandList = new Vector.<String>();
            var _loc4_:int = 0;
            while(_loc4_ < param1.length)
            {
                if(_loc4_ % 2 == 0)
                {
                    _loc2_.push(param1[_loc4_]);
                }
                else
                {
                    _loc3_.push(param1[_loc4_]);
                }
                this.commandList.push(!!param1[_loc4_].command ? param1[_loc4_].command : "");
                _loc4_++;
            }
            this.bindList1.dataProvider = new DataProvider(_loc2_);
            this.bindList2.dataProvider = new DataProvider(_loc3_);
        }
        
        public function resetPressKey() : *
        {
            var _loc1_:IListItemRenderer = this._selectedList.getRendererAt(this._selectedIndex);
            var _loc2_:Object = new Object();
            _loc2_.label = this._storedKeyString;
            _loc1_.setData(_loc2_);
            this._selectedList.validateNow();
        }
        
        private function listClicked(param1:ListEvent) : void
        {
            var _loc2_:int = param1.index * 2;
            if(param1.target == this.bindList2)
            {
                _loc2_ += 1;
            }
            this._selectedList = param1.target as ScrollingList;
            this._selectedIndex = param1.index;
            this._storedKeyString = this._selectedList.dataProvider[this._selectedIndex].label;
            var _loc3_:IListItemRenderer = this._selectedList.getRendererAt(this._selectedIndex);
            var _loc4_:Object;
            (_loc4_ = new Object()).label = this._pressKeyString;
            _loc3_.setData(_loc4_);
            this._selectedList.validateNow();
            dispatchEvent(new Event(ControlsBindingContainer.DISABLE_LISTS));
            ExternalInterface.call("Callback_ChangeBind",this.commandList[_loc2_],this._sectionIndex);
        }
    }
}
