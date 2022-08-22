package tripwire.controls.postGameMenu
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.controls.ListItemRenderer;
    import scaleform.gfx.Extensions;
    
    public class PlayerStatLineRenderer extends ListItemRenderer
    {
         
        
        public var startNum:int = 0;
        
        public var finalNum:int;
        
        public var statNum:TextField;
        
        public var statTitle:TextField;
        
        public var statMask:MovieClip;
        
        private var bSkipAnim:Boolean;
        
        public var timeScale:Number = 2;
        
        public const statWidth:Number = 532;
        
        public var statRevealSoundEffect:String = "AAR_STATLINE_TEXT";
        
        public var statCountupSoundEffect:String = "AAR_STATLINE_SCORECOUNT";
        
        public var noStatSoundEffect:String = "AAR_XP_ZERO";
        
        public function PlayerStatLineRenderer()
        {
            super();
        }
        
        public function awardAnimIn(param1:Boolean = false) : void
        {
            var _loc2_:String = this.finalNum == 0 ? this.noStatSoundEffect : this.statCountupSoundEffect;
            trace(this.name + " finalnum: " + this.finalNum);
            if(!param1)
            {
                TweenMax.to(this,1,{
                    "alpha":1,
                    "useFrames":true,
                    "ease":Cubic.easeOut
                });
                TweenMax.to(this.statMask,4 * this.timeScale,{
                    "delay":1 * this.timeScale,
                    "width":this.statWidth,
                    "useFrames":true,
                    "onStart":this.playSound,
                    "onStartParams":[this.statRevealSoundEffect]
                });
                TweenMax.to(this,8 * this.timeScale,{
                    "delay":4 * this.timeScale,
                    "startNum":this.finalNum,
                    "onUpdate":this.changeNum,
                    "ease":Cubic.easeOut,
                    "useFrames":true,
                    "onStart":this.playSound,
                    "onStartParams":[_loc2_],
                    "onComplete":this.doneAndDone
                });
            }
            else if(param1)
            {
                this.alpha = 1;
                this.statMask.width = this.statWidth;
                this.statNum.text = this.finalNum.toString();
                this.doneAndDone();
            }
        }
        
        public function playSound(param1:String) : void
        {
            if(Extensions.enabled)
            {
                Extensions.gfxProcessSound(this,"UI",param1);
            }
        }
        
        public function doneAndDone(param1:Event = null) : void
        {
            parent.dispatchEvent(new Event("PlayerNextAnim"));
        }
        
        function changeNum() : void
        {
            if(!this.bSkipAnim)
            {
                this.statNum.text = this.startNum.toString();
            }
        }
        
        override public function set data(param1:Object) : void
        {
            super.data = param1;
            visible = param1 != null;
            if(param1)
            {
                this.statTitle.text = !!param1.title ? param1.title : "";
                this.finalNum = !!param1.value ? int(param1.value) : 0;
                if(param1.bSkipAnim)
                {
                    this.bSkipAnim = true;
                    this.statNum.text = this.finalNum.toString();
                }
            }
        }
    }
}
