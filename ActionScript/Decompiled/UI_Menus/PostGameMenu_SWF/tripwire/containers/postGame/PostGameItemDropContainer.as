package tripwire.containers.postGame
{
    import flash.text.TextField;
    import scaleform.clik.controls.UILoader;
    import scaleform.gfx.Extensions;
    import tripwire.containers.TripContainer;
    
    public class PostGameItemDropContainer extends TripContainer
    {
         
        
        public var dropTitleText:TextField;
        
        public var dropNameText:TextField;
        
        public var dropIconLoader:UILoader;
        
        public function PostGameItemDropContainer()
        {
            super();
            visible = false;
        }
        
        public function set data(param1:Object) : void
        {
            if(param1)
            {
                visible = true;
                this.dropNameText.text = !!param1.itemName ? param1.itemName : "";
                if(param1.iconImage != "")
                {
                    this.dropIconLoader.source = param1.iconImage;
                }
                if(Extensions.gfxProcessSound != null)
                {
                    Extensions.gfxProcessSound(this,"AAR","Item_Drop");
                }
            }
            else
            {
                visible = false;
            }
        }
    }
}
