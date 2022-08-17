package tripwire.popups
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.gfx.FocusManager;
    import tripwire.containers.TripContainer;
    
    public class BasePopup extends TripContainer
    {
         
        
        public function BasePopup()
        {
            super();
            enableInitCallback = true;
            this.openPopup();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.setTabIndex();
        }
        
        public function setTabIndex() : void
        {
        }
        
        public function set descriptionText(param1:String) : void
        {
        }
        
        public function setPopupText(param1:String, param2:String, param3:String, param4:String, param5:String) : *
        {
        }
        
        public function openPopup() : void
        {
            if(!_bOpen)
            {
                this.openAnimation();
                _bOpen = true;
                FocusManager.setModalClip(this,0);
            }
        }
        
        override protected function openAnimation() : *
        {
            TweenMax.fromTo(this,6,{
                "z":-128,
                "autoAlpha":0,
                "blurFilter":{
                    "blurX":12,
                    "blurY":12,
                    "quality":1
                }
            },{
                "visible":true,
                "z":0,
                "autoAlpha":1,
                "blurFilter":{
                    "blurX":0,
                    "blurY":0,
                    "quality":1,
                    "remove":true
                },
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":onOpened
            });
        }
        
        public function onClosePopup(param1:ButtonEvent) : void
        {
            if(_bOpen)
            {
                TweenMax.fromTo(this,6,{
                    "z":0,
                    "alpha":1
                },{
                    "visible":false,
                    "z":-128,
                    "alpha":0,
                    "blurFilter":{
                        "blurX":12,
                        "blurY":12,
                        "quality":1,
                        "remove":true
                    },
                    "ease":Cubic.easeOut,
                    "useFrames":true,
                    "onComplete":this.closePopup
                });
                FocusManager.setModalClip(null,0);
                _bOpen = false;
            }
        }
        
        public function closePopup() : void
        {
            ExternalInterface.call("Callback_ClosedPopup");
        }
    }
}
