package tripwire.containers
{
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.text.TextField;
    import flash.utils.Timer;
    
    public class NotificationContainer extends TripContainer
    {
         
        
        public var itemNameText:TextField;
        
        public var downLoadingText:TextField;
        
        public var progressPercentText:TextField;
        
        public var queueText:TextField;
        
        public var remainingText:TextField;
        
        public var notifcationShowTime:Number = 1000;
        
        public var notificationTimer:Timer;
        
        public function NotificationContainer()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            visible = false;
            this.notificationTimer = new Timer(this.notifcationShowTime,1);
            this.notificationTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onNotificationComplete,false,0,true);
        }
        
        public function set notificationInfo(param1:Object) : void
        {
            if(param1)
            {
                this.itemNameText.text = !!param1.itemName ? param1.itemName : "";
                this.progressPercentText.text = !!param1.percent ? param1.percent.toString() + "%" : "";
                this.queueText.text = "";
                this.downLoadingText.text = !!param1.downLoading ? param1.downLoading : "";
                this.remainingText.text = !!param1.remaining ? param1.remaining : "";
                visible = true;
                this.notificationTimer.reset();
                this.notificationTimer.start();
            }
            else
            {
                visible = false;
            }
        }
        
        public function onNotificationComplete(param1:TimerEvent) : void
        {
            visible = false;
        }
    }
}
