package InGameHUD_SWF_fla
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    
    public dynamic class AmmoContainerMC_73 extends MovieClip
    {
         
        
        public var AmmoGaugeConnector:MovieClip;
        
        public var AmmoMelee:MovieClip;
        
        public var AmmoSpecial:TextField;
        
        public var CurrentAmmoTextField:TextField;
        
        public var DoshAmmoIcon:MovieClip;
        
        public var StoredAmmoTextField:TextField;
        
        public function AmmoContainerMC_73()
        {
            super();
            addFrameScript(0,this.frame1);
        }
        
        function frame1() : *
        {
            stop();
        }
    }
}
