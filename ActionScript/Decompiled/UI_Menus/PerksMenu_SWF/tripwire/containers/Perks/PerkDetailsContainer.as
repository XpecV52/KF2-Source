package tripwire.containers.perks
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Linear;
    import flash.text.TextField;
    import scaleform.clik.controls.ScrollingList;
    import scaleform.clik.controls.UILoader;
    import scaleform.clik.data.DataProvider;
    import tripwire.containers.TripContainer;
    import tripwire.controls.perks.PerksPassiveDataLineRenderer;
    
    public class PerkDetailsContainer extends TripContainer
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
        
        public var weaponIcon0:UILoader;
        
        public var weaponIcon1:UILoader;
        
        public var weaponIcon2:UILoader;
        
        public var weaponIcon3:UILoader;
        
        public var passivesList:ScrollingList;
        
        private var _passiveObjects:Vector.<PerksPassiveDataLineRenderer>;
        
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
        
        override protected function openAnimation() : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,ANIM_TIME,{
                "z":ANIM_OFFSET_Z,
                "x":ANIM_START_X + ANIM_OFFSET_X,
                "alpha":0,
                "blurFilter":{
                    "blurX":ANIM_BLUR_X,
                    "blurY":ANIM_BLUR_Y,
                    "quality":1
                },
                "ease":Linear.easeNone,
                "useFrames":true,
                "overwrite":1
            },{
                "z":ANIM_START_Z,
                "x":ANIM_START_X,
                "alpha":_defaultAlpha,
                "blurFilter":{
                    "blurX":AnimBLUR_OUT,
                    "blurY":AnimBLUR_OUT,
                    "quality":1,
                    "remove":true
                },
                "ease":Linear.easeNone,
                "useFrames":true,
                "onComplete":onOpened
            });
        }
    }
}
