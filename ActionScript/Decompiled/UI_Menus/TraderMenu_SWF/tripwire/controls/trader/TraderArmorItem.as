package tripwire.controls.trader
{
    import scaleform.clik.core.UIComponent;
    import tripwire.managers.MenuManager;
    
    public class TraderArmorItem extends UIComponent
    {
         
        
        public var armorInfoContainer:TraderPlayerInventoryInfoRenderer;
        
        public var fillButton:TraderPlayerAmmoItemRenderer;
        
        public function TraderArmorItem()
        {
            super();
        }
        
        public function set fillTitle(param1:String) : void
        {
            this.fillButton.label = param1;
        }
        
        public function set armorInfo(param1:Object) : void
        {
            if(param1)
            {
                this.fillButton.buttonValue = param1.cost;
                this.fillButton.buttonState = param1.buttonState;
                this.armorInfoContainer.setData(param1);
            }
        }
        
        override protected function changeFocus() : void
        {
            super.changeFocus();
            this.fillButton.controllerIconVisibility = hasFocus && MenuManager.manager.bUsingGamepad;
            this.armorInfoContainer.selected = hasFocus;
        }
    }
}
