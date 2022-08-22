package tripwire.controls.trader
{
    import flash.display.MovieClip;
    import scaleform.clik.core.UIComponent;
    import tripwire.managers.MenuManager;
    
    public class TraderGrenadeItem extends UIComponent
    {
         
        
        public var grenadeInfoContainer:TraderPlayerInventoryInfoRenderer;
        
        public var fillButton:TraderPlayerAmmoItemRenderer;
        
        public var magButton:TraderPlayerAmmoItemRenderer;
        
        public const START_X:int = 0;
        
        public const MAG_BUTTON_GAMEPAD_X:int = 392;
        
        public const GRENADE_INFO_GAMEPAD_X:int = -232;
        
        public const FILL_BUTTON_KBM_X:int = 112;
        
        public const FILL_BUTTON_GAMEPAD_X:int = 496;
        
        public var gamepadHighlight:MovieClip;
        
        public function TraderGrenadeItem()
        {
            super();
            this.gamepadHighlight.visible = false;
        }
        
        public function set fillTitle(param1:String) : void
        {
            this.fillButton.label = param1;
        }
        
        public function set grenadeInfo(param1:Object) : void
        {
            if(param1)
            {
                this.magButton.buttonValue = param1.magCost;
                this.magButton.buttonState = param1.magButtonState;
                this.fillButton.buttonValue = param1.fillCost;
                this.fillButton.buttonState = param1.fillButtonState;
                this.grenadeInfoContainer.setData(param1);
            }
        }
        
        public function updateControllerVisibility(param1:Boolean) : void
        {
            this.grenadeInfoContainer.x = !!param1 ? Number(this.GRENADE_INFO_GAMEPAD_X) : Number(this.START_X);
            this.magButton.x = !!param1 ? Number(this.MAG_BUTTON_GAMEPAD_X) : Number(this.START_X);
            this.fillButton.x = !!param1 ? Number(this.FILL_BUTTON_GAMEPAD_X) : Number(this.FILL_BUTTON_KBM_X);
            this.magButton.bgVisibility = !param1;
            this.fillButton.bgVisibility = !param1;
        }
        
        override protected function changeFocus() : void
        {
            super.changeFocus();
            this.fillButton.controllerIconVisibility = hasFocus && MenuManager.manager.bUsingGamepad;
            this.magButton.controllerIconVisibility = hasFocus && MenuManager.manager.bUsingGamepad;
            this.gamepadHighlight.visible = hasFocus && MenuManager.manager.bUsingGamepad;
            this.grenadeInfoContainer.selected = hasFocus;
        }
    }
}
