package tripwire.widgets
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.utils.Timer;
    import scaleform.clik.core.UIComponent;
    
    public class LevelUpNotificationWidget extends UIComponent
    {
         
        
        public var iconLoaderContainer:MovieClip;
        
        public var mainTextfieldMC:MovieClip;
        
        public var currentValueTextMC:MovieClip;
        
        public var previousValueTextMC:MovieClip;
        
        public var titleTextfieldMC:MovieClip;
        
        public var secondaryTextfieldMC:MovieClip;
        
        private var showTimer:Timer;
        
        private const levelUpShowTime:Number = 3000;
        
        public function LevelUpNotificationWidget()
        {
            super();
            enableInitCallback = true;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        public function set showAchievementPopUp(param1:Object) : *
        {
            this.titleTextfieldMC.levelUpText.text = !!param1.titleString ? param1.titleString : "";
            this.mainTextfieldMC.perkNameText.text = !!param1.mainString ? param1.mainString : "";
            this.secondaryTextfieldMC.levelUpText.text = !!param1.secondaryString ? param1.secondaryString : "";
            this.currentValueTextMC.levelText.text = param1.newValue != -1 ? String(param1.newValue) : "";
            this.previousValueTextMC.levelText.text = param1.newValue != -1 ? String(param1.newValue - 1) : "";
            this.iconLoaderContainer.iconLoader.source = !!param1.iconPath ? param1.iconPath : "";
            this.secondaryTextfieldMC.visible = !!param1.bShowSecondary ? Boolean(param1.bShowSecondary) : false;
            gotoAndPlay("Play");
            visible = true;
            this.showTimer = new Timer(this.levelUpShowTime,1);
            this.showTimer.addEventListener(TimerEvent.TIMER,this.onShowTimerComplete,false,0,true);
            this.showTimer.start();
        }
        
        private function onShowTimerComplete(param1:TimerEvent) : void
        {
            gotoAndPlay("Close");
        }
    }
}
