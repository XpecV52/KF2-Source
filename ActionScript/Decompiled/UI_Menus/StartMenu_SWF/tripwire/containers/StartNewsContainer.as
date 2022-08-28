package tripwire.containers
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Rectangle;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.ScrollBar;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.ui.InputDetails;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripUILoader;
    
    public class StartNewsContainer extends TripContainer
    {
         
        
        public var newsText:TextField;
        
        public var titleTextField:TextField;
        
        public var closeButton:TripButton;
        
        public var newsScrollBar:ScrollBar;
        
        public var buttonPrompt:MovieClip;
        
        public var imageLoader:TripUILoader;
        
        public var imageScrollRect:Rectangle;
        
        private const buttonPrompt_Padding:int = 72;
        
        private const buttonPrompt_Icon_Offset:int = 16;
        
        private const buttonPrompt_Text_Offset:Number = 4.45;
        
        private const SCROLL_AMOUNT:int = 16;
        
        private const CONTROLLER_SCROLL_AMOUNT:int = 24;
        
        public function StartNewsContainer()
        {
            super();
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            this.updatePrompts();
            this.newsScrollBar.addEventListener(Event.SCROLL,this.updateTextPosition,false,0,true);
            this.closeButton.addEventListener(ButtonEvent.PRESS,this.closeNewsContainer,false,0,true);
            this.imageLoader.addEventListener(MouseEvent.MOUSE_WHEEL,this.handleMouseWheel,false,0,true);
            this.newsScrollBar.position = 0;
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            this.newsScrollBar.removeEventListener(Event.SCROLL,this.updateTextPosition);
            this.closeButton.removeEventListener(ButtonEvent.PRESS,this.closeNewsContainer);
            this.imageLoader.removeEventListener(MouseEvent.MOUSE_WHEEL,this.handleMouseWheel);
        }
        
        public function toggleContainer(param1:Boolean) : void
        {
            if(param1)
            {
                openContainer();
            }
            else
            {
                closeContainer();
                this.dispatchEvent(new Event("ClosedNewsPage"));
            }
        }
        
        public function closeNewsContainer(param1:Event) : void
        {
            this.toggleContainer(false);
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.titleTextField.text = !!param1.newsTitle ? param1.newsTitle : "M_LATEST NEWS_M";
                this.closeButton.label = !!param1.closeButton ? param1.closeButton : "M_CLOSE_M";
                this.buttonPromptString = !!param1.closeButton ? param1.closeButton : "M_CLOSE_M";
            }
        }
        
        public function set newsImage(param1:String) : void
        {
            this.imageLoader.source = param1;
            this.imageLoader.addEventListener(Event.COMPLETE,this.imageLoadComplete,false,0,true);
        }
        
        public function imageLoadComplete(param1:Event) : void
        {
            this.imageLoader.removeEventListener(Event.COMPLETE,this.imageLoadComplete);
            if(this.imageLoader.content.height < this.imageLoader.height)
            {
                this.newsScrollBar.visible = false;
            }
            else
            {
                this.newsScrollBar.visible = true;
                this.newsScrollBar.setScrollProperties(this.imageLoader.height,0,this.imageLoader.content.height - this.imageLoader.height,this.SCROLL_AMOUNT);
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            ANIM_START_X = x;
            this.buttonPrompt.icon.visible = false;
            this.buttonPrompt.iconB.visible = true;
            this.imageLoader.autoSize = false;
            this.imageScrollRect = new Rectangle(0,0,this.imageLoader.width,this.imageLoader.height);
            this.imageLoader.scrollRect = this.imageScrollRect;
            this.newsScrollBar.scrollTarget = this.imageLoader;
        }
        
        public function set buttonPromptString(param1:String) : void
        {
            this.buttonPrompt.textField.autoSize = TextFieldAutoSize.LEFT;
            this.buttonPrompt.textField.text = param1;
            this.buttonPrompt.BlackBG.width = this.buttonPrompt.textField.textWidth + this.buttonPrompt_Padding;
            this.buttonPrompt.iconB.x = -(this.buttonPrompt.BlackBG.width / 2) + this.buttonPrompt_Icon_Offset;
            this.buttonPrompt.textField.x = this.buttonPrompt.iconB.x + this.buttonPrompt.iconB.width + this.buttonPrompt_Text_Offset;
        }
        
        public function updateTextPosition(param1:Event) : void
        {
            this.imageScrollRect.y = param1.target.position;
            this.imageLoader.scrollRect = this.imageScrollRect;
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.updatePrompts();
        }
        
        public function updatePrompts() : void
        {
            this.closeButton.visible = !bManagerUsingGamepad;
            this.buttonPrompt.visible = bManagerUsingGamepad;
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            var _loc3_:String = null;
            super.handleInput(param1);
            if(param1.handled)
            {
                return;
            }
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN || _loc2_.value == InputValue.KEY_HOLD)
            {
                _loc3_ = param1.details.navEquivalent;
                switch(_loc3_)
                {
                    case NavigationCode.UP:
                        this.newsScrollBar.position = Math.max(0,this.newsScrollBar.position - this.CONTROLLER_SCROLL_AMOUNT);
                        param1.handled = true;
                        break;
                    case NavigationCode.DOWN:
                        this.newsScrollBar.position += this.CONTROLLER_SCROLL_AMOUNT;
                        param1.handled = true;
                        break;
                    case NavigationCode.GAMEPAD_B:
                        this.toggleContainer(false);
                        param1.handled = true;
                }
            }
        }
        
        public function handleMouseWheel(param1:MouseEvent) : void
        {
            this.newsScrollBar.position -= (param1.delta > 0 ? 1 : -1) * this.SCROLL_AMOUNT;
        }
    }
}
