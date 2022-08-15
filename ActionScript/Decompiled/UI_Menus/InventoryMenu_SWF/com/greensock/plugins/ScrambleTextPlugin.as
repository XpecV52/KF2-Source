package com.greensock.plugins
{
    import com.greensock.TweenLite;
    
    public class ScrambleTextPlugin extends TweenPlugin
    {
        
        public static const API:Number = 2;
        
        private static var _upper:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        
        private static var _lower:String = _upper.toLowerCase();
        
        private static var _charsLookup:Object;
         
        
        private var _tween:TweenLite;
        
        private var _target:Object;
        
        private var _delimiter:String;
        
        private var _original:Array;
        
        private var _text:Array;
        
        private var _length:Number;
        
        private var _lengthDif:int;
        
        private var _charSet:CharSet;
        
        private var _speed:Number;
        
        private var _prevScrambleTime:Number;
        
        private var _setIndex:int;
        
        private var _chars:String;
        
        private var _revealDelay:Number;
        
        private var _tweenLength:Boolean;
        
        public function ScrambleTextPlugin()
        {
            var _loc1_:* = null;
            super("scrambleText");
            if(_charsLookup == null)
            {
                _charsLookup = {
                    "upperCase":new CharSet(_upper),
                    "lowerCase":new CharSet(_lower),
                    "upperAndLowerCase":new CharSet(_upper + _lower)
                };
                for(_loc1_ in _charsLookup)
                {
                    _charsLookup[_loc1_.toLowerCase()] = _charsLookup[_loc1_];
                    _charsLookup[_loc1_.toUpperCase()] = _charsLookup[_loc1_];
                }
            }
        }
        
        override public function _onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
        {
            var _loc5_:String = null;
            var _loc6_:int = 0;
            var _loc7_:int = 0;
            var _loc8_:CharSet = null;
            if(param1.text == null)
            {
                trace("scrambleText only works on objects with a \'text\' property.");
                return false;
            }
            this._target = param1;
            if(typeof param2 !== "object")
            {
                param2 = {"text":param2};
            }
            var _loc4_:String = param2.scramble;
            this._original = param1.text.split(this._delimiter = param2.delimiter || "");
            this._text = String(param2.text || param2.value || "").split(_loc5_);
            _loc6_ = this._text.length - this._original.length;
            this._length = this._original.join(_loc5_).length;
            this._lengthDif = this._text.join(_loc5_).length - this._length;
            this._charSet = _loc8_ = _charsLookup[param2.chars || "upperCase"] || new CharSet(param2.chars);
            this._speed = 0.016 / (param2.speed || 1);
            this._prevScrambleTime = 0;
            this._setIndex = Math.random() * 20 | 0;
            if((_loc7_ = this._length + Math.max(this._lengthDif,0)) > _loc8_.length)
            {
                _loc8_.grow(_loc7_);
            }
            this._chars = _loc8_.sets[this._setIndex];
            this._revealDelay = Number(param2.revealDelay) || Number(0);
            this._tweenLength = param2.tweenLength !== false;
            this._tween = param3;
            return true;
        }
        
        override public function setRatio(param1:Number) : void
        {
            var _loc6_:* = 0;
            var _loc7_:String = null;
            var _loc8_:String = null;
            var _loc2_:int = this._text.length;
            var _loc3_:String = this._delimiter;
            var _loc4_:Number;
            var _loc5_:Number = (_loc4_ = this._tween._time) - this._prevScrambleTime;
            if(this._revealDelay !== 0)
            {
                if(this._tween.vars.runBackwards)
                {
                    _loc4_ = this._tween._duration - _loc4_;
                }
                param1 = _loc4_ === 0 ? Number(0) : (_loc4_ < this._revealDelay ? Number(0.000001) : (_loc4_ === this._tween._duration ? Number(1) : Number(this._tween._ease.getRatio((_loc4_ - this._revealDelay) / (this._tween._duration - this._revealDelay)))));
            }
            if(param1 < 0)
            {
                param1 = 0;
            }
            else if(param1 > 1)
            {
                param1 = 1;
            }
            _loc6_ = param1 * _loc2_ + 0.5 | 0;
            _loc7_ = this._text.slice(0,_loc6_).join(_loc3_);
            _loc8_ = this._original.slice(_loc6_).join(_loc3_);
            if(param1)
            {
                if(_loc5_ > this._speed || _loc5_ < -this._speed)
                {
                    this._setIndex = (this._setIndex + (Math.random() * 19 | 0)) % 20;
                    this._chars = this._charSet.sets[this._setIndex];
                    this._prevScrambleTime += _loc5_;
                }
                _loc8_ = this._chars.substr(_loc7_.length,this._length + (!!this._tweenLength ? 1 - (param1 = 1 - param1) * param1 * param1 * param1 : 1) * this._lengthDif - _loc7_.length + 0.5 | 0);
            }
            this._target.text = _loc7_ + _loc3_ + _loc8_;
        }
    }
}

class CharSet
{
     
    
    public var chars:Array;
    
    public var sets:Array;
    
    public var length:int;
    
    function CharSet(param1:String)
    {
        var _loc2_:int = 0;
        super();
        this.chars = param1.split("");
        this.sets = [];
        this.length = 50;
        _loc2_ = 0;
        while(_loc2_ < 20)
        {
            this.sets[_loc2_] = _scrambleText(80,this.chars);
            _loc2_++;
        }
    }
    
    private static function _scrambleText(param1:Number, param2:Array) : String
    {
        var _loc3_:int = param2.length;
        var _loc4_:String = "";
        while(--param1 > -1)
        {
            _loc4_ += param2[Math.random() * _loc3_ | 0];
        }
        return _loc4_;
    }
    
    public function grow(param1:int) : void
    {
        var _loc2_:int = 0;
        _loc2_ = 0;
        while(_loc2_ < 20)
        {
            this.sets[_loc2_] += _scrambleText(param1 - this.length,this.chars);
            _loc2_++;
        }
        this.length = param1;
    }
}
