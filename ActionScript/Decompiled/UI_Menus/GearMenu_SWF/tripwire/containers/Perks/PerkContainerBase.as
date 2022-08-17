package tripwire.containers.Perks
{
    import com.greensock.TweenMax;
    import tripwire.containers.TripContainer;
    import tripwire.managers.MenuManager;
    
    public class PerkContainerBase extends TripContainer
    {
         
        
        public var bOpenInConfig:Boolean = false;
        
        public function PerkContainerBase()
        {
            super();
            defaultNumPrompts = 2;
        }
        
        override public function openContainer() : void
        {
            if(!_bOpen)
            {
                if(!initialized)
                {
                    this.bOpenInConfig = true;
                    return;
                }
                if(currentElement == null && bManagerUsingGamepad && defaultFirstElement)
                {
                    currentElement = defaultFirstElement;
                }
                if(stage)
                {
                    stage.addEventListener(MenuManager.INPUT_CHANGED,onInputChange,false,0,true);
                }
                selectContainer();
                if(isNaN(ANIM_START_X))
                {
                    this.alpha = 0;
                    TweenMax.to(this,1,{
                        "useFrames":true,
                        "onComplete":openAnimation
                    });
                }
                else
                {
                    this.alpha = 0;
                    openAnimation();
                }
                _bOpen = true;
            }
        }
        
        override protected function configUI() : void
        {
            if(this.bOpenInConfig)
            {
                this.openContainer();
                this.bOpenInConfig = false;
            }
        }
    }
}
