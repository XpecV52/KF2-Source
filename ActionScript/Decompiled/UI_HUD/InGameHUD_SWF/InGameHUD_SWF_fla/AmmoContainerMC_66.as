package InGameHUD_SWF_fla
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    
    public dynamic class AmmoContainerMC_66 extends MovieClip
    {
         
        
        public var AmmoGaugeConnector:MovieClip;
        
        public var AmmoMelee:MovieClip;
        
        public var CurrentAmmoTextField:TextField;
        
        public var StoredAmmoTextField:TextField;
        
        public function AmmoContainerMC_66()
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
