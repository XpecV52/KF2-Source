package tripwire.popups
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.external.ExternalInterface;
    import scaleform.clik.events.ButtonEvent;
    import tripwire.containers.TripContainer;
    
    public class BasePopup extends TripContainer
    {
         
        
        public function BasePopup()
        {
            super();
            enableInitCallback = true;
            this.setTabIndex();
            this.openPopup();
        }
        
        public function setTabIndex() : *
        {
        }
        
        public function setPopupText(param1:String, param2:String, param3:String, param4:String, param5:String) : *
        {
        }
        
        public function openPopup() : void
        {
            if(!_bOpen)
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
                    "z":0,
                    "autoAlpha":1,
                    "blurFilter":{
                        "blurX":0,
                        "blurY":0,
                        "quality":1,
                        "remove":true
                    },
                    "ease":Cubic.easeOut,
                    "useFrames":true
                });
                _bOpen = true;
            }
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
                _bOpen = false;
            }
        }
        
        public function closePopup() : void
        {
            ExternalInterface.call("Callback_ClosedPopup");
        }
    }
}
