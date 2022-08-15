package tripwire.world
{
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.events.Event;
    import scaleform.clik.core.UIComponent;
    
    public class MedicOpticsWorld extends UIComponent
    {
         
        
        public var chargeMeters;
        
        public var lockReticle:MovieClip;
        
        public var ammoContainer:MovieClip;
        
        public var minimumLeftMeterMC:MovieClip;
        
        public var minimumRightMeterMC:MovieClip;
        
        public var leftChargeBar:MovieClip;
        
        public var rightChargeBar:MovieClip;
        
        private const barHeight:Number = 672.25;
        
        private var barY:Number;
        
        private var currentState:int = 0;
        
        private const NO_LOCK:int = 0;
        
        private const LOCKING_ON:int = 1;
        
        private const LOCKED:int = 2;
        
        private const READY_TO_FIRE_COLOR:uint = 821965;
        
        private const CHARGING_COLOR:uint = 13377311;
        
        private var _costPerShot:Number;
        
        private var _bIsReadyToFire;
        
        public function MedicOpticsWorld()
        {
            super();
            _enableInitCallback = true;
            this.leftChargeBar = this.chargeMeters.leftChargeBar;
            this.rightChargeBar = this.chargeMeters.rightChargeBar;
            this.minimumLeftMeterMC = this.chargeMeters.minimumLeftMeterMC;
            this.minimumRightMeterMC = this.chargeMeters.minimumRightMeterMC;
            this.barY = this.chargeMeters.leftChargeBar.y;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.costPercentPerShot = 30;
            this.chargeMeter = 100;
        }
        
        public function set reloadString(param1:String) : void
        {
            this.ammoContainer.reloadTextField.text = param1;
        }
        
        public function set costPercentPerShot(param1:Number) : void
        {
            this._costPerShot = param1;
            this.minimumLeftMeterMC.y = this.barHeight * ((100 - param1) / 100);
            this.minimumRightMeterMC.y = this.barHeight * ((100 - param1) / 100);
        }
        
        public function set chargeMeter(param1:int) : void
        {
            this.leftChargeBar.height = this.barHeight * param1 / 100;
            this.rightChargeBar.height = this.barHeight * param1 / 100;
            this.setBarColors(param1 >= this._costPerShot);
        }
        
        private function setBarColors(param1:Boolean) : void
        {
            var _loc2_:Color = null;
            if(param1 != this._bIsReadyToFire)
            {
                _loc2_ = new Color();
                if(param1)
                {
                    _loc2_.setTint(this.READY_TO_FIRE_COLOR,1);
                }
                else
                {
                    _loc2_.setTint(this.CHARGING_COLOR,1);
                }
                this.leftChargeBar.transform.colorTransform = _loc2_;
                this.rightChargeBar.transform.colorTransform = _loc2_;
                this._bIsReadyToFire = param1;
            }
        }
        
        public function clearLock() : *
        {
            if(this.currentState != this.NO_LOCK)
            {
                this.lockReticle.gotoAndPlay("NoLock");
                this.currentState = this.NO_LOCK;
            }
        }
        
        public function startLockOn() : *
        {
            if(this.currentState != this.LOCKING_ON)
            {
                this.lockReticle.gotoAndPlay("Locking");
                this.currentState = this.LOCKING_ON;
            }
        }
        
        public function lockedOn() : *
        {
            if(this.currentState != this.LOCKED)
            {
                this.lockReticle.gotoAndPlay("Locked");
                this.currentState = this.LOCKED;
            }
        }
        
        public function set ammoValue(param1:int) : void
        {
            if(param1 <= 0)
            {
                this.ammoContainer.reloadTextField.visible = true;
                this.ammoContainer.textField.visible = false;
                this.ammoContainer.bulletIcon.visible = false;
            }
            else
            {
                this.ammoContainer.reloadTextField.visible = false;
                this.ammoContainer.textField.visible = true;
                this.ammoContainer.bulletIcon.visible = true;
            }
            this.ammoContainer.textField.text = param1;
        }
    }
}
