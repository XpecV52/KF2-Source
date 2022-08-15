package tripwire.containers.perks
{
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.events.ButtonEvent;
    import tripwire.controls.TripDescriptionIconButton;
    
    public class PerkSkillButtonContainer extends UIComponent
    {
         
        
        public var skillButton0:TripDescriptionIconButton;
        
        public var skillButton1:TripDescriptionIconButton;
        
        private var _bUnlocked:Boolean = false;
        
        public var tierUnlockTextField:TextField;
        
        public var sectionText:TextField;
        
        public function PerkSkillButtonContainer()
        {
            super();
        }
        
        public function set bUnlocked(param1:Boolean) : void
        {
            this._bUnlocked = param1;
            this.skillButton0.enabled = this.skillButton1.active = this._bUnlocked;
            this.skillButton1.enabled = this.skillButton1.active = this._bUnlocked;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.skillButton0.addEventListener(ButtonEvent.PRESS,this.onButtonPress,false,0,true);
            this.skillButton1.addEventListener(ButtonEvent.PRESS,this.onButtonPress,false,0,true);
        }
        
        private function onButtonPress(param1:ButtonEvent) : void
        {
            if(param1.currentTarget == this.skillButton0)
            {
                this.selectedSkill = 1;
                ExternalInterface.call("Callback_SkillSelected",this.skillButton0.tier,1);
            }
            else
            {
                this.selectedSkill = 2;
                ExternalInterface.call("Callback_SkillSelected",this.skillButton1.tier,2);
            }
        }
        
        public function set tier(param1:int) : void
        {
            this.skillButton0.tier = param1;
            this.skillButton1.tier = param1;
        }
        
        public function setData(param1:Object) : void
        {
            if(param1)
            {
                visible = true;
                this.sectionText.text = !!param1.label ? param1.label : "";
                this.bUnlocked = !!param1.bUnlocked ? Boolean(param1.bUnlocked) : false;
                this.tierUnlockTextField.text = !!param1.unlockLevel ? param1.unlockLevel : "";
                if(param1.skill0 != null)
                {
                    this.skillButton0.setData(param1.skill0);
                }
                if(param1.skill1 != null)
                {
                    this.skillButton1.setData(param1.skill1);
                }
                this.selectedSkill = !!param1.selectedSkill ? int(param1.selectedSkill) : 0;
            }
            else
            {
                visible = false;
            }
        }
        
        public function set selectedSkill(param1:int) : void
        {
            switch(param1)
            {
                case 1:
                    this.skillButton0.active = true;
                    this.skillButton1.active = false;
                    break;
                case 2:
                    this.skillButton0.active = false;
                    this.skillButton1.active = true;
                    break;
                default:
                    this.skillButton0.active = false;
                    this.skillButton1.active = false;
            }
        }
        
        public function set sectionName(param1:String) : void
        {
            this.sectionText.text = param1;
        }
        
        public function set levelUnlockText(param1:String) : void
        {
            this.tierUnlockTextField.text = param1;
        }
    }
}
