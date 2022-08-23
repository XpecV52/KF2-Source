package tripwire.controls.voiceComms
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.filters.GlowFilter;
    import flash.text.TextField;
    import scaleform.clik.controls.UILoader;
    import scaleform.clik.core.UIComponent;
    import tripwire.managers.HudManager;
    
    public class VoiceCommsOptionRenderer extends UIComponent
    {
         
        
        public var bActive:Boolean = false;
        
        public var bCenterOption:Boolean = false;
        
        public var bEnabled:Boolean = true;
        
        public var textField:TextField;
        
        public var iconLoader:UILoader;
        
        public var itemIndex:int = -1;
        
        public var initialX:Number = 0;
        
        public var initialWidth:Number = 0;
        
        public var xMod:Number = 0;
        
        public var SelectHighlight:MovieClip;
        
        public var BG:MovieClip;
        
        public var Bumper:MovieClip;
        
        public var Scanlines:MovieClip;
        
        public var HighlightBG:MovieClip;
        
        public var disabledAlpha:Number = 0.5;
        
        private var iconColor:Color;
        
        private var defaultColor:uint = 16503487;
        
        private var disabledColor:uint = 8024936;
        
        public function VoiceCommsOptionRenderer()
        {
            this.iconColor = new Color();
            super();
            stage.addEventListener("PopoutItems",this.popoutItem);
            this.HighlightBG.visible = false;
            this.SelectHighlight.visible = false;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        public function set data(param1:Object) : void
        {
            if(param1)
            {
                this.initialX = this.x;
                this.initialWidth = this.width;
                if(!this.bCenterOption)
                {
                    this.xMod = this.initialX > 500 ? Number(-1) : Number(1);
                }
                this.textField.text = !!param1.text ? param1.text : "";
                if(param1.iconPath && param1.iconPath != "")
                {
                    this.iconLoader.source = param1.iconPath;
                }
            }
            else
            {
                this.textField.text = "";
            }
            visible = this.textField.text != "";
        }
        
        public function get text() : String
        {
            if(this.textField.text != null && this.textField.text != "")
            {
                return this.textField.text;
            }
            return "";
        }
        
        override public function set enabled(param1:Boolean) : void
        {
            this.bEnabled = param1;
            gotoAndStop(!!param1 ? "off" : "disabled");
            this.alpha = !!param1 ? Number(1) : Number(this.disabledAlpha);
        }
        
        override public function get enabled() : Boolean
        {
            return this.bEnabled;
        }
        
        public function tintItems(param1:uint) : void
        {
            var _loc2_:GlowFilter = new GlowFilter(param1,1,8,8,1,3,false,false);
            this.textField.textColor = param1;
            this.textField.filters = [_loc2_];
            this.iconColor.setTint(param1,1);
            this.iconLoader.transform.colorTransform = this.iconColor;
        }
        
        public function activateItem() : void
        {
            if(visible && this.enabled)
            {
                this.bActive = true;
                this.HighlightBG.visible = true;
                TweenMax.to(this,2,{
                    "z":-48,
                    "x":this.initialX + this.xMod * 8,
                    "useFrames":true,
                    "ease":Cubic.easeOut
                });
            }
        }
        
        public function deactivateItem() : void
        {
            if(visible)
            {
                this.bActive = false;
                this.HighlightBG.visible = false;
                TweenMax.to(this,2,{
                    "z":0,
                    "x":this.initialX,
                    "delay":0,
                    "useFrames":true,
                    "ease":Cubic.easeIn
                });
            }
        }
        
        public function selectActiveItem() : void
        {
            if(!visible)
            {
            }
        }
        
        public function get bManagerConsoleBuild() : Boolean
        {
            if(HudManager.manager != null)
            {
                return HudManager.manager.bConsoleBuild;
            }
            return false;
        }
        
        protected function popoutItem(param1:Event) : void
        {
            stage.removeEventListener("PopoutItems",this.popoutItem);
            stage.addEventListener("PopinItems",this.popinItem);
        }
        
        protected function popinItem(param1:Event) : void
        {
            stage.removeEventListener("PopinItems",this.popinItem);
            stage.addEventListener("PopoutItems",this.popoutItem);
        }
    }
}
