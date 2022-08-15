package
{
    import tripwire.world.MedicOpticsWorld;
    
    public dynamic class MediGunReticuleContainer extends MedicOpticsWorld
    {
         
        
        public function MediGunReticuleContainer()
        {
            super();
            this.__setProp_chargeMeters_MediGunReticuleContainer_MC_Meters_0();
            this.__setProp_lockReticle_MediGunReticuleContainer_MC_Lock_0();
        }
        
        function __setProp_chargeMeters_MediGunReticuleContainer_MC_Meters_0() : *
        {
            try
            {
                chargeMeters["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            chargeMeters.enabled = true;
            chargeMeters.enableInitCallback = true;
            chargeMeters.visible = true;
            try
            {
                chargeMeters["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_lockReticle_MediGunReticuleContainer_MC_Lock_0() : *
        {
            try
            {
                lockReticle["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            lockReticle.enabled = true;
            lockReticle.enableInitCallback = true;
            lockReticle.visible = true;
            try
            {
                lockReticle["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
