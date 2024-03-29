package scaleform.clik.controls
{
    import flash.display.DisplayObjectContainer;
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.utils.Dictionary;
    import scaleform.clik.events.ButtonEvent;
    
    public class ButtonGroup extends EventDispatcher
    {
        
        public static var groups:Dictionary = new Dictionary(true);
         
        
        public var name:String;
        
        protected var weakScope:Dictionary;
        
        public var selectedButton:Button;
        
        protected var _children:Array;
        
        public function ButtonGroup(param1:String, param2:DisplayObjectContainer)
        {
            super();
            this.name = param1;
            this.weakScope = new Dictionary(true);
            this.weakScope[param2] = null;
            this._children = [];
        }
        
        public static function getGroup(param1:String, param2:DisplayObjectContainer) : ButtonGroup
        {
            var _loc3_:Object = groups[param2];
            if(_loc3_ == null)
            {
                _loc3_ = groups[param2] = new Object();
            }
            var _loc4_:ButtonGroup;
            if((_loc4_ = _loc3_[param1.toLowerCase()]) == null)
            {
                _loc4_ = _loc3_[param1.toLowerCase()] = new ButtonGroup(param1,param2);
            }
            return _loc4_;
        }
        
        public function get length() : uint
        {
            return this._children.length;
        }
        
        public function get data() : Object
        {
            return this.selectedButton.data;
        }
        
        public function get selectedIndex() : int
        {
            return this._children.indexOf(this.selectedButton);
        }
        
        public function get scope() : DisplayObjectContainer
        {
            var _loc2_:* = undefined;
            var _loc1_:DisplayObjectContainer = null;
            var _loc3_:int = 0;
            var _loc4_:* = this.scope;
            for(_loc2_ in _loc4_)
            {
                _loc1_ = _loc2_ as DisplayObjectContainer;
            }
            return _loc1_;
        }
        
        public function addButton(param1:Button) : void
        {
            this.removeButton(param1);
            this._children.push(param1);
            if(param1.selected)
            {
                this.updateSelectedButton(param1,true);
            }
            param1.addEventListener(Event.SELECT,this.handleSelect,false,0,true);
            param1.addEventListener(ButtonEvent.CLICK,this.handleClick,false,0,true);
            param1.addEventListener(Event.REMOVED,this.handleRemoved,false,0,true);
        }
        
        public function removeButton(param1:Button) : void
        {
            var _loc2_:int = this._children.indexOf(param1);
            if(_loc2_ == -1)
            {
                return;
            }
            this._children.splice(_loc2_,1);
            param1.removeEventListener(Event.SELECT,this.handleSelect,false);
            param1.removeEventListener(ButtonEvent.CLICK,this.handleClick,false);
        }
        
        public function getButtonAt(param1:int) : Button
        {
            return this._children[param1] as Button;
        }
        
        public function setSelectedButtonByIndex(param1:uint, param2:Boolean = true) : Boolean
        {
            var _loc3_:Boolean = false;
            var _loc4_:Button;
            if((_loc4_ = this._children[param1] as Button) != null)
            {
                _loc4_.selected = param2;
                _loc3_ = true;
            }
            return _loc3_;
        }
        
        protected function updateSelectedButton(param1:Button, param2:Boolean = true) : void
        {
            if(param2 && param1 == this.selectedButton)
            {
                return;
            }
            var _loc3_:Boolean = !param2 && param1 == this.selectedButton && param1.allowDeselect;
            var _loc4_:Button = this.selectedButton;
            if(param2)
            {
                this.selectedButton = param1;
            }
            if(param2 && _loc4_ != null)
            {
                _loc4_.selected = false;
            }
            if(_loc3_)
            {
                this.selectedButton = null;
            }
            else if(!param2)
            {
                return;
            }
            dispatchEvent(new Event(Event.CHANGE));
        }
        
        public function hasButton(param1:Button) : Boolean
        {
            return this._children.indexOf(param1) > -1;
        }
        
        override public function toString() : String
        {
            return "[CLIK ButtonGroup " + this.name + " (" + this._children.length + ")]";
        }
        
        protected function handleSelect(param1:Event) : void
        {
            var _loc2_:Button = param1.target as Button;
            if(_loc2_.selected)
            {
                this.updateSelectedButton(_loc2_,true);
            }
            else
            {
                this.updateSelectedButton(_loc2_,false);
            }
        }
        
        protected function handleClick(param1:ButtonEvent) : void
        {
            dispatchEvent(param1);
        }
        
        protected function handleRemoved(param1:Event) : void
        {
            this.removeButton(param1.target as Button);
        }
    }
}
