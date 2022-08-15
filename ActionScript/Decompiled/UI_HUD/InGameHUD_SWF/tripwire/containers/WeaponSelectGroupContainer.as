package tripwire.containers
{
    import flash.display.MovieClip;
    import scaleform.clik.core.UIComponent;
    import tripwire.widgets.WeaponSelectWidget;
    
    public class WeaponSelectGroupContainer extends UIComponent
    {
         
        
        public var WeaponCategoryHeaderContainer:MovieClip;
        
        private const MAX_WEAPONS:int = 3;
        
        private var _weaponItemContainers:Vector.<WeaponSelectItemContainer>;
        
        private var _weaponList:Array;
        
        private var _selectedIndex:int;
        
        private var _selectedItem:WeaponSelectItemContainer;
        
        private var _firstItemIndex:int;
        
        private var _headerName:String = "";
        
        public var UpArrow:MovieClip;
        
        public var DownArrow:MovieClip;
        
        public function WeaponSelectGroupContainer()
        {
            super();
            this.updateContainers();
        }
        
        public function get weaponList() : Array
        {
            return this._weaponList;
        }
        
        public function set weaponList(param1:Array) : void
        {
            this._weaponList = param1;
            this.updateWeaponList();
            this.updateArrows();
        }
        
        public function get header() : String
        {
            return this._headerName;
        }
        
        public function set header(param1:String) : void
        {
            this._headerName = param1;
            this.WeaponCategoryHeaderContainer.CategoryTextContainer.CategoryText.text = param1;
        }
        
        public function updateContainers() : *
        {
            this._selectedItem = null;
            this._weaponItemContainers = new Vector.<WeaponSelectItemContainer>();
            var _loc1_:int = 0;
            while(_loc1_ < this.MAX_WEAPONS)
            {
                this._weaponItemContainers.push(this["WeaponItem" + _loc1_]);
                _loc1_++;
            }
        }
        
        public function showAllElements() : *
        {
            this.updateWeaponList();
        }
        
        public function showFirstElement() : *
        {
            var _loc1_:int = 0;
            var _loc2_:int = 0;
            while(_loc2_ < this.MAX_WEAPONS)
            {
                if(_loc2_ < this.weaponList.length)
                {
                    _loc1_ = this.firstItemIndex + _loc2_;
                    if(_loc1_ > this.weaponList.length - 1)
                    {
                        _loc1_ %= this.weaponList.length - 1;
                    }
                    this._weaponItemContainers[_loc2_].data = this.weaponList[_loc1_];
                    if(_loc2_ == 0)
                    {
                        this._weaponItemContainers[_loc2_].visible = true;
                    }
                    else
                    {
                        this._weaponItemContainers[_loc2_].visible = true;
                    }
                }
                else
                {
                    this._weaponItemContainers[_loc2_].visible = false;
                }
                _loc2_++;
            }
        }
        
        private function updateWeaponList() : *
        {
            var _loc1_:int = 0;
            var _loc2_:int = 0;
            while(_loc2_ < this.MAX_WEAPONS)
            {
                if(_loc2_ < this.weaponList.length)
                {
                    if(!this._weaponItemContainers[_loc2_].visible)
                    {
                        this._weaponItemContainers[_loc2_].visible = true;
                    }
                    _loc1_ = this.firstItemIndex + _loc2_;
                    if(_loc1_ > this.weaponList.length - 1)
                    {
                        _loc1_ %= this.weaponList.length - 1;
                    }
                    this._weaponItemContainers[_loc2_].data = this.weaponList[_loc1_];
                }
                else
                {
                    this._weaponItemContainers[_loc2_].visible = false;
                }
                _loc2_++;
            }
            this.updateArrows();
        }
        
        public function get selectedIndex() : int
        {
            return this._selectedIndex;
        }
        
        public function set selectedIndex(param1:int) : void
        {
            var _loc2_:int = this._selectedIndex;
            this._selectedIndex = param1;
            if(WeaponSelectWidget.state == WeaponSelectWidget.CONTROLLER_STATE)
            {
                this.firstItemIndex = this.selectedIndex;
                this._selectedItem = this._weaponItemContainers[0];
            }
            else
            {
                if(param1 == 0)
                {
                    this.firstItemIndex = 0;
                }
                else if(param1 < _loc2_)
                {
                    if(param1 >= this.MAX_WEAPONS && _loc2_ + this.MAX_WEAPONS <= param1)
                    {
                        this.firstItemIndex = param1 + 1;
                    }
                    else if(this.firstItemIndex != 0 && this.firstItemIndex == _loc2_)
                    {
                        this.firstItemIndex = param1;
                    }
                }
                else if(param1 > _loc2_ && param1 >= this.firstItemIndex + this.MAX_WEAPONS)
                {
                    this.firstItemIndex = param1 - (this.MAX_WEAPONS - 1);
                }
                if(this._selectedItem != null)
                {
                    this._selectedItem.unselected();
                }
                this._selectedItem = this._weaponItemContainers[param1 - this.firstItemIndex];
            }
            this._selectedItem.selected();
        }
        
        public function get firstItemIndex() : int
        {
            return this._firstItemIndex;
        }
        
        public function set firstItemIndex(param1:*) : void
        {
            if(this._firstItemIndex != param1)
            {
                this._firstItemIndex = param1;
                this.updateWeaponList();
            }
        }
        
        public function unselectGroup() : void
        {
            if(this._selectedItem != null)
            {
                this.selectedIndex = 0;
                this._selectedItem.unselected();
                this._selectedItem = null;
            }
        }
        
        private function updateArrows() : void
        {
            if(WeaponSelectWidget.state == WeaponSelectWidget.CONTROLLER_STATE)
            {
                this.DownArrow.visible = this.weaponList.length > this.MAX_WEAPONS;
                this.UpArrow.visible = false;
            }
            else
            {
                if(this.firstItemIndex > 0)
                {
                    this.UpArrow.visible = true;
                }
                else
                {
                    this.UpArrow.visible = false;
                }
                if(this.weaponList.length > this.MAX_WEAPONS)
                {
                    this.DownArrow.visible = true;
                    if(this.selectedIndex == this.weaponList.length - 1)
                    {
                        this.DownArrow.visible = false;
                    }
                }
                else
                {
                    this.DownArrow.visible = false;
                }
            }
        }
        
        private function initArrows() : void
        {
            if(this.weaponList.length > this.MAX_WEAPONS)
            {
                this.DownArrow.visible = true;
            }
            else
            {
                this.DownArrow.visible = false;
            }
            this.UpArrow.visible = false;
        }
    }
}
