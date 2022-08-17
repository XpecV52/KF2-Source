package tripwire.controls.perks
{
    import flash.text.TextField;
    import scaleform.clik.controls.ListItemRenderer;
    
    public class PerksPassiveDataLineRenderer extends ListItemRenderer
    {
         
        
        public var perkBonusTitleTextField:TextField;
        
        public var perkBonusModifierTextField:TextField;
        
        public var perkBonusAmountTextField:TextField;
        
        public function PerksPassiveDataLineRenderer()
        {
            super();
        }
        
        override public function setData(data:Object) : void
        {
            super.setData(data);
            if(data != null)
            {
                this.perkBonusTitleTextField.text = !!data.PassiveTitle ? data.PassiveTitle : "";
                this.perkBonusAmountTextField.text = !!data.PerkBonusAmount ? data.PerkBonusAmount : "";
                this.perkBonusModifierTextField.text = !!data.PerkBonusModifier ? data.PerkBonusModifier : "";
                visible = true;
            }
            else
            {
                visible = false;
            }
        }
    }
}
