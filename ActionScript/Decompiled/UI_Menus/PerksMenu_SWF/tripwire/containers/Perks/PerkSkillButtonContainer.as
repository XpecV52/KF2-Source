package tripwire.containers.Perks
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
        
        public function set bUnlocked(value:Boolean) : void
        {
            this._bUnlocked = value;
            this.skillButton0.enabled = this.skillButton1.active = this._bUnlocked;
            this.skillButton1.enabled = this.skillButton1.active = this._bUnlocked;
        }
        
        override protected function addedToStage(e:Event) : void
        {
            super.addedToStage(e);
            this.skillButton0.addEventListener(ButtonEvent.PRESS,this.onButtonPress,false,0,true);
            this.skillButton1.addEventListener(ButtonEvent.PRESS,this.onButtonPress,false,0,true);
        }
        
        private function onButtonPress(e:ButtonEvent) : void
        {
            if(e.currentTarget == this.skillButton0)
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
        
        public function set tier(value:int) : void
        {
            this.skillButton0.tier = value;
            this.skillButton1.tier = value;
        }
        
        public function setData(data:Object) : void
        {
            if(data)
            {
                visible = true;
                this.sectionText.text = !!data.label ? data.label : "";
                this.bUnlocked = !!data.bUnlocked ? Boolean(data.bUnlocked) : false;
                this.tierUnlockTextField.text = !!data.unlockLevel ? data.unlockLevel : "";
                if(data.skill0 != null)
                {
                    this.skillButton0.setData(data.skill0);
                }
                if(data.skill1 != null)
                {
                    this.skillButton1.setData(data.skill1);
                }
                this.selectedSkill = !!data.selectedSkill ? int(data.selectedSkill) : 0;
            }
            else
            {
                visible = false;
            }
        }
        
        public function set selectedSkill(value:int) : void
        {
            switch(value)
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
        
        public function set sectionName(value:String) : void
        {
            this.sectionText.text = value;
        }
        
        public function set levelUnlockText(value:String) : void
        {
            this.tierUnlockTextField.text = value;
        }
    }
}
