package tripwire.containers.postGame
{
    import flash.display.DisplayObject;
    import scaleform.clik.core.UIComponent;
    
    public class ScrollObjectContainer extends UIComponent
    {
         
        
        public var displayItemList:Vector.<DisplayObject>;
        
        public const displayItemBuffer:int = 0;
        
        public function ScrollObjectContainer()
        {
            this.displayItemList = new Vector.<DisplayObject>();
            super();
        }
        
        public function addDisplayObject(param1:DisplayObject) : void
        {
            if(param1 == null)
            {
                return;
            }
            addChild(param1);
            param1.x = 0;
            if(this.displayItemList.length > 0)
            {
                param1.y = this.displayItemList[this.displayItemList.length - 1].y + this.displayItemList[this.displayItemList.length - 1].height + this.displayItemBuffer;
            }
            else
            {
                param1.y = 0;
            }
            this.displayItemList.push(param1);
            height = this.displayItemList[this.displayItemList.length - 1].y + this.displayItemList[this.displayItemList.length - 1].height + this.displayItemBuffer;
        }
    }
}
