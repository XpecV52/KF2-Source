package tripwire.containers
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import com.greensock.easing.Linear;
    import com.greensock.events.TweenEvent;
    import flash.events.Event;
    import flash.events.FocusEvent;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.managers.FocusHandler;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.Extensions;
    import scaleform.gfx.FocusManager;
    import tripwire.managers.MenuManager;
    
    public class TripContainer extends UIComponent
    {
        
        public static const CANCELLED_INDEX:int = -1;
         
        
        public var currentElement:UIComponent;
        
        public var defaultFirstElement:UIComponent;
        
        protected var _bOpen:Boolean = false;
        
        protected var _bReadyForInput:Boolean = false;
        
        protected var _defaultAlpha:Number;
        
        protected const ANIM_TIME = 6;
        
        protected const AnimBLUR_OUT = 0;
        
        protected const ANIM_START_Z = 0;
        
        protected const ANIM_OFFSET_Z = 48;
        
        protected const ANIM_BLUR_X = 24;
        
        protected const ANIM_BLUR_Y = 16;
        
        protected const ANIM_ALPHA = 0;
        
        protected const SUBCONTAINER_ANIM_START_Z = 0;
        
        protected const SUBCONATINER_ANIM_OFFSET_Z = -128;
        
        protected const SUBCONTAINER_ANIM_BLUR_X = 12;
        
        protected const SUBCONTAINER_ANIM_BLUR_Y = 12;
        
        public var ANIM_START_X:Number;
        
        public var ANIM_OFFSET_X:Number = -24;
        
        public var bSelected:Boolean = false;
        
        public function TripContainer()
        {
            super();
            Extensions.enabled = true;
            Extensions.noInvisibleAdvance = true;
            enableInitCallback = true;
            focused = 0;
            this._defaultAlpha = alpha;
        }
        
        public function get bManagerUsingGamepad() : Boolean
        {
            if(MenuManager.manager != null)
            {
                return MenuManager.manager.bUsingGamepad;
            }
            return false;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.ANIM_START_X = x;
            if(this.bSelected)
            {
                stage.addEventListener(MenuManager.INPUT_CHANGED,this.onInputChange,false,0,true);
                stage.addEventListener(InputEvent.INPUT,this.handleInput,false,0,true);
            }
        }
        
        public function get bOpen() : Boolean
        {
            return this._bOpen;
        }
        
        public function openContainer() : void
        {
            if(!this._bOpen)
            {
                if(this.currentElement == null && this.bManagerUsingGamepad && this.defaultFirstElement)
                {
                    this.currentElement = this.defaultFirstElement;
                }
                if(stage)
                {
                    stage.addEventListener(MenuManager.INPUT_CHANGED,this.onInputChange,false,0,true);
                }
                this.selectContainer();
                if(isNaN(this.ANIM_START_X))
                {
                    this.alpha = 0;
                    TweenMax.to(this,1,{
                        "useFrames":true,
                        "onComplete":this.openAnimation
                    });
                }
                else
                {
                    this.alpha = 0;
                    this.openAnimation();
                }
                this._bOpen = true;
            }
        }
        
        public function selectContainer() : void
        {
            visible = true;
            tabEnabled = true;
            tabChildren = true;
            this.bSelected = true;
            addEventListener(FocusEvent.FOCUS_IN,this.onFocusIn,false,0,true);
            if(stage)
            {
                stage.addEventListener(InputEvent.INPUT,this.handleInput,false,0,true);
            }
            if(this.bManagerUsingGamepad && this.currentElement)
            {
                this.currentElement.tabEnabled = true;
                this.currentElement.tabChildren = true;
                FocusHandler.getInstance().setFocus(this.currentElement);
            }
        }
        
        public function closeContainer() : void
        {
            if(this._bOpen)
            {
                this._bOpen = false;
                this.deselectContainer();
                this.closeAnimation();
                stage.removeEventListener(MenuManager.INPUT_CHANGED,this.onInputChange);
                mouseChildren = mouseEnabled = false;
                if(this.currentElement)
                {
                    this.currentElement = null;
                }
            }
        }
        
        public function deselectContainer() : void
        {
            tabEnabled = false;
            tabChildren = false;
            this.bSelected = false;
            removeEventListener(FocusEvent.FOCUS_IN,this.onFocusIn);
            if(stage)
            {
                stage.removeEventListener(InputEvent.INPUT,this.handleInput);
            }
            if(this.currentElement)
            {
                this.currentElement.focused = 0;
            }
        }
        
        public function focusGroupIn() : void
        {
            var _loc1_:* = visible;
            this.selectContainer();
            visible = _loc1_;
        }
        
        public function focusGroupOut() : void
        {
            this.deselectContainer();
        }
        
        public function pushToBackground() : void
        {
            if(this._bOpen)
            {
                this.deselectContainer();
                this.pushToBackAnimation();
                this._bOpen = false;
            }
        }
        
        function onFocusIn(param1:FocusEvent) : *
        {
            if(this.bManagerUsingGamepad)
            {
                this.currentElement = param1.target as UIComponent;
            }
        }
        
        protected function onInputChange(param1:Event) : *
        {
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            if(param1.handled)
            {
                return;
            }
            if(!this._bReadyForInput)
            {
                return;
            }
            super.handleInput(param1);
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_B:
                        if(_loc2_.code == 97)
                        {
                            this.onBPressed(_loc2_);
                        }
                }
            }
        }
        
        protected function onBPressed(param1:InputDetails) : void
        {
        }
        
        protected function openAnimation() : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,this.ANIM_TIME,{
                "z":this.ANIM_OFFSET_Z,
                "alpha":0,
                "blurFilter":{
                    "blurX":this.ANIM_BLUR_X,
                    "blurY":this.ANIM_BLUR_Y,
                    "quality":1
                },
                "ease":Linear.easeNone,
                "useFrames":true
            },{
                "z":this.ANIM_START_Z,
                "alpha":this._defaultAlpha,
                "blurFilter":{
                    "blurX":this.AnimBLUR_OUT,
                    "blurY":this.AnimBLUR_OUT,
                    "quality":1,
                    "remove":true
                },
                "ease":Linear.easeNone,
                "delay":this.ANIM_TIME,
                "useFrames":true,
                "onComplete":this.onOpened
            });
        }
        
        protected function closeAnimation() : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,this.ANIM_TIME,{
                "z":this.ANIM_START_Z,
                "alpha":this._defaultAlpha,
                "ease":Linear.easeNone,
                "useFrames":true
            },{
                "z":this.ANIM_OFFSET_Z,
                "alpha":0,
                "blurFilter":{
                    "blurX":this.ANIM_BLUR_X,
                    "blurY":this.ANIM_BLUR_Y,
                    "quality":1
                },
                "ease":Linear.easeNone,
                "useFrames":true,
                "onComplete":this.onClosed
            });
            FocusManager.setFocus(null);
        }
        
        protected function pushToBackAnimation() : *
        {
            TweenMax.fromTo(this,this.ANIM_TIME,{
                "z":this.ANIM_START_Z,
                "alpha":this._defaultAlpha,
                "ease":Cubic.easeOut,
                "useFrames":true
            },{
                "z":this.ANIM_OFFSET_Z,
                "alpha":0.64 * this.ANIM_ALPHA,
                "blurFilter":{
                    "blurX":this.ANIM_BLUR_X,
                    "blurY":this.ANIM_BLUR_Y,
                    "quality":1
                },
                "ease":Cubic.easeOut,
                "useFrames":true
            });
        }
        
        protected function onOpened(param1:TweenEvent = null) : void
        {
            mouseChildren = mouseEnabled = true;
            this._bReadyForInput = true;
            play();
        }
        
        protected function onClosed(param1:TweenEvent = null) : void
        {
            this._bReadyForInput = false;
            visible = false;
            this._bOpen = false;
            stop();
        }
    }
}
