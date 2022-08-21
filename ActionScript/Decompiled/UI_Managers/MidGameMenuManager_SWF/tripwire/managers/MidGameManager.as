package tripwire.managers
{
    import flash.display.StageScaleMode;
    import scaleform.clik.core.UIComponent;
    import scaleform.gfx.Extensions;
    
    public class MidGameManager extends UIComponent
    {
         
        
        public var midGameMenuMC:MidGameMenu;
        
        public function MidGameManager()
        {
            super();
        }
        
        override protected function configUI() : void
        {
            super.configUI();
            Extensions.enabled = true;
            stage.scaleMode = StageScaleMode.SHOW_ALL;
        }
    }
}
