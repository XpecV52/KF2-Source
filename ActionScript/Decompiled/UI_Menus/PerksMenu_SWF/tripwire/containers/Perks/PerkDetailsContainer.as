package tripwire.containers.Perks
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Linear;
    import flash.text.TextField;
    import scaleform.clik.controls.ScrollingList;
    import scaleform.clik.controls.UILoader;
    import scaleform.clik.data.DataProvider;
    import tripwire.controls.perks.PerksPassiveDataLineRenderer;
    
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
        
        public function set passivesData(source:Array) : *
        {
            if(source != null && this.passivesList != null)
            {
                this.passivesList.dataProvider = new DataProvider(source);
            }
        }
        
        public function set detailsData(data:Object) : *
        {
            if(data != null)
            {
                this.weaponIconTextField0.text = !!data.WeaponName0 ? data.WeaponName0 : "";
                this.weaponIconTextField1.text = !!data.WeaponName1 ? data.WeaponName1 : "";
                this.weaponIconTextField2.text = !!data.WeaponName2 ? data.WeaponName2 : "";
                this.weaponIconTextField3.text = !!data.WeaponName3 ? data.WeaponName3 : "";
                this.SetDataSource(data.WeaponImage0,this.weaponIcon0);
                this.SetDataSource(data.WeaponImage1,this.weaponIcon1);
                this.SetDataSource(data.WeaponImage2,this.weaponIcon2);
                this.SetDataSource(data.WeaponImage3,this.weaponIcon3);
                this.objectiveTextField1.text = !!data.EXPAction1 ? data.EXPAction1 : "";
                this.objectiveTextField2.text = !!data.EXPAction2 ? data.EXPAction2 : "";
            }
        }
        
        private function SetDataSource(_source:String, _uiLoader:UILoader) : *
        {
            if(_source != null && _source != "")
            {
                _uiLoader.source = _source;
                _uiLoader.visible = true;
            }
            else
            {
                _uiLoader.visible = false;
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
