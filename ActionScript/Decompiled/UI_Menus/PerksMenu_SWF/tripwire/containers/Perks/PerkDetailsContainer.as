package tripwire.containers.Perks
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import scaleform.clik.controls.ScrollingList;
    import scaleform.clik.controls.UILoader;
    import scaleform.clik.data.DataProvider;
    import scaleform.gfx.TextFieldEx;
    import tripwire.controls.TripUILoaderQueue;
    import tripwire.controls.perks.PerksPassiveDataLineRenderer;
    import tripwire.managers.MenuManager;
    
    public class PerkDetailsContainer extends PerkContainerBase
    {
         
        
        public var objectivesTitleTextField:TextField;
        
        public var objectiveTextField1:TextField;
        
        public var objectiveTextField2:TextField;
        
        public var perkBonusTextField:TextField;
        
        public var basicLoadoutTextField:TextField;
        
        public var weaponIconTextField0:TextField;
        
        public var weaponIconTextField1:TextField;
        
        public var weaponIconTextField2:TextField;
        
        public var weaponIconTextField3:TextField;
        
        public var objectiveLine:MovieClip;
        
        public var bonusLine:MovieClip;
        
        public var loadoutLine:MovieClip;
        
        public var weaponIcon0:TripUILoaderQueue;
        
        public var weaponIcon1:TripUILoaderQueue;
        
        public var weaponIcon2:TripUILoaderQueue;
        
        public var weaponIcon3:TripUILoaderQueue;
        
        public var passivesList:ScrollingList;
        
        private var _passiveObjects:Vector.<PerksPassiveDataLineRenderer>;
        
        private const XP_TITLE_WIDTH:int = 312;
        
        private const SUB_TITLE_WIDTH:int = 632;
        
        public function PerkDetailsContainer()
        {
            super();
            ANIM_OFFSET_X = 0;
        }
        
        public function set passivesData(param1:Array) : *
        {
            if(param1 != null && this.passivesList != null)
            {
                this.passivesList.dataProvider = new DataProvider(param1);
            }
        }
        
        public function set detailsData(param1:Object) : *
        {
            if(param1 != null)
            {
                this.weaponIconTextField0.text = !!param1.WeaponName0 ? param1.WeaponName0 : "";
                this.weaponIconTextField1.text = !!param1.WeaponName1 ? param1.WeaponName1 : "";
                this.weaponIconTextField2.text = !!param1.WeaponName2 ? param1.WeaponName2 : "";
                this.weaponIconTextField3.text = !!param1.WeaponName3 ? param1.WeaponName3 : "";
                this.SetDataSource(param1.WeaponImage0,this.weaponIcon0);
                this.SetDataSource(param1.WeaponImage1,this.weaponIcon1);
                this.SetDataSource(param1.WeaponImage2,this.weaponIcon2);
                this.SetDataSource(param1.WeaponImage3,this.weaponIcon3);
                this.objectiveTextField1.text = !!param1.EXPAction1 ? param1.EXPAction1 : "";
                this.objectiveTextField2.text = !!param1.EXPAction2 ? param1.EXPAction2 : "";
                TextFieldEx.setVerticalAlign(this.objectiveTextField1,"center");
                TextFieldEx.setVerticalAlign(this.objectiveTextField2,"center");
                TextFieldEx.setVerticalAlign(this.weaponIconTextField0,"bottom");
                TextFieldEx.setVerticalAlign(this.weaponIconTextField1,"bottom");
                TextFieldEx.setVerticalAlign(this.weaponIconTextField2,"bottom");
                TextFieldEx.setVerticalAlign(this.weaponIconTextField3,"bottom");
                this.objectiveLine.width = this.XP_TITLE_WIDTH - this.objectivesTitleTextField.textWidth;
                this.bonusLine.width = this.SUB_TITLE_WIDTH - this.perkBonusTextField.textWidth;
                this.loadoutLine.width = this.SUB_TITLE_WIDTH - this.basicLoadoutTextField.textWidth;
            }
        }
        
        private function SetDataSource(param1:String, param2:UILoader) : *
        {
            if(param1 != null && param1 != "")
            {
                param2.source = param1;
                param2.visible = true;
            }
            else
            {
                param2.visible = false;
            }
        }
        
        override public function selectContainer() : void
        {
            if(MenuManager.manager != null)
            {
                defaultNumPrompts = !!MenuManager.manager.bOpenedInGame ? 5 : 4;
            }
            super.selectContainer();
        }
    }
}
