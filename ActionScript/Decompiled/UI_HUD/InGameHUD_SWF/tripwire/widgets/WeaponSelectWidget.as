package tripwire.widgets
{
    import com.greensock.*;
    import com.greensock.easing.*;
    import fl.transitions.easing.*;
    import flash.events.KeyboardEvent;
    import flash.events.TimerEvent;
    import flash.external.ExternalInterface;
    import flash.ui.Keyboard;
    import flash.utils.Timer;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.motion.Tween;
    import tripwire.containers.WeaponSelectGroupContainer;
    
    public class WeaponSelectWidget extends UIComponent
    {
        
        public static const KEYBOARD_STATE:String = "keyboard";
        
        public static const CONTROLLER_STATE:String = "controller";
        
        private static var _currentState:String;
         
        
        public var WeaponCategoryContainer0:WeaponSelectGroupContainer;
        
        public var WeaponCategoryContainer1:WeaponSelectGroupContainer;
        
        public var WeaponCategoryContainer2:WeaponSelectGroupContainer;
        
        public var WeaponCategoryContainer3:WeaponSelectGroupContainer;
        
        public var WeaponCategoryContainerGamePad0:WeaponSelectGroupContainer;
        
        public var WeaponCategoryContainerGamePad1:WeaponSelectGroupContainer;
        
        public var WeaponCategoryContainerGamePad2:WeaponSelectGroupContainer;
        
        public var WeaponCategoryContainerGamePad3:WeaponSelectGroupContainer;
        
        private const MAX_WEAPON_GROUPS = 4;
        
        private const FADE_TIME = 0.8;
        
        private var _bStayOpen:Boolean;
        
        private var _currentGroupIndex:int;
        
        private var _currentSelectedIndex:int;
        
        private var _bFadingOut:Boolean;
        
        private var weaponGroupContainers:Vector.<WeaponSelectGroupContainer>;
        
        private var _weaponSelectFadeTimer:Timer;
        
        public function WeaponSelectWidget()
        {
            super();
            _currentState = KEYBOARD_STATE;
            enableInitCallback = true;
            this.weaponGroupContainers = new Vector.<WeaponSelectGroupContainer>();
            this._weaponSelectFadeTimer = new Timer(this.FADE_TIME * 1000,1);
            this._weaponSelectFadeTimer.addEventListener(TimerEvent.TIMER,this.close,false,0,true);
            this.updateContainerList();
            visible = false;
            this.z = 112;
            this.alpha = 0;
        }
        
        public static function get state() : String
        {
            return _currentState;
        }
        
        private function updateContainerList() : *
        {
            var _loc1_:Array = new Array();
            var _loc2_:Vector.<WeaponSelectGroupContainer> = this.weaponGroupContainers;
            this.weaponGroupContainers = new Vector.<WeaponSelectGroupContainer>();
            var _loc3_:int = 0;
            while(_loc3_ < this.MAX_WEAPON_GROUPS)
            {
                if(_currentState == KEYBOARD_STATE)
                {
                    this.weaponGroupContainers.push(this["WeaponCategoryContainer" + _loc3_]);
                }
                else if(_currentState == CONTROLLER_STATE)
                {
                    this.weaponGroupContainers.push(this["WeaponCategoryContainerGamePad" + _loc3_]);
                }
                if(_loc2_ != null && _loc2_.length > 0)
                {
                    this.weaponGroupContainers[_loc3_].header = _loc2_[_loc3_].header;
                    this.setWeaponList(_loc2_[_loc3_].weaponList,_loc3_);
                }
                else
                {
                    this.setWeaponList(_loc1_,_loc3_);
                }
                _loc3_++;
            }
        }
        
        public function open() : void
        {
            visible = true;
            this.WeaponBlurClear();
            Tween.removeAllTweens();
            this.WeaponBlurIn();
            this._weaponSelectFadeTimer.reset();
            this._weaponSelectFadeTimer.start();
        }
        
        public function close(param1:TimerEvent = null) : *
        {
            if(!this._bStayOpen)
            {
                this._bFadingOut = true;
                this.WeaponBlurClear();
                Tween.removeAllTweens();
                this.WeaponBlurOut();
                this.onFadeOutComplete();
            }
        }
        
        public function set bStayOpen(param1:*) : *
        {
            this._bStayOpen = param1;
            if(!param1)
            {
                this.close();
            }
            else
            {
                this.open();
                this.showAllElementsInGroups();
            }
        }
        
        public function setState(param1:String) : *
        {
            var _loc2_:WeaponSelectGroupContainer = null;
            if(_currentState != param1)
            {
                gotoAndStop(param1);
                _currentState = param1;
                this.updateContainerList();
                for each(_loc2_ in this.weaponGroupContainers)
                {
                    _loc2_.updateContainers();
                }
                this.setSelectedIndex(this._currentGroupIndex,this._currentSelectedIndex);
            }
        }
        
        public function set weaponCategories(param1:Object) : void
        {
            this.WeaponCategoryContainer0.header = param1.Primary;
            this.WeaponCategoryContainer1.header = param1.Backup;
            this.WeaponCategoryContainer2.header = param1.Melee;
            this.WeaponCategoryContainer3.header = param1.Equipment;
        }
        
        public function setWeaponList(param1:Array, param2:int) : void
        {
            this.weaponGroupContainers[param2].weaponList = param1;
        }
        
        public function setSelectedIndex(param1:int, param2:int) : void
        {
            if(this._currentGroupIndex != param1)
            {
                this.weaponGroupContainers[this._currentGroupIndex].unselectGroup();
            }
            if(_currentState == KEYBOARD_STATE)
            {
                this.showFirstItemOfGroups();
                if(!visible)
                {
                    this.open();
                }
                else
                {
                    this._weaponSelectFadeTimer.reset();
                    this._weaponSelectFadeTimer.start();
                    if(this._bFadingOut)
                    {
                        this._bFadingOut = false;
                        this.WeaponBlurClear();
                        Tween.removeAllTweens();
                        this.WeaponBlurIn();
                    }
                }
            }
            this.updateIndex(param1,param2);
        }
        
        public function showFirstItemOfGroups() : *
        {
            var _loc1_:WeaponSelectGroupContainer = null;
            for each(_loc1_ in this.weaponGroupContainers)
            {
                _loc1_.showFirstElement();
            }
        }
        
        public function showAllElementsInGroups() : *
        {
            var _loc1_:WeaponSelectGroupContainer = null;
            for each(_loc1_ in this.weaponGroupContainers)
            {
                _loc1_.showAllElements();
            }
        }
        
        public function updateIndex(param1:int, param2:int) : *
        {
            this._currentGroupIndex = param1;
            this._currentSelectedIndex = param2;
            this.weaponGroupContainers[param1].selectedIndex = param2;
        }
        
        public function showOnlyHUDGroup(param1:int) : void
        {
            var _loc2_:int = 0;
            while(_loc2_ < this.weaponGroupContainers.length)
            {
                if(_currentState == KEYBOARD_STATE)
                {
                    if(param1 == _loc2_)
                    {
                        this.weaponGroupContainers[_loc2_].visible = true;
                    }
                    else
                    {
                        this.weaponGroupContainers[_loc2_].visible = false;
                    }
                }
                else
                {
                    if(!this.weaponGroupContainers[_loc2_].visible)
                    {
                        this.weaponGroupContainers[_loc2_].visible = true;
                    }
                    if(param1 == _loc2_)
                    {
                        this.weaponGroupContainers[_loc2_].showAllElements();
                    }
                    else
                    {
                        this.weaponGroupContainers[_loc2_].showFirstElement();
                    }
                }
                _loc2_++;
            }
        }
        
        public function showAllHUDGroups() : void
        {
            var _loc1_:int = 0;
            while(_loc1_ < this.weaponGroupContainers.length)
            {
                if(_currentState == KEYBOARD_STATE)
                {
                    if(!this.weaponGroupContainers[_loc1_].visible)
                    {
                        this.weaponGroupContainers[_loc1_].visible = true;
                    }
                }
                _loc1_++;
            }
        }
        
        private function onFadeOutComplete() : void
        {
            ExternalInterface.call("Callback_WeaponSelectFadedOut");
        }
        
        private function WeaponBlurIn() : void
        {
            TweenMax.to(this,4,{
                "alpha":0.88,
                "z":0,
                "useFrames":true,
                "ease":Cubic.easeOut
            });
        }
        
        private function WeaponFadeInFilters(param1:Tween) : void
        {
        }
        
        private function WeaponBlurOut() : void
        {
            TweenMax.to(this,4,{
                "alpha":0,
                "z":112,
                "useFrames":true,
                "ease":Cubic.easeIn
            });
        }
        
        private function WeaponFadeOutFilters(param1:Tween) : void
        {
        }
        
        private function WeaponFadeClear(param1:Tween) : void
        {
            filters = null;
        }
        
        private function WeaponBlurClear() : void
        {
        }
        
        private function testWeaponSelect() : void
        {
            var _loc1_:Array = null;
            var _loc2_:Array = null;
            var _loc3_:Array = null;
            var _loc4_:Array = null;
            var _loc5_:Object;
            (_loc5_ = new Object()).weaponName = "weapon0";
            _loc5_.texturePath = "";
            _loc5_.ammoCount = 1;
            _loc5_.spareAmmoCount = 20;
            _loc5_.bUsesAmmo = true;
            var _loc6_:Object;
            (_loc6_ = new Object()).weaponName = "ITEM 1";
            _loc6_.texturePath = "";
            _loc6_.ammoCount = 1;
            _loc6_.spareAmmoCount = 20;
            _loc6_.bUsesAmmo = true;
            var _loc7_:Object;
            (_loc7_ = new Object()).weaponName = "ITEM 4";
            _loc7_.texturePath = "";
            _loc7_.ammoCount = 1;
            _loc7_.spareAmmoCount = 20;
            _loc7_.bUsesAmmo = true;
            _loc1_ = new Array(_loc5_,_loc6_,_loc7_,_loc5_,_loc6_,_loc7_);
            _loc2_ = new Array(_loc5_,_loc6_,_loc7_,_loc5_,_loc6_,_loc7_);
            _loc3_ = new Array(_loc5_,_loc6_,_loc7_,_loc5_,_loc6_,_loc7_);
            _loc4_ = new Array(_loc5_,_loc6_,_loc7_,_loc5_,_loc6_,_loc7_);
            _enableInitCallback = true;
            this.setWeaponList(_loc1_,0);
            this.setWeaponList(_loc2_,1);
            this.setWeaponList(_loc3_,2);
            this.setWeaponList(_loc4_,3);
            this.setSelectedIndex(3,0);
            visible = true;
            stage.addEventListener(KeyboardEvent.KEY_DOWN,this.OnTestKey,false,0,true);
        }
        
        private function OnTestKey(param1:KeyboardEvent) : *
        {
            if(param1.keyCode == Keyboard.C)
            {
                this.setState(CONTROLLER_STATE);
            }
            else if(param1.keyCode == Keyboard.K)
            {
                this.setState(KEYBOARD_STATE);
            }
        }
    }
}
