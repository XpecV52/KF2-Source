package tripwire.containers.gear
{
    import com.greensock.TweenMax;
    import flash.external.ExternalInterface;
    import scaleform.clik.controls.Button;
    import scaleform.clik.events.ListEvent;
    import tripwire.containers.Perks.PerkSelectionContainer;
    
    public class GearPerkSelectionContainer extends PerkSelectionContainer
    {
         
        
        public var weaponBackButton:Button;
        
        public function GearPerkSelectionContainer()
        {
            super();
        }
        
        override public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.weaponBackButton.label = !!param1.back ? param1.back : "";
            }
        }
        
        override public function onPerkClick(param1:ListEvent) : *
        {
            if(param1.index != currentPerk)
            {
                TweenMax.killTweensOf(this);
                perkScrollingList.selectedIndex = param1.index;
                TweenMax.to(this,ANIM_TIME,{
                    "useFrames":true,
                    "onComplete":swapPerkInfo,
                    "onCompleteParams":[param1.index]
                });
            }
            ExternalInterface.call("Callback_PerkSelected",param1.index);
        }
        
        override public function setTabIndex() : void
        {
            perkScrollingList.tabIndex = 1;
            this.weaponBackButton.tabIndex = 2;
        }
    }
}
