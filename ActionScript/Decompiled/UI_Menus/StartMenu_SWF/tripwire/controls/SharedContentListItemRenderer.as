package tripwire.controls
{
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
        
        override public function setData(param1:Object) : void
        {
            super.setData(param1);
            visible = param1 != null;
            if(param1)
            {
                this.sourceTextField.text = !!param1.sourceText ? param1.sourceText : "";
                this.namesTextField.text = !!param1.names ? param1.names : "";
                if(param1.iconPath && param1.iconPath != "")
                {
                    this.itemIconLoader.source = param1.iconPath;
                }
            }
        }
    }
}
