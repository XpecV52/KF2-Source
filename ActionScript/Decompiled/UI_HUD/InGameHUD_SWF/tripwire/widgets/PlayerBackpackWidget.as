package tripwire.widgets
{
    import fl.motion.Color;
    import fl.transitions.TweenEvent;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.filters.BlurFilter;
    import flash.filters.GlowFilter;
    import flash.geom.ColorTransform;
    import flash.text.TextField;
    import flash.text.TextLineMetrics;
    import scaleform.clik.controls.UILoader;
    import scaleform.clik.core.UIComponent;
    
    public class PlayerBackpackWidget extends UIComponent
    {
         
        
        private var _barkDosh:int;
        
        private var _doshTotal:int;
        
        public var AmmoContainer:MovieClip;
        
        public var DoshContainer:MovieClip;
        
        public var FlashlightContainer:MovieClip;
        
        public var GrenadeContainer:MovieClip;
        
        public var secondaryAmmoContainer:MovieClip;
        
        public var firemodeLoader:UILoader;
        
        private var _storedAmmoTF:TextField = null;
        
        private var _magazineAmmoTF:TextField = null;
        
        private var _grenadesTF:TextField = null;
        
        private var _doshTF:TextField = null;
        
        private var _flashlightBatteryMC:MovieClip = null;
        
        private var _flashlightIconMC:MovieClip = null;
        
        private var _ammoContainerMC:MovieClip = null;
        
        private var _doshGaugeMC:MovieClip = null;
        
        private var _doshBarkMC:MovieClip = null;
        
        private var _doshBarkInfoMC:MovieClip = null;
        
        private var _secondaryAmmoTF:TextField = null;
        
        private var _secondaryLoader:UILoader = null;
        
        private var _grenadeIconLoader:UILoader = null;
        
        private var whiteColor:uint = 16503487;
        
        private var greenColor:uint = 4836490;
        
        private var redColor:uint = 16745317;
        
        private var doshBarkColor:uint;
        
        private var _whiteglowFilter01:GlowFilter;
        
        private var _whiteglowFilter02:GlowFilter;
        
        private var _whiteglowFilter03:GlowFilter;
        
        private var _doshbarkGlowFilter01:GlowFilter;
        
        private var _doshbarkGlowFilter02:GlowFilter;
        
        private var _doshbarkGlowFilter03:GlowFilter;
        
        private var _doshGlowFilter01:GlowFilter;
        
        private var _doshGlowFilter02:GlowFilter;
        
        private var _doshGlowFilter03:GlowFilter;
        
        private var _blurFilter:BlurFilter;
        
        public function PlayerBackpackWidget()
        {
            this._blurFilter = new BlurFilter(3,3,3);
            super();
            _enableInitCallback = true;
            this.cacheBackpackWidgets();
            this.initFilters();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.bUsesAmmo = false;
            this.bUsesSecondaryAmmo = false;
        }
        
        private function initFilters() : void
        {
            this._whiteglowFilter01 = new GlowFilter(this.whiteColor,1,5,5,0.75,1,false,false);
            this._whiteglowFilter02 = new GlowFilter(this.whiteColor,1,0,20,0.35,1,false,false);
            this._whiteglowFilter03 = new GlowFilter(this.whiteColor,1,0,35,0.15,1,false,false);
            this.applyFilters();
        }
        
        private function applyFilters() : void
        {
        }
        
        private function AddSomeDosh(param1:MouseEvent) : *
        {
            this.backpackDosh = Math.floor(Math.random() * (100 - -100 + 1)) + -100;
        }
        
        private function cacheBackpackWidgets() : *
        {
            this._secondaryAmmoTF = this.secondaryAmmoContainer.ammoTextField;
            this._secondaryLoader = this.secondaryAmmoContainer.secondaryLoader;
            this._ammoContainerMC = this.AmmoContainer;
            this._storedAmmoTF = this.AmmoContainer.AmmoInfo.StoredAmmoTextField;
            this._magazineAmmoTF = this.AmmoContainer.AmmoInfo.CurrentAmmoTextField;
            this._grenadesTF = this.GrenadeContainer.GrenadeInfo.GrenadeTextField;
            this._grenadeIconLoader = this.GrenadeContainer.GrenadeInfo.GrenadeIcon;
            this._doshTF = this.DoshContainer.DoshGaugeInfo.DoshGaugeMC.DoshTextField;
            this._flashlightBatteryMC = this.FlashlightContainer.FlashlightBarContainer;
            this._flashlightIconMC = this.FlashlightContainer.FlashlightIcon;
            this._doshGaugeMC = this.DoshContainer.DoshGaugeInfo;
            this._doshBarkMC = this.DoshContainer.DoshBarkAnimContainer;
            this._doshBarkInfoMC = this.DoshContainer.DoshBarkAnimContainer.DoshBarkInfo;
            this._doshBarkMC.visible = false;
            this.DoshContainer.DoshBarkAnimContainer.addEventListener("OnDoshBarkComplete",this.OnDoshBarkComplete);
        }
        
        function OnDoshBarkComplete(param1:Event) : void
        {
            var _DoshColor:Color = null;
            var e:Event = param1;
            var UpdateDoshTint:Function = function(param1:TweenEvent):void
            {
                _DoshColor.setTint(doshBarkColor,param1.position);
                _doshGaugeMC.transform.colorTransform = _DoshColor;
            };
            _DoshColor = new Color();
            this.DoshContainer.DoshGaugeInfo.gotoAndPlay("CashWoofedAnim");
            this._doshTotal += this._barkDosh;
            this._barkDosh = 0;
            this._doshBarkInfoMC.DoshTextField.text = "";
            this._doshBarkMC.visible = false;
            this._doshTF.text = this._doshTotal.toString();
            var _DoshNumMetrics:TextLineMetrics = this._doshTF.getLineMetrics(0);
            var _DoshNumStartX:Number = _DoshNumMetrics.x;
            var _DoshNumWidth:Number = _DoshNumMetrics.width;
        }
        
        public function set bUsesAmmo(param1:Boolean) : void
        {
            if(param1)
            {
                this._storedAmmoTF.visible = true;
                this._magazineAmmoTF.visible = true;
                this.AmmoContainer.AmmoInfo.AmmoGaugeConnector.visible = true;
                this.AmmoContainer.AmmoInfo.AmmoMelee.visible = false;
            }
            else
            {
                this._storedAmmoTF.visible = false;
                this._magazineAmmoTF.visible = false;
                this.AmmoContainer.AmmoInfo.AmmoGaugeConnector.visible = false;
                this.AmmoContainer.AmmoInfo.AmmoMelee.visible = true;
            }
        }
        
        public function set secondaryAmmo(param1:int) : void
        {
            this._secondaryAmmoTF.text = param1.toString();
        }
        
        public function set secondaryIcon(param1:String) : void
        {
            this._secondaryLoader.source = param1;
        }
        
        public function set bUsesSecondaryAmmo(param1:Boolean) : void
        {
            this.secondaryAmmoContainer.visible = param1;
        }
        
        public function set backpackStoredAmmo(param1:int) : void
        {
            this._storedAmmoTF.text = param1.toString();
        }
        
        public function set weaponMagazineAmmo(param1:int) : void
        {
            this._magazineAmmoTF.text = param1.toString();
        }
        
        public function set backpackDosh(param1:int) : void
        {
            var backpackDosh:int = param1;
            var UpdateBarkFilters:Function = function(param1:TweenEvent):void
            {
                var _loc2_:BlurFilter = new BlurFilter(param1.position,0,1);
                _doshBarkMC.filters = [_whiteglowFilter01,_whiteglowFilter02,_whiteglowFilter03,_loc2_];
            };
            var _doshPrefix:String = backpackDosh > 0 ? "+" : "-";
            this._barkDosh += backpackDosh;
            this._doshBarkInfoMC.DoshPrefix.text = _doshPrefix;
            this._doshBarkInfoMC.DoshTextField.text = Math.abs(this._barkDosh).toString();
            this._doshBarkMC.visible = true;
            var _DoshNumMetrics:TextLineMetrics = this._doshBarkInfoMC.DoshTextField.getLineMetrics(0);
            var _DoshNumStartX:Number = _DoshNumMetrics.x;
            var _DoshNumWidth:Number = _DoshNumMetrics.width;
            this._doshBarkInfoMC.DoshBarkIcon.x = _DoshNumStartX - 32;
            this._doshBarkInfoMC.DoshPrefix.x = _DoshNumStartX - 56;
            this.DoshContainer.DoshBarkAnimContainer.gotoAndPlay("Woof");
            this.doshBarkColor = backpackDosh >= 0 ? uint(this.greenColor) : uint(this.redColor);
            var _DoshBarkColor:ColorTransform = new ColorTransform();
            _DoshBarkColor.color = this.doshBarkColor;
            this._doshBarkMC.transform.colorTransform = _DoshBarkColor;
        }
        
        public function set backpackGrenades(param1:int) : void
        {
            this._grenadesTF.text = param1.toString();
        }
        
        public function set backpackGrenadeType(param1:String) : void
        {
            if(this._grenadeIconLoader.source != param1)
            {
                this._grenadeIconLoader.source = param1;
            }
        }
        
        public function set firemodeIcon(param1:String) : void
        {
            if(param1 != "")
            {
                this.firemodeLoader.source = param1;
            }
        }
        
        public function setFlashlightBattery(param1:int, param2:Boolean) : void
        {
            this._flashlightBatteryMC.gotoAndStop(param1);
            if(param2)
            {
                this._flashlightIconMC.gotoAndStop("on");
            }
            else
            {
                this._flashlightIconMC.gotoAndStop("off");
            }
        }
    }
}
