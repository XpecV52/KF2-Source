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
        
        public function ButtonGroup(name:String, scope:DisplayObjectContainer)
        {
            super();
            this.name = name;
            this.weakScope = new Dictionary(true);
            this.weakScope[scope] = null;
            this._children = [];
        }
        
        public static function getGroup(name:String, scope:DisplayObjectContainer) : ButtonGroup
        {
            var list:Object = groups[scope];
            if(list == null)
            {
                list = groups[scope] = new Object();
            }
            var group:ButtonGroup = list[name.toLowerCase()];
            if(group == null)
            {
                group = list[name.toLowerCase()] = new ButtonGroup(name,scope);
            }
            return group;
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
            var a:* = undefined;
            var doc:DisplayObjectContainer = null;
            var _loc3_:int = 0;
            var _loc4_:* = this.scope;
            for(a in _loc4_)
            {
                doc = a as DisplayObjectContainer;
            }
            return doc;
        }
        
        public function addButton(button:Button) : void
        {
            this.removeButton(button);
            this._children.push(button);
            if(button.selected)
            {
                this.updateSelectedButton(button,true);
            }
            button.addEventListener(Event.SELECT,this.handleSelect,false,0,true);
            button.addEventListener(ButtonEvent.CLICK,this.handleClick,false,0,true);
            button.addEventListener(Event.REMOVED,this.handleRemoved,false,0,true);
        }
        
        public function removeButton(button:Button) : void
        {
            var index:int = this._children.indexOf(button);
            if(index == -1)
            {
                return;
            }
            this._children.splice(index,1);
            button.removeEventListener(Event.SELECT,this.handleSelect,false);
            button.removeEventListener(ButtonEvent.CLICK,this.handleClick,false);
        }
        
        public function getButtonAt(index:int) : Button
        {
            return this._children[index] as Button;
        }
        
        public function setSelectedButtonByIndex(index:uint, selected:Boolean = true) : Boolean
        {
            var success:Boolean = false;
            var btn:Button = this._children[index] as Button;
            if(btn != null)
            {
                btn.selected = selected;
                success = true;
            }
            return success;
        }
        
        protected function updateSelectedButton(button:Button, selected:Boolean = true) : void
        {
            if(selected && button == this.selectedButton)
            {
                return;
            }
            var turnOffOnly:Boolean = !selected && button == this.selectedButton && button.allowDeselect;
            var oldButton:Button = this.selectedButton;
            if(selected)
            {
                this.selectedButton = button;
            }
            if(selected && oldButton != null)
            {
                oldButton.selected = false;
            }
            if(turnOffOnly)
            {
                this.selectedButton = null;
            }
            else if(!selected)
            {
                return;
            }
            dispatchEvent(new Event(Event.CHANGE));
        }
        
        public function hasButton(button:Button) : Boolean
        {
            return this._children.indexOf(button) > -1;
        }
        
        override public function toString() : String
        {
            return "[CLIK ButtonGroup " + this.name + " (" + this._children.length + ")]";
        }
        
        protected function handleSelect(event:Event) : void
        {
            var button:Button = event.target as Button;
            if(button.selected)
            {
                this.updateSelectedButton(button,true);
            }
            else
            {
                this.updateSelectedButton(button,false);
            }
        }
        
        protected function handleClick(event:ButtonEvent) : void
        {
            dispatchEvent(event);
        }
        
        protected function handleRemoved(event:Event) : void
        {
            this.removeButton(event.target as Button);
        }
    }
}
