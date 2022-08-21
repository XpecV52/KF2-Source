package tripwire.widgets
{
    import com.greensock.TimelineMax;
    import com.greensock.TweenMax;
    import com.greensock.easing.Circ;
    import com.greensock.easing.Expo;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import scaleform.clik.core.UIComponent;
    import scaleform.gfx.TextFieldEx;
    import tripwire.managers.HudManager;
    
    public class InteractionMsgWidget extends UIComponent
    {
         
        
        public var hitbox:MovieClip;
        
        public var buttonText:TextField;
        
        public var textField:TextField;
        
        public var tempText:TextField;
        
        public var currentString:String;
        
        public var Scanlines:MovieClip;
        
        public var BG:MovieClip;
        
        public var introTimeline:TimelineMax;
        
        public var outroTimeline:TimelineMax;
        
        public var BGTargetTweenTime:int = 3;
        
        public const BGFullTweenTime:int = 3;
        
        public const BGTransitionTweenTime:int = 6;
        
        public var InteractionStartZ:Number;
        
        public const ADJUST_X:int = 32;
        
        public const OFFSET_Z:int = 128;
        
        public var BGTargetWidth:int = 16;
        
        public var BGTargetHeight:int = 48;
        
        public const BGStartWidth:int = 16;
        
        public const BGStartHeight:int = 48;
        
        public const BGMaxHeight:int = 80;
        
        public const TARGET_ALPHA:Number = 0.88;
        
        public const BRACKET_OFFSET_X:int = 8;
        
        public function InteractionMsgWidget()
        {
            this.introTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.outroTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            super();
            _enableInitCallback = true;
            visible = false;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            this.InteractionStartZ = this.z;
            alpha = 0;
            visible = false;
            super.addedToStage(param1);
            TextFieldEx.setVerticalAlign(this.textField,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.buttonText,TextFieldEx.VALIGN_CENTER);
            this.textField.autoSize = TextFieldAutoSize.LEFT;
            this.buttonText.autoSize = TextFieldAutoSize.RIGHT;
        }
        
        public function set interactionMessageData(param1:Object) : void
        {
            if(param1)
            {
                if(param1.holdMessage)
                {
                    trace(param1.holdMessage);
                }
                else
                {
                    trace("no hold message");
                }
                if(param1.bHoldCommand)
                {
                    trace(param1.bHoldCommand);
                }
                else
                {
                    trace("not a hold command action");
                }
                if(param1.message)
                {
                    trace(param1.message);
                }
                else
                {
                    trace("no message? thats not good");
                }
                if(param1.buttonName)
                {
                    trace(param1.buttonName);
                }
                else
                {
                    trace("no button");
                }
                if(param1.holdString)
                {
                    trace(param1.holdString);
                }
                else
                {
                    trace("no hold string!");
                }
            }
        }
        
        public function showInteractionMessage(param1:String = "", param2:String = "") : void
        {
            param1 = param1.split("<%X%>").join("");
            this.tempText.text = param1;
            if(this.textField.alpha > 0 && this.textField.text == this.tempText.text)
            {
                this.textField.alpha = 1;
                this.buttonText.alpha = 1;
            }
            else
            {
                this.z = visible == true ? Number(this.InteractionStartZ) : Number(this.InteractionStartZ + this.OFFSET_Z);
                this.BGTargetTweenTime = this.textField.alpha > 0 ? int(this.BGTransitionTweenTime) : int(this.BGFullTweenTime);
                this.textField.alpha = 0;
                this.buttonText.alpha = 0;
                this.assignVals(param1,param2);
            }
        }
        
        public function assignVals(param1:String = "", param2:String = "") : *
        {
            var _loc3_:Number = this.hitbox.width;
            this.buttonText.width = 0;
            this.textField.width = 0;
            this.buttonText.text = "";
            if(param2 != "")
            {
                this.buttonText.text = "〘 " + param2 + " 〙";
            }
            this.textField.text = param1;
            TextFieldEx.setImageSubstitutions(this.buttonText,HudManager.manager.controllerIconObjects);
            _loc3_ -= this.textField.width + this.buttonText.width;
            this.BGTargetHeight = this.textField.numLines > 1 ? int(this.BGMaxHeight) : int(this.BGStartHeight);
            this.BGTargetWidth = this.buttonText.width + this.textField.width + this.ADJUST_X;
            this.buttonText.x = param2 == "" ? Number(_loc3_ / 2) : Number(_loc3_ / 2 - this.BRACKET_OFFSET_X);
            this.textField.x = this.buttonText.x + this.buttonText.width;
            this.makeIntroTimeline();
        }
        
        public function makeIntroTimeline() : void
        {
            this.introTimeline.stop();
            this.outroTimeline.stop();
            this.introTimeline.clear();
            this.introTimeline.set(this,{"visible":true});
            this.introTimeline.to(this,3,{
                "z":this.InteractionStartZ,
                "alpha":this.TARGET_ALPHA,
                "ease":Circ.easeIn
            });
            this.introTimeline.append(TweenMax.allTo([this.BG,this.Scanlines],this.BGTargetTweenTime,{
                "width":this.BGTargetWidth,
                "height":this.BGTargetHeight,
                "ease":Expo.easeOut
            }));
            this.introTimeline.append(TweenMax.allTo([this.textField,this.buttonText],3,{
                "alpha":1,
                "ease":Circ.easeOut
            }));
            this.introTimeline.restart();
        }
        
        public function makeOutroTimeline() : void
        {
            this.introTimeline.stop();
            this.outroTimeline.stop();
            this.outroTimeline.clear();
            this.outroTimeline.append(TweenMax.allTo([this.textField,this.buttonText],3,{
                "alpha":0,
                "ease":Circ.easeOut
            }));
            this.outroTimeline.append(TweenMax.allTo([this.BG,this.Scanlines],this.BGFullTweenTime,{
                "width":this.BGStartWidth,
                "height":this.BGStartHeight,
                "ease":Expo.easeOut
            }));
            this.outroTimeline.to(this,3,{
                "z":this.InteractionStartZ + this.OFFSET_Z,
                "alpha":0,
                "visible":false,
                "ease":Circ.easeOut
            });
            this.outroTimeline.restart();
        }
        
        public function outInteractionMessage() : void
        {
            if(visible)
            {
                this.makeOutroTimeline();
            }
        }
    }
}
