package tripwire.containers.inventory
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.Button;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.gfx.TextFieldEx;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripUILoader;
    
    public class CraftingContainer extends TripContainer
    {
         
        
        public var craftedItemDescription:TextField;
        
        public var craftButton_0:Button;
        
        public var craftButton_1:Button;
        
        public var craftButton_2:Button;
        
        public var craftButton_3:Button;
        
        public var backButton:Button;
        
        public var filamentNumber_0:TextField;
        
        public var filamentNumber_1:TextField;
        
        public var filamentNumber_2:TextField;
        
        public var filamentNumber_3:TextField;
        
        public var filamentReqText_0:TextField;
        
        public var filamentReqText_1:TextField;
        
        public var filamentReqText_2:TextField;
        
        public var filamentReqText_3:TextField;
        
        public var itemNameText_0:TextField;
        
        public var itemNameText_1:TextField;
        
        public var itemNameText_2:TextField;
        
        public var itemNameText_3:TextField;
        
        public var itemId_0:int;
        
        public var itemId_1:int;
        
        public var itemId_2:int;
        
        public var itemId_3:int;
        
        public var filamentIcon_0:TripUILoader;
        
        public var filamentIcon_1:TripUILoader;
        
        public var filamentIcon_2:TripUILoader;
        
        public var filamentIcon_3:TripUILoader;
        
        public var titleText:TextField;
        
        public function CraftingContainer()
        {
            super();
            visible = false;
            defaultNumPrompts = 2;
            defaultFirstElement = currentElement = this.craftButton_0;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            TextFieldEx.setVerticalAlign(this.itemNameText_0,TextFieldEx.VALIGN_BOTTOM);
            TextFieldEx.setVerticalAlign(this.itemNameText_1,TextFieldEx.VALIGN_BOTTOM);
            TextFieldEx.setVerticalAlign(this.itemNameText_2,TextFieldEx.VALIGN_BOTTOM);
            TextFieldEx.setVerticalAlign(this.itemNameText_3,TextFieldEx.VALIGN_BOTTOM);
            TextFieldEx.setVerticalAlign(this.craftedItemDescription,TextFieldEx.VALIGN_CENTER);
            this.craftButton_0.addEventListener(ButtonEvent.PRESS,this.onButtonPress,false,0,true);
            this.craftButton_1.addEventListener(ButtonEvent.PRESS,this.onButtonPress,false,0,true);
            this.craftButton_2.addEventListener(ButtonEvent.PRESS,this.onButtonPress,false,0,true);
            this.craftButton_3.addEventListener(ButtonEvent.PRESS,this.onButtonPress,false,0,true);
            this.backButton.addEventListener(ButtonEvent.PRESS,this.onButtonPress,false,0,true);
            this.craftButton_0.tabIndex = 1;
            this.craftButton_1.tabIndex = 2;
            this.craftButton_2.tabIndex = 3;
            this.craftButton_3.tabIndex = 4;
            if(bManagerUsingGamepad)
            {
                this.backButton.visible = false;
            }
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.backButton.label = !!param1.back ? param1.back : "<-----";
            }
        }
        
        public function onButtonPress(param1:ButtonEvent) : void
        {
            switch(param1.currentTarget)
            {
                case this.craftButton_0:
                    ExternalInterface.call("Callback_CraftOption",this.itemId_0);
                    this.closeContainer();
                    break;
                case this.craftButton_1:
                    ExternalInterface.call("Callback_CraftOption",this.itemId_1);
                    this.closeContainer();
                    break;
                case this.craftButton_2:
                    ExternalInterface.call("Callback_CraftOption",this.itemId_2);
                    this.closeContainer();
                    break;
                case this.craftButton_3:
                    ExternalInterface.call("Callback_CraftOption",this.itemId_3);
                    this.closeContainer();
                    break;
                case this.backButton:
                    this.closeContainer();
            }
        }
        
        public function set pendingCraft(param1:Boolean) : void
        {
            this.closeContainer();
        }
        
        public function set craftIngData(param1:Object) : void
        {
            if(param1)
            {
                openContainer();
                this.titleText.text = !!param1.title ? param1.title : "";
                this.craftedItemDescription.text = !!param1.description ? param1.description : "";
                this.craftButton_0.label = !!param1.craft ? param1.craft : "";
                this.craftButton_1.label = !!param1.craft ? param1.craft : "";
                this.craftButton_2.label = !!param1.craft ? param1.craft : "";
                this.craftButton_3.label = !!param1.craft ? param1.craft : "";
                this.itemNameText_0.text = !!param1.label_0 ? param1.label_0 : "";
                this.itemNameText_1.text = !!param1.label_1 ? param1.label_1 : "";
                this.itemNameText_2.text = !!param1.label_2 ? param1.label_2 : "";
                this.itemNameText_3.text = !!param1.label_3 ? param1.label_3 : "";
                this.filamentReqText_0.text = !!param1.requirement_0 ? param1.requirement_0 : "";
                this.filamentReqText_1.text = !!param1.requirement_1 ? param1.requirement_1 : "";
                this.filamentReqText_2.text = !!param1.requirement_2 ? param1.requirement_2 : "";
                this.filamentReqText_3.text = !!param1.requirement_3 ? param1.requirement_3 : "";
                this.filamentNumber_0.text = !!param1.itemCount_0 ? param1.itemCount_0 : "0";
                this.filamentNumber_1.text = !!param1.itemCount_1 ? param1.itemCount_1 : "0";
                this.filamentNumber_2.text = !!param1.itemCount_2 ? param1.itemCount_2 : "0";
                this.filamentNumber_3.text = !!param1.itemCount_3 ? param1.itemCount_3 : "0";
                this.itemId_0 = !!param1.itemID_0 ? int(param1.itemID_0) : 0;
                this.itemId_1 = !!param1.itemID_1 ? int(param1.itemID_1) : 0;
                this.itemId_2 = !!param1.itemID_2 ? int(param1.itemID_2) : 0;
                this.itemId_3 = !!param1.itemID_3 ? int(param1.itemID_3) : 0;
                this.filamentIcon_0.source = !!param1.itemImage_0 ? param1.itemImage_0 : "";
                this.filamentIcon_1.source = !!param1.itemImage_1 ? param1.itemImage_1 : "";
                this.filamentIcon_2.source = !!param1.itemImage_2 ? param1.itemImage_2 : "";
                this.filamentIcon_3.source = !!param1.itemImage_3 ? param1.itemImage_3 : "";
            }
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            dispatchEvent(new Event("containerClosed"));
        }
        
        override protected function openAnimation(param1:Boolean = true) : *
        {
            TweenMax.fromTo(this,8,{
                "z":-128,
                "autoAlpha":0
            },{
                "z":0,
                "autoAlpha":(!!param1 ? _defaultAlpha : _dimmedAlpha),
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":onOpened
            });
        }
        
        override protected function closeAnimation() : *
        {
            TweenMax.fromTo(this,8,{
                "z":0,
                "alpha":alpha
            },{
                "visible":false,
                "z":-128,
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":onClosed
            });
        }
    }
}
