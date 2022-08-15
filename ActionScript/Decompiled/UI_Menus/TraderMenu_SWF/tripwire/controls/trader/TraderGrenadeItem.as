package tripwire.controls.trader
{
    import scaleform.clik.core.UIComponent;
    import tripwire.managers.MenuManager;
    
    public class TraderGrenadeItem extends UIComponent
    {
         
        
        public var grenadeInfoContainer:TraderPlayerInventoryInfoRenderer;
        
        public var fillButton:TraderPlayerAmmoItemRenderer;
        
        public var magButton:TraderPlayerAmmoItemRenderer;
        
        public function TraderGrenadeItem()
        {
            super();
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
        
        override protected function changeFocus() : void
        {
            super.changeFocus();
            this.fillButton.controllerIconVisibility = hasFocus && MenuManager.manager.bUsingGamepad;
            this.magButton.controllerIconVisibility = hasFocus && MenuManager.manager.bUsingGamepad;
            this.grenadeInfoContainer.selected = hasFocus;
        }
    }
}
