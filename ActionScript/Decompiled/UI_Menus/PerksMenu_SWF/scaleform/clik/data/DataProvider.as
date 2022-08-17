package scaleform.clik.data
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IEventDispatcher;
    import scaleform.clik.interfaces.IDataProvider;
    
    public dynamic class DataProvider extends Array implements IDataProvider, IEventDispatcher
    {
         
        
        protected var dispatcher:EventDispatcher;
        
        public function DataProvider(source:Array = null)
        {
            super();
            this.dispatcher = new EventDispatcher(this);
            this.parseSource(source);
        }
        
        public function setSource(source:Array) : void
        {
            trace("AS " + this + " :: setSource( " + source + " )");
            this.parseSource(source);
        }
        
        public function testFunc1() : void
        {
            trace(" *** AS testFunc1() called!");
        }
        
        public function testFunc2(param:Object) : void
        {
            trace(" *** AS testFunc2() called!");
        }
        
        public function indexOf(item:Object, callBack:Function = null) : int
        {
            var index:int = super.indexOf(item);
            if(callBack != null)
            {
                callBack(index);
            }
            return index;
        }
        
        public function requestItemAt(index:uint, callBack:Function = null) : Object
        {
            var item:Object = this[index];
            if(callBack != null)
            {
                callBack(item);
            }
            return item;
        }
        
        public function requestItemRange(startPosition:int, endPosition:int, callBack:Function = null) : Array
        {
            var items:Array = this.slice(startPosition,endPosition + 1);
            if(callBack != null)
            {
                callBack(items);
            }
            return items;
        }
        
        public function cleanUp() : void
        {
            this.splice(0,length);
        }
        
        public function invalidate(length:uint = 0) : void
        {
            this.dispatcher.dispatchEvent(new Event(Event.CHANGE));
        }
        
        public function toString() : String
        {
            return "[CLIK DataProvider " + this.join(",") + "]";
        }
        
        protected function parseSource(source:Array) : void
        {
            if(source == null)
            {
                return;
            }
            var l:uint = source.length;
            for(var i:uint = 0; i < l; i++)
            {
                this[i] = source[i];
            }
        }
        
        public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void
        {
            this.dispatcher.addEventListener(type,listener,useCapture,priority,useWeakReference);
        }
        
        public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false) : void
        {
            this.dispatcher.removeEventListener(type,listener,useCapture);
        }
        
        public function dispatchEvent(event:Event) : Boolean
        {
            return this.dispatcher.dispatchEvent(event);
        }
        
        public function hasEventListener(type:String) : Boolean
        {
            return this.dispatcher.hasEventListener(type);
        }
        
        public function willTrigger(type:String) : Boolean
        {
            return this.dispatcher.willTrigger(type);
        }
    }
}
