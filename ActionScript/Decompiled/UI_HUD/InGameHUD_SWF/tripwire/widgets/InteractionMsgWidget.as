package tripwire.widgets
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.display.BitmapData;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
    import scaleform.clik.core.UIComponent;
    import scaleform.gfx.TextFieldEx;
    
    public class InteractionMsgWidget extends UIComponent
    {
         
        
        public var textContainer:MovieClip;
        
        public const imageReplaceSubstring:String = "<%x%>";
        
        public const assetSubstring:String = "_Asset";
        
        public const buttonIconWidth:int = 32;
        
        public const buttonIconHeight:int = 32;
        
        public const buttonIconBaseLine:int = 100;
        
        private var r3Bitmapdata:BitmapData;
        
        private var dPadDownBitmapdata:BitmapData;
        
        private var bButtonBitmapdata:BitmapData;
        
        private const controllerIconPrefix:String = "XboxTypeS_";
        
        private const r3SubString:String = "RightThumbStick";
        
        private const bButtonSubString:String = "XboxTypeS_B";
        
        private const dDownSubString:String = "DPad_Down";
        
        private var controllerIconObjects;
        
        public var InteractionStartZ:Number;
        
        public function InteractionMsgWidget()
        {
            this.controllerIconObjects = new Array();
            super();
            _enableInitCallback = true;
            visible = false;
            this.r3Bitmapdata = new (getDefinitionByName(this.controllerIconPrefix + this.r3SubString + this.assetSubstring) as Class)() as BitmapData;
            this.dPadDownBitmapdata = new (getDefinitionByName(this.controllerIconPrefix + this.dDownSubString + this.assetSubstring) as Class)() as BitmapData;
            this.bButtonBitmapdata = new (getDefinitionByName(this.bButtonSubString + this.assetSubstring) as Class)() as BitmapData;
            this.controllerIconObjects[0] = {
                "subString":this.r3SubString,
                "image":this.r3Bitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.r3SubString
            };
            this.controllerIconObjects[1] = {
                "subString":this.dDownSubString,
                "image":this.dPadDownBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.dDownSubString
            };
            this.controllerIconObjects[2] = {
                "subString":this.bButtonSubString,
                "image":this.bButtonBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.bButtonSubString
            };
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            this.InteractionStartZ = this.z;
            super.addedToStage(param1);
            TextFieldEx.setVerticalAlign(this.textContainer.textField,TextFieldEx.VALIGN_CENTER);
        }
        
        public function showInteractionMessage(param1:String) : void
        {
            this.textContainer.textField.text = param1;
            TextFieldEx.setImageSubstitutions(this.textContainer.textField,this.controllerIconObjects);
            gotoAndPlay("In");
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,4,{
                "z":this.InteractionStartZ + 256,
                "alpha":0
            },{
                "z":this.InteractionStartZ,
                "visible":true,
                "alpha":0.88,
                "useFrames":true,
                "ease":Cubic.easeOut
            });
        }
        
        public function outInteractionMessage() : void
        {
            gotoAndPlay("Out");
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,4,{
                "z":this.InteractionStartZ,
                "alpha":0.88
            },{
                "z":this.InteractionStartZ + 256,
                "alpha":0,
                "visible":false,
                "delay":6,
                "useFrames":true,
                "ease":Cubic.easeIn
            });
        }
    }
}
