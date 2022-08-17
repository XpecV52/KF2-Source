package tripwire.containers
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.display.MovieClip;
    import scaleform.clik.core.UIComponent;
    
    public class WeaponSelectItemContainer extends UIComponent
    {
         
        
        public var WeaponInfoContainer:MovieClip;
        
        public var EmptyContainer:MovieClip;
        
        public var WeaponItemRedBG:MovieClip;
        
        private var _data:Object;
        
        public var throwable:Boolean = false;
        
        public function WeaponSelectItemContainer()
        {
            super();
            this.WeaponInfoContainer.WeaponName.visible = false;
            this.WeaponItemRedBG.visible = false;
        }
        
        public function get data() : Object
        {
            return this._data;
        }
        
        public function set data(param1:Object) : void
        {
            this._data = param1;
            this.throwable = !!param1.throwable ? Boolean(param1.throwable) : false;
            if(param1.texturePath != null && param1.texturePath != "")
            {
                this.WeaponInfoContainer.WeaponImageLoader.source = param1.texturePath;
                if(!this.WeaponInfoContainer.WeaponImageLoader.visible)
                {
                    this.WeaponInfoContainer.WeaponImageLoader.visible = true;
                }
            }
            this.WeaponInfoContainer.WeaponName.text = param1.weaponName;
            this.updateCurrentAmmo(param1.ammoCount,param1.spareAmmoCount,param1.bUsesAmmo);
        }
        
        public function updateCurrentAmmo(param1:int, param2:int, param3:Boolean) : *
        {
            if(param3)
            {
                if(param1 == 0 && param2 == 0)
                {
                    this.enabled = false;
                }
                else
                {
                    this.enabled = true;
                }
                this.ammoString = param1 + "/" + param2;
            }
            else
            {
                this.enabled = true;
                this.ammoString = "";
            }
        }
        
        public function set ammoString(param1:String) : *
        {
            this.WeaponInfoContainer.WeaponAmmo.text = param1;
        }
        
        public function selected() : void
        {
            this.WeaponInfoContainer.WeaponName.visible = true;
            this.WeaponItemRedBG.visible = true;
            TweenMax.to(this,4,{
                "z":-64,
                "useFrames":true,
                "ease":Cubic.easeOut
            });
        }
        
        public function unselected() : void
        {
            this.WeaponInfoContainer.WeaponName.visible = false;
            this.WeaponItemRedBG.visible = false;
            TweenMax.to(this,4,{
                "z":0,
                "useFrames":true,
                "ease":Cubic.easeOut
            });
        }
        
        override public function set enabled(param1:Boolean) : void
        {
            if(param1)
            {
                this.EmptyContainer.visible = false;
                this.alpha = 1;
            }
            else
            {
                this.EmptyContainer.visible = true;
                this.alpha = 0.5;
            }
        }
    }
}
