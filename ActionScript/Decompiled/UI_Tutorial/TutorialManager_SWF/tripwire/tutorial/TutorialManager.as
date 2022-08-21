package tripwire.tutorial
{
    import com.greensock.TimelineMax;
    import com.greensock.easing.Expo;
    import flash.display.MovieClip;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import scaleform.clik.core.UIComponent;
    import scaleform.gfx.Extensions;
    
    public class TutorialManager extends UIComponent
    {
        
        public static var FADE_IN = "FadeIn";
        
        public static var FADE_OUT = "FadeOut";
         
        
        public var mCursor:MovieClip;
        
        public var _bUsingGamepad:Boolean;
        
        public var blackBG:MovieClip;
        
        public var tutorialPopup:TutorialPopupContainer;
        
        public var bgTimeline;
        
        public function TutorialManager()
        {
            this.bgTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            super();
            this.makeAnims();
        }
        
        override protected function configUI() : void
        {
            super.configUI();
            Extensions.enabled = true;
            stage.scaleMode = StageScaleMode.SHOW_ALL;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.mCursor.mouseEnabled = false;
            this.mCursor.tabEnabled = false;
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.handleMouseMove,false,0,true);
            this.addEventListener(FADE_IN,this.openBG,false,0,true);
            this.addEventListener(FADE_OUT,this.closeBG,false,0,true);
        }
        
        protected function handleMouseMove(param1:MouseEvent) : void
        {
            this.mCursor.x = param1.stageX;
            this.mCursor.y = param1.stageY;
        }
        
        public function makeAnims() : void
        {
            this.bgTimeline.clear();
            this.bgTimeline.fromTo(this.blackBG,8,{"alpha":0},{"alpha":1});
        }
        
        public function openBG(param1:Event = null) : void
        {
            this.bgTimeline.tweenTo(this.bgTimeline.duration(),{"ease":Expo.easeOut});
        }
        
        public function closeBG(param1:Event = null) : void
        {
            this.bgTimeline.tweenTo(0,{"ease":Expo.easeOut});
        }
        
        public function set bUsingGamepad(param1:Boolean) : void
        {
            if(param1 != this._bUsingGamepad)
            {
                if(!param1)
                {
                }
            }
            this.mCursor.visible = param1;
        }
    }
}
