package tripwire.controls
{
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.controls.ListItemRenderer;
    import scaleform.clik.controls.UILoader;
    
    public class SharedContentListItemRenderer extends ListItemRenderer
    {
         
        
        public var itemIconLoader:UILoader;
        
        public var sourceTextField:TextField;
        
        public var namesTextField:TextField;
        
        public function SharedContentListItemRenderer()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            visible = false;
        }
        
        override public function setData(param1:Object) : void
        {
            super.setData(param1);
            if(param1)
            {
                visible = true;
                this.sourceTextField.text = !!param1.sourceText ? param1.sourceText : "";
                this.namesTextField.text = !!param1.names ? param1.names : "";
                if(param1.iconPath && param1.iconPath != "")
                {
                    this.itemIconLoader.source = param1.iconPath;
                }
            }
            else
            {
                visible = false;
            }
        }
    }
}
