package tripwire.controls.trader
{
    import flash.display.MovieClip;
    import scaleform.clik.core.UIComponent;
    import tripwire.managers.MenuManager;
    
    public class TraderArmorItem extends UIComponent
    {
         
        
        public var armorInfoContainer:TraderPlayerInventoryInfoRenderer;
        
        public var magButton:TraderPlayerAmmoItemRenderer;
        
        public var fillButton:TraderPlayerAmmoItemRenderer;
        
        public const START_X:int = 0;
        
        public const ARMOR_INFO_GAMEPAD_X:int = -232;
        
        public const MAG_BUTTON_GAMEPAD_X:int = 392;
        
        public const FILL_BUTTON_KBM_X:int = 112;
        
        public const FILL_BUTTON_GAMEPAD_X:int = 496;
        
        public var gamepadHighlight:MovieClip;
        
        public function TraderArmorItem()
        {
            super();
            this.gamepadHighlight.visible = false;
        }
        
        public function set magTitle(param1:String) : void
        {
            this.magButton.textField.text = param1;
            this.magButton.textField.visible = true;
        }
        
        public function set fillTitle(param1:String) : void
        {
            this.fillButton.label = param1;
        }
        
        public function set armorInfo(param1:Object) : void
        {
            if(param1)
            {
                this.magButton.buttonValue = param1.magCost;
                this.magButton.buttonState = param1.magButtonState;
                this.fillButton.buttonValue = param1.cost;
                this.fillButton.buttonState = param1.buttonState;
                this.armorInfoContainer.setData(param1);
            }
        }
        
        public function updateControllerVisibility(param1:Boolean) : void
        {
            this.armorInfoContainer.x = !!param1 ? Number(this.ARMOR_INFO_GAMEPAD_X) : Number(this.START_X);
            this.magButton.x = !!param1 ? Number(this.MAG_BUTTON_GAMEPAD_X) : Number(this.START_X);
            this.fillButton.x = !!param1 ? Number(this.FILL_BUTTON_GAMEPAD_X) : Number(this.FILL_BUTTON_KBM_X);
            this.magButton.bgVisibility = !param1;
            this.fillButton.bgVisibility = !param1;
        }
        
        override protected function changeFocus() : void
        {
            super.changeFocus();
            this.magButton.controllerIconVisibility = hasFocus && MenuManager.manager.bUsingGamepad;
            this.fillButton.controllerIconVisibility = hasFocus && MenuManager.manager.bUsingGamepad;
            this.gamepadHighlight.visible = hasFocus && MenuManager.manager.bUsingGamepad;
            this.armorInfoContainer.selected = hasFocus;
        }
    }
}
