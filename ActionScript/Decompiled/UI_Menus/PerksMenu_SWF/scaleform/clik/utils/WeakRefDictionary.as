package scaleform.clik.utils
{
    import flash.utils.Dictionary;
    
    public class WeakRefDictionary
    {
         
        
        protected var _dictionary:Dictionary;
        
        public function WeakRefDictionary()
        {
            super();
            this._dictionary = new Dictionary(true);
        }
        
        public function setValue(key:Object, value:Object) : void
        {
            var k:* = null;
            for(k in this._dictionary)
            {
                if(key == this._dictionary[k])
                {
                    this._dictionary[k] = null;
                }
            }
            this._dictionary[value] = key;
        }
        
        public function getValue(key:Object) : Object
        {
            var k:* = null;
            for(k in this._dictionary)
            {
                if(key == this._dictionary[k])
                {
                    return k;
                }
            }
            return null;
        }
    }
}
