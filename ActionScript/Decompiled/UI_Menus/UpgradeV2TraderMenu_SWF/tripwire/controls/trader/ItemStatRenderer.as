package tripwire.controls.trader
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.core.UIComponent;
    
    public class ItemStatRenderer extends UIComponent
    {
         
        
        public var titleTextfield:TextField;
        
        public var valueTextfield:TextField;
        
        public var nextValueTextfield:TextField;
        
        public var upgradeChevron:MovieClip;
        
        public function ItemStatRenderer()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.titleTextfield.text = "";
            this.valueTextfield.text = "";
            this.nextValueTextfield.text = "";
            this.upgradeChevron.visible = false;
        }
        
        public function set itemData(param1:Object) : void
        {
            this.titleTextfield.text = !!param1.statTitle ? param1.statTitle : "";
            this.valueTextfield.text = !!param1.statValue ? param1.statValue : "";
            if(param1.statNextValue && param1.statNextValue != "")
            {
                this.nextValueTextfield.text = !!param1.statNextValue ? param1.statNextValue : "";
                this.upgradeChevron.visible = true;
            }
            this.upgradeChevron.visible = false;
        }
    }
}
