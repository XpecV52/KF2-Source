package tripwire.controls
{
    import flash.display.DisplayObject;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.ui.InputDetails;
    import tripwire.controls.postGameMenu.PlayerStatLineRenderer;
    import tripwire.controls.postGameMenu.TopWeaponDataContainer;
    
    public class TripScrollArea extends UIComponent
    {
         
        
        public var itemMask:MovieClip;
        
        public var scrollObject:ScrollObjectContainer;
        
        public var scrollBar:TripScrollBar;
        
        public var stepSize:Number = 1;
        
        public const TYPE_AWARD:String = "AWARD";
        
        public const TYPE_WEAPON:String = "TopWeapon";
        
        public const TYPE_STAT:String = "STAT";
        
        public const TYPE_ZED_KILL:String = "ZED_KILL";
        
        public function TripScrollArea()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.scrollBar.scrollTarget = this.scrollObject;
            this.updateScrollSize();
        }
        
        override public function set enabled(param1:Boolean) : void
        {
            super.enabled = param1;
            if(param1)
            {
                stage.addEventListener(MouseEvent.MOUSE_WHEEL,this.handleMouseWheel,false,0,true);
                stage.addEventListener(InputEvent.INPUT,this.handleInput,false,0,true);
            }
            else
            {
                stage.addEventListener(MouseEvent.MOUSE_WHEEL,this.handleMouseWheel);
                stage.addEventListener(InputEvent.INPUT,this.handleInput);
            }
        }
        
        override protected function configUI() : void
        {
            super.configUI();
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            if(param1.handled)
            {
                return;
            }
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_UP)
            {
                return;
            }
            switch(_loc2_.navEquivalent)
            {
                case NavigationCode.UP:
                    this.scrollList(-1);
                    break;
                case NavigationCode.DOWN:
                    this.scrollList(1);
                    break;
                case NavigationCode.HOME:
                    this.scrollBar.position = 0;
                    break;
                case NavigationCode.END:
                    this.scrollBar.position = this.scrollObject.height;
                    break;
                case NavigationCode.PAGE_DOWN:
                    this.scrollBar.position += this.itemMask.height;
                    break;
                case NavigationCode.PAGE_UP:
                    this.scrollBar.position -= this.itemMask.height;
                    break;
                default:
                    return;
            }
            param1.handled = true;
        }
        
        protected function handleMouseWheel(param1:MouseEvent) : void
        {
            this.scrollList(param1.delta > 0 ? -1 : 1);
        }
        
        protected function scrollList(param1:int) : void
        {
            this.scrollBar.position += param1 * this.stepSize;
        }
        
        public function set Data(param1:Object) : void
        {
            var _loc2_:DisplayObject = null;
            var _loc3_:Object = null;
            if(param1 != null)
            {
                for each(_loc3_ in param1)
                {
                    _loc2_ = this.createDisplayObjectByType(_loc3_);
                    if(_loc2_ != null)
                    {
                        this.scrollObject.addDisplayObject(_loc2_);
                    }
                }
                this.updateScrollSize();
            }
        }
        
        public function createDisplayObjectByType(param1:Object) : DisplayObject
        {
            var _loc2_:DisplayObject = null;
            var _loc3_:Award = null;
            var _loc4_:TopWeaponDataContainer = null;
            var _loc5_:PlayerStatLineRenderer = null;
            var _loc6_:PlayerStatLineRenderer = null;
            if(param1.typeString && param1.typeString != "")
            {
                switch(param1.typeString)
                {
                    case this.TYPE_AWARD:
                        _loc3_ = new Award();
                        _loc2_ = _loc3_ as DisplayObject;
                        break;
                    case this.TYPE_WEAPON:
                        (_loc4_ = new TopWeapon()).data = param1;
                        _loc2_ = _loc4_ as DisplayObject;
                        break;
                    case this.TYPE_STAT:
                        (_loc5_ = new PlayerStat()).data = param1;
                        _loc2_ = _loc5_ as DisplayObject;
                        break;
                    case this.TYPE_ZED_KILL:
                        (_loc6_ = new ZedKillLineItem()).data = param1;
                        _loc2_ = _loc6_ as DisplayObject;
                }
            }
            return _loc2_;
        }
        
        public function addDisplayObject(param1:DisplayObject) : void
        {
            this.scrollObject.addDisplayObject(param1);
            this.updateScrollSize();
        }
        
        public function updateScrollSize() : void
        {
            this.scrollBar.setScrollProperties(this.itemMask.height,0,this.scrollObject.height - this.itemMask.height);
            this.scrollBar.invalidate();
        }
    }
}
