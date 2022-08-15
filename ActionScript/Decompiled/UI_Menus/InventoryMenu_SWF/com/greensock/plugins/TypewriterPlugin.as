package com.greensock.plugins
{
    import com.greensock.TweenLite;
    import flash.text.TextField;
    
    public class TypewriterPlugin extends TweenPlugin
    {
        
        public static const API:Number = 2;
         
        
        protected var _target:Object;
        
        protected var newText:String;
        
        protected var newLength:int;
        
        protected var oldText:String;
        
        protected var oldLength:int;
        
        public function TypewriterPlugin()
        {
            super("typewriter");
        }
        
        override public function _onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
        {
            this._target = param1;
            if(!(this._target is TextField))
            {
                return false;
            }
            this.oldText = this._target.text;
            this.oldLength = this.oldText.length;
            this.newText = String(param2);
            this.newLength = this.newText.length;
            return true;
        }
        
        override public function setRatio(param1:Number) : void
        {
            super.setRatio(param1);
            var _loc2_:Number = this.oldLength + -this.oldLength * param1;
            var _loc3_:Number = this.oldLength + (this.newLength - this.oldLength) * param1;
            this._target.text = this.newText.substr(0,int(_loc3_ - _loc2_ + 0.5)) + this.oldText.substr(0,int(_loc2_ + 0.5));
        }
    }
}
