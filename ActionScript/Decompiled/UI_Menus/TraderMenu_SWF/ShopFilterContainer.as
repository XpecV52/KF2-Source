package
{
    import adobe.utils.*;
    import fl.motion.AnimatorFactory3D;
    import fl.motion.MotionBase;
    import fl.motion.motion_internal;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.media.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.engine.*;
    import flash.text.ime.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;
    import tripwire.containers.trader.TraderFilterContainer;
    
    public dynamic class ShopFilterContainer extends TraderFilterContainer
    {
         
        
        public var __animFactory_leftButtonIconaf1:AnimatorFactory3D;
        
        public var __animArray_leftButtonIconaf1:Array;
        
        public var ____motion_leftButtonIconaf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_leftButtonIconaf1_matArray__:Array;
        
        public var __motion_leftButtonIconaf1:MotionBase;
        
        public var __animFactory_rightButtonIconaf1:AnimatorFactory3D;
        
        public var __animArray_rightButtonIconaf1:Array;
        
        public var ____motion_rightButtonIconaf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_rightButtonIconaf1_matArray__:Array;
        
        public var __motion_rightButtonIconaf1:MotionBase;
        
        public var __animFactory_leftTriggerIconaf1:AnimatorFactory3D;
        
        public var __animArray_leftTriggerIconaf1:Array;
        
        public var ____motion_leftTriggerIconaf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_leftTriggerIconaf1_matArray__:Array;
        
        public var __motion_leftTriggerIconaf1:MotionBase;
        
        public var __animFactory_rightTriggerIconaf1:AnimatorFactory3D;
        
        public var __animArray_rightTriggerIconaf1:Array;
        
        public var ____motion_rightTriggerIconaf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_rightTriggerIconaf1_matArray__:Array;
        
        public var __motion_rightTriggerIconaf1:MotionBase;
        
        public function ShopFilterContainer()
        {
            super();
            if(this.__animFactory_leftButtonIconaf1 == null)
            {
                this.__animArray_leftButtonIconaf1 = new Array();
                this.__motion_leftButtonIconaf1 = new MotionBase();
                this.__motion_leftButtonIconaf1.duration = 1;
                this.__motion_leftButtonIconaf1.overrideTargetTransform();
                this.__motion_leftButtonIconaf1.addPropertyArray("blendMode",["normal"]);
                this.__motion_leftButtonIconaf1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_leftButtonIconaf1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_leftButtonIconaf1.addPropertyArray("tintColor",[12255231]);
                this.__motion_leftButtonIconaf1.addPropertyArray("tintMultiplier",[1]);
                this.__motion_leftButtonIconaf1.addPropertyArray("visible",[true]);
                this.__motion_leftButtonIconaf1.is3D = true;
                this.__motion_leftButtonIconaf1.motion_internal::spanStart = 0;
                this.____motion_leftButtonIconaf1_matArray__ = new Array();
                this.____motion_leftButtonIconaf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_leftButtonIconaf1_mat3DVec__[0] = 0.25;
                this.____motion_leftButtonIconaf1_mat3DVec__[1] = 0;
                this.____motion_leftButtonIconaf1_mat3DVec__[2] = 0;
                this.____motion_leftButtonIconaf1_mat3DVec__[3] = 0;
                this.____motion_leftButtonIconaf1_mat3DVec__[4] = 0;
                this.____motion_leftButtonIconaf1_mat3DVec__[5] = 0.25;
                this.____motion_leftButtonIconaf1_mat3DVec__[6] = 0;
                this.____motion_leftButtonIconaf1_mat3DVec__[7] = 0;
                this.____motion_leftButtonIconaf1_mat3DVec__[8] = 0;
                this.____motion_leftButtonIconaf1_mat3DVec__[9] = 0;
                this.____motion_leftButtonIconaf1_mat3DVec__[10] = 1;
                this.____motion_leftButtonIconaf1_mat3DVec__[11] = 0;
                this.____motion_leftButtonIconaf1_mat3DVec__[12] = -4;
                this.____motion_leftButtonIconaf1_mat3DVec__[13] = -56;
                this.____motion_leftButtonIconaf1_mat3DVec__[14] = 0;
                this.____motion_leftButtonIconaf1_mat3DVec__[15] = 1;
                this.____motion_leftButtonIconaf1_matArray__.push(new Matrix3D(this.____motion_leftButtonIconaf1_mat3DVec__));
                this.__motion_leftButtonIconaf1.addPropertyArray("matrix3D",this.____motion_leftButtonIconaf1_matArray__);
                this.__animArray_leftButtonIconaf1.push(this.__motion_leftButtonIconaf1);
                this.__animFactory_leftButtonIconaf1 = new AnimatorFactory3D(null,this.__animArray_leftButtonIconaf1);
                this.__animFactory_leftButtonIconaf1.addTargetInfo(this,"leftButtonIcon",0,true,0,true,null,-1);
            }
            if(this.__animFactory_rightButtonIconaf1 == null)
            {
                this.__animArray_rightButtonIconaf1 = new Array();
                this.__motion_rightButtonIconaf1 = new MotionBase();
                this.__motion_rightButtonIconaf1.duration = 1;
                this.__motion_rightButtonIconaf1.overrideTargetTransform();
                this.__motion_rightButtonIconaf1.addPropertyArray("blendMode",["normal"]);
                this.__motion_rightButtonIconaf1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_rightButtonIconaf1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_rightButtonIconaf1.addPropertyArray("tintColor",[12255231]);
                this.__motion_rightButtonIconaf1.addPropertyArray("tintMultiplier",[1]);
                this.__motion_rightButtonIconaf1.addPropertyArray("visible",[true]);
                this.__motion_rightButtonIconaf1.is3D = true;
                this.__motion_rightButtonIconaf1.motion_internal::spanStart = 0;
                this.____motion_rightButtonIconaf1_matArray__ = new Array();
                this.____motion_rightButtonIconaf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_rightButtonIconaf1_mat3DVec__[0] = 0.25;
                this.____motion_rightButtonIconaf1_mat3DVec__[1] = 0;
                this.____motion_rightButtonIconaf1_mat3DVec__[2] = 0;
                this.____motion_rightButtonIconaf1_mat3DVec__[3] = 0;
                this.____motion_rightButtonIconaf1_mat3DVec__[4] = 0;
                this.____motion_rightButtonIconaf1_mat3DVec__[5] = 0.25;
                this.____motion_rightButtonIconaf1_mat3DVec__[6] = 0;
                this.____motion_rightButtonIconaf1_mat3DVec__[7] = 0;
                this.____motion_rightButtonIconaf1_mat3DVec__[8] = 0;
                this.____motion_rightButtonIconaf1_mat3DVec__[9] = 0;
                this.____motion_rightButtonIconaf1_mat3DVec__[10] = 1;
                this.____motion_rightButtonIconaf1_mat3DVec__[11] = 0;
                this.____motion_rightButtonIconaf1_mat3DVec__[12] = 708;
                this.____motion_rightButtonIconaf1_mat3DVec__[13] = -56;
                this.____motion_rightButtonIconaf1_mat3DVec__[14] = 0;
                this.____motion_rightButtonIconaf1_mat3DVec__[15] = 1;
                this.____motion_rightButtonIconaf1_matArray__.push(new Matrix3D(this.____motion_rightButtonIconaf1_mat3DVec__));
                this.__motion_rightButtonIconaf1.addPropertyArray("matrix3D",this.____motion_rightButtonIconaf1_matArray__);
                this.__animArray_rightButtonIconaf1.push(this.__motion_rightButtonIconaf1);
                this.__animFactory_rightButtonIconaf1 = new AnimatorFactory3D(null,this.__animArray_rightButtonIconaf1);
                this.__animFactory_rightButtonIconaf1.addTargetInfo(this,"rightButtonIcon",0,true,0,true,null,-1);
            }
            if(this.__animFactory_leftTriggerIconaf1 == null)
            {
                this.__animArray_leftTriggerIconaf1 = new Array();
                this.__motion_leftTriggerIconaf1 = new MotionBase();
                this.__motion_leftTriggerIconaf1.duration = 1;
                this.__motion_leftTriggerIconaf1.overrideTargetTransform();
                this.__motion_leftTriggerIconaf1.addPropertyArray("blendMode",["normal"]);
                this.__motion_leftTriggerIconaf1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_leftTriggerIconaf1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_leftTriggerIconaf1.addPropertyArray("tintColor",[12255231]);
                this.__motion_leftTriggerIconaf1.addPropertyArray("tintMultiplier",[1]);
                this.__motion_leftTriggerIconaf1.addPropertyArray("visible",[true]);
                this.__motion_leftTriggerIconaf1.is3D = true;
                this.__motion_leftTriggerIconaf1.motion_internal::spanStart = 0;
                this.____motion_leftTriggerIconaf1_matArray__ = new Array();
                this.____motion_leftTriggerIconaf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_leftTriggerIconaf1_mat3DVec__[0] = 0.3125;
                this.____motion_leftTriggerIconaf1_mat3DVec__[1] = 0;
                this.____motion_leftTriggerIconaf1_mat3DVec__[2] = 0;
                this.____motion_leftTriggerIconaf1_mat3DVec__[3] = 0;
                this.____motion_leftTriggerIconaf1_mat3DVec__[4] = 0;
                this.____motion_leftTriggerIconaf1_mat3DVec__[5] = 0.3125;
                this.____motion_leftTriggerIconaf1_mat3DVec__[6] = 0;
                this.____motion_leftTriggerIconaf1_mat3DVec__[7] = 0;
                this.____motion_leftTriggerIconaf1_mat3DVec__[8] = 0;
                this.____motion_leftTriggerIconaf1_mat3DVec__[9] = 0;
                this.____motion_leftTriggerIconaf1_mat3DVec__[10] = 1;
                this.____motion_leftTriggerIconaf1_mat3DVec__[11] = 0;
                this.____motion_leftTriggerIconaf1_mat3DVec__[12] = -8;
                this.____motion_leftTriggerIconaf1_mat3DVec__[13] = 8;
                this.____motion_leftTriggerIconaf1_mat3DVec__[14] = 0;
                this.____motion_leftTriggerIconaf1_mat3DVec__[15] = 1;
                this.____motion_leftTriggerIconaf1_matArray__.push(new Matrix3D(this.____motion_leftTriggerIconaf1_mat3DVec__));
                this.__motion_leftTriggerIconaf1.addPropertyArray("matrix3D",this.____motion_leftTriggerIconaf1_matArray__);
                this.__animArray_leftTriggerIconaf1.push(this.__motion_leftTriggerIconaf1);
                this.__animFactory_leftTriggerIconaf1 = new AnimatorFactory3D(null,this.__animArray_leftTriggerIconaf1);
                this.__animFactory_leftTriggerIconaf1.addTargetInfo(this,"leftTriggerIcon",0,true,0,true,null,-1);
            }
            if(this.__animFactory_rightTriggerIconaf1 == null)
            {
                this.__animArray_rightTriggerIconaf1 = new Array();
                this.__motion_rightTriggerIconaf1 = new MotionBase();
                this.__motion_rightTriggerIconaf1.duration = 1;
                this.__motion_rightTriggerIconaf1.overrideTargetTransform();
                this.__motion_rightTriggerIconaf1.addPropertyArray("blendMode",["normal"]);
                this.__motion_rightTriggerIconaf1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_rightTriggerIconaf1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_rightTriggerIconaf1.addPropertyArray("tintColor",[12255231]);
                this.__motion_rightTriggerIconaf1.addPropertyArray("tintMultiplier",[1]);
                this.__motion_rightTriggerIconaf1.addPropertyArray("visible",[true]);
                this.__motion_rightTriggerIconaf1.is3D = true;
                this.__motion_rightTriggerIconaf1.motion_internal::spanStart = 0;
                this.____motion_rightTriggerIconaf1_matArray__ = new Array();
                this.____motion_rightTriggerIconaf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_rightTriggerIconaf1_mat3DVec__[0] = 0.3125;
                this.____motion_rightTriggerIconaf1_mat3DVec__[1] = 0;
                this.____motion_rightTriggerIconaf1_mat3DVec__[2] = 0;
                this.____motion_rightTriggerIconaf1_mat3DVec__[3] = 0;
                this.____motion_rightTriggerIconaf1_mat3DVec__[4] = 0;
                this.____motion_rightTriggerIconaf1_mat3DVec__[5] = 0.3125;
                this.____motion_rightTriggerIconaf1_mat3DVec__[6] = 0;
                this.____motion_rightTriggerIconaf1_mat3DVec__[7] = 0;
                this.____motion_rightTriggerIconaf1_mat3DVec__[8] = 0;
                this.____motion_rightTriggerIconaf1_mat3DVec__[9] = 0;
                this.____motion_rightTriggerIconaf1_mat3DVec__[10] = 1;
                this.____motion_rightTriggerIconaf1_mat3DVec__[11] = 0;
                this.____motion_rightTriggerIconaf1_mat3DVec__[12] = 704;
                this.____motion_rightTriggerIconaf1_mat3DVec__[13] = 8;
                this.____motion_rightTriggerIconaf1_mat3DVec__[14] = 0;
                this.____motion_rightTriggerIconaf1_mat3DVec__[15] = 1;
                this.____motion_rightTriggerIconaf1_matArray__.push(new Matrix3D(this.____motion_rightTriggerIconaf1_mat3DVec__));
                this.__motion_rightTriggerIconaf1.addPropertyArray("matrix3D",this.____motion_rightTriggerIconaf1_matArray__);
                this.__animArray_rightTriggerIconaf1.push(this.__motion_rightTriggerIconaf1);
                this.__animFactory_rightTriggerIconaf1 = new AnimatorFactory3D(null,this.__animArray_rightTriggerIconaf1);
                this.__animFactory_rightTriggerIconaf1.addTargetInfo(this,"rightTriggerIcon",0,true,0,true,null,-1);
            }
            this.__setProp_filterButtonBar_ShopFilterContainer_MC_Layer2_0();
            this.__setProp_tabBar_ShopFilterContainer_MC_Tabs_0();
        }
        
        function __setProp_filterButtonBar_ShopFilterContainer_MC_Layer2_0() : *
        {
            try
            {
                filterButtonBar["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            filterButtonBar.autoSize = "none";
            filterButtonBar.buttonWidth = 0;
            filterButtonBar.direction = "horizontal";
            filterButtonBar.enabled = true;
            filterButtonBar.enableInitCallback = false;
            filterButtonBar.focusable = false;
            filterButtonBar.itemRendererName = "FilterButton";
            filterButtonBar.spacing = 0;
            filterButtonBar.visible = true;
            try
            {
                filterButtonBar["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_tabBar_ShopFilterContainer_MC_Tabs_0() : *
        {
            try
            {
                tabBar["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            tabBar.autoSize = "none";
            tabBar.buttonWidth = 0;
            tabBar.direction = "horizontal";
            tabBar.enabled = true;
            tabBar.enableInitCallback = false;
            tabBar.focusable = true;
            tabBar.itemRendererName = "ShopTab";
            tabBar.spacing = 0;
            tabBar.visible = true;
            try
            {
                tabBar["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
