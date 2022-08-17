package scaleform.clik.controls
{
    import scaleform.clik.data.ListData;
    import scaleform.clik.interfaces.IListItemRenderer;
    
    public class ListItemRenderer extends Button implements IListItemRenderer
    {
         
        
        protected var _index:uint = 0;
        
        protected var _selectable:Boolean = true;
        
        public function ListItemRenderer()
        {
            super();
        }
        
        override public function get focusable() : Boolean
        {
            return _focusable;
        }
        
        override public function set focusable(value:Boolean) : void
        {
        }
        
        public function get index() : uint
        {
            return this._index;
        }
        
        public function set index(value:uint) : void
        {
            this._index = value;
        }
        
        public function get selectable() : Boolean
        {
            return this._selectable;
        }
        
        public function set selectable(value:Boolean) : void
        {
            this._selectable = value;
        }
        
        public function setListData(listData:ListData) : void
        {
            this.index = listData.index;
            selected = listData.selected;
            label = listData.label || "";
        }
        
        public function setData(data:Object) : void
        {
            this.data = data;
        }
        
        override public function toString() : String
        {
            return "[CLIK ListItemRenderer " + this.index + ", " + name + "]";
        }
        
        override protected function configUI() : void
        {
            super.configUI();
            focusTarget = owner;
            _focusable = tabEnabled = tabChildren = mouseChildren = false;
        }
    }
}
