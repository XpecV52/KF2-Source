package tripwire.controls.perks
{
    import flash.text.TextField;
    import scaleform.clik.controls.ListItemRenderer;
    import scaleform.gfx.TextFieldEx;
    
    public class PerksPassiveDataLineRenderer extends ListItemRenderer
    {
         
        
        public var perkBonusTitleTextField:TextField;
        
        public var perkBonusBigTitleTextField:TextField;
        
        public var perkBonusModifierTextField:TextField;
        
        public var perkBonusAmountTextField:TextField;
        
        public function PerksPassiveDataLineRenderer()
        {
            super();
        }
        
        override public function setData(param1:Object) : void
        {
            super.setData(param1);
            if(param1 != null)
            {
                this.perkBonusAmountTextField.text = !!param1.PerkBonusAmount ? "+" + param1.PerkBonusAmount : "";
                this.perkBonusModifierTextField.text = !!param1.PerkBonusModifier ? param1.PerkBonusModifier : "";
                this.perkBonusTitleTextField.text = this.perkBonusAmountTextField.text != "" && param1.PassiveTitle ? param1.PassiveTitle : "";
                this.perkBonusBigTitleTextField.text = this.perkBonusAmountTextField.text == "" && param1.PassiveTitle ? param1.PassiveTitle : "";
                TextFieldEx.setVerticalAlign(this.perkBonusTitleTextField,"center");
                TextFieldEx.setVerticalAlign(this.perkBonusBigTitleTextField,"center");
                visible = true;
            }
            else
            {
                visible = false;
            }
        }
    }
}
