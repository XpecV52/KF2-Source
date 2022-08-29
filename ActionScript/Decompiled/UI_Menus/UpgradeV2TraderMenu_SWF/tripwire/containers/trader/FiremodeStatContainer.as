package tripwire.containers.trader
{
    import flash.text.TextField;
    import scaleform.clik.core.UIComponent;
    import tripwire.controls.TripUILoaderQueue;
    import tripwire.controls.trader.ItemStatRenderer;
    
    public class FiremodeStatContainer extends UIComponent
    {
         
        
        public var titleTextfield:TextField;
        
        public var itemStat_0:ItemStatRenderer;
        
        public var itemStat_1:ItemStatRenderer;
        
        public var itemStat_2:ItemStatRenderer;
        
        public var itemStat_3:ItemStatRenderer;
        
        public var itemStat_4:ItemStatRenderer;
        
        public var itemStat_5:ItemStatRenderer;
        
        public var firemodeIconLoader:TripUILoaderQueue;
        
        public function FiremodeStatContainer()
        {
            super();
        }
        
        public function set data(param1:Object) : void
        {
            if(param1.itemStat_0)
            {
                this.itemStat_0.itemData = this.itemStat_0;
            }
            if(param1.itemStat_1)
            {
                this.itemStat_1.itemData = this.itemStat_1;
            }
            if(param1.itemStat_1)
            {
                this.itemStat_1.itemData = this.itemStat_1;
            }
            if(param1.itemStat_2)
            {
                this.itemStat_2.itemData = this.itemStat_2;
            }
            if(param1.itemStat_3)
            {
                this.itemStat_3.itemData = this.itemStat_3;
            }
            if(param1.itemStat_4)
            {
                this.itemStat_4.itemData = this.itemStat_4;
            }
            if(param1.itemStat_5)
            {
                this.itemStat_5.itemData = this.itemStat_5;
            }
            if(param1.firemodeIcon)
            {
                this.firemodeIconLoader.source = param1.firemodeIcon;
                this.firemodeIconLoader.visible = true;
            }
            else
            {
                this.firemodeIconLoader.visible = false;
            }
            this.titleTextfield.text = !!param1.firemodeName ? param1.firemodeName : "";
        }
    }
}
