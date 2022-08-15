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
    import tripwire.menus.StartMenu;
    
    public dynamic class StartMenuMC extends StartMenu
    {
         
        
        public var __animFactory_overviewContaineraf1:AnimatorFactory3D;
        
        public var __animArray_overviewContaineraf1:Array;
        
        public var ____motion_overviewContaineraf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_overviewContaineraf1_matArray__:Array;
        
        public var __motion_overviewContaineraf1:MotionBase;
        
        public var __animFactory_gameOptionsContaineraf1:AnimatorFactory3D;
        
        public var __animArray_gameOptionsContaineraf1:Array;
        
        public var ____motion_gameOptionsContaineraf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_gameOptionsContaineraf1_matArray__:Array;
        
        public var __motion_gameOptionsContaineraf1:MotionBase;
        
        public var __animFactory_findGameContaineraf1:AnimatorFactory3D;
        
        public var __animArray_findGameContaineraf1:Array;
        
        public var ____motion_findGameContaineraf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_findGameContaineraf1_matArray__:Array;
        
        public var __motion_findGameContaineraf1:MotionBase;
        
        public function StartMenuMC()
        {
            super();
            if(this.__animFactory_overviewContaineraf1 == null)
            {
                this.__animArray_overviewContaineraf1 = new Array();
                this.__motion_overviewContaineraf1 = new MotionBase();
                this.__motion_overviewContaineraf1.duration = 1;
                this.__motion_overviewContaineraf1.overrideTargetTransform();
                this.__motion_overviewContaineraf1.addPropertyArray("blendMode",["normal"]);
                this.__motion_overviewContaineraf1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_overviewContaineraf1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_overviewContaineraf1.addPropertyArray("visible",[true]);
                this.__motion_overviewContaineraf1.is3D = true;
                this.__motion_overviewContaineraf1.motion_internal::spanStart = 0;
                this.____motion_overviewContaineraf1_matArray__ = new Array();
                this.____motion_overviewContaineraf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_overviewContaineraf1_mat3DVec__[0] = 1;
                this.____motion_overviewContaineraf1_mat3DVec__[1] = 0;
                this.____motion_overviewContaineraf1_mat3DVec__[2] = 0;
                this.____motion_overviewContaineraf1_mat3DVec__[3] = 0;
                this.____motion_overviewContaineraf1_mat3DVec__[4] = 0;
                this.____motion_overviewContaineraf1_mat3DVec__[5] = 1;
                this.____motion_overviewContaineraf1_mat3DVec__[6] = 0;
                this.____motion_overviewContaineraf1_mat3DVec__[7] = 0;
                this.____motion_overviewContaineraf1_mat3DVec__[8] = 0;
                this.____motion_overviewContaineraf1_mat3DVec__[9] = 0;
                this.____motion_overviewContaineraf1_mat3DVec__[10] = 1;
                this.____motion_overviewContaineraf1_mat3DVec__[11] = 0;
                this.____motion_overviewContaineraf1_mat3DVec__[12] = 0;
                this.____motion_overviewContaineraf1_mat3DVec__[13] = 0;
                this.____motion_overviewContaineraf1_mat3DVec__[14] = 0;
                this.____motion_overviewContaineraf1_mat3DVec__[15] = 1;
                this.____motion_overviewContaineraf1_matArray__.push(new Matrix3D(this.____motion_overviewContaineraf1_mat3DVec__));
                this.__motion_overviewContaineraf1.addPropertyArray("matrix3D",this.____motion_overviewContaineraf1_matArray__);
                this.__animArray_overviewContaineraf1.push(this.__motion_overviewContaineraf1);
                this.__animFactory_overviewContaineraf1 = new AnimatorFactory3D(null,this.__animArray_overviewContaineraf1);
                this.__animFactory_overviewContaineraf1.addTargetInfo(this,"overviewContainer",0,true,0,true,null,-1);
            }
            if(this.__animFactory_gameOptionsContaineraf1 == null)
            {
                this.__animArray_gameOptionsContaineraf1 = new Array();
                this.__motion_gameOptionsContaineraf1 = new MotionBase();
                this.__motion_gameOptionsContaineraf1.duration = 1;
                this.__motion_gameOptionsContaineraf1.overrideTargetTransform();
                this.__motion_gameOptionsContaineraf1.addPropertyArray("blendMode",["normal"]);
                this.__motion_gameOptionsContaineraf1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_gameOptionsContaineraf1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_gameOptionsContaineraf1.addPropertyArray("visible",[true]);
                this.__motion_gameOptionsContaineraf1.is3D = true;
                this.__motion_gameOptionsContaineraf1.motion_internal::spanStart = 0;
                this.____motion_gameOptionsContaineraf1_matArray__ = new Array();
                this.____motion_gameOptionsContaineraf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_gameOptionsContaineraf1_mat3DVec__[0] = 1;
                this.____motion_gameOptionsContaineraf1_mat3DVec__[1] = 0;
                this.____motion_gameOptionsContaineraf1_mat3DVec__[2] = 0;
                this.____motion_gameOptionsContaineraf1_mat3DVec__[3] = 0;
                this.____motion_gameOptionsContaineraf1_mat3DVec__[4] = 0;
                this.____motion_gameOptionsContaineraf1_mat3DVec__[5] = 1;
                this.____motion_gameOptionsContaineraf1_mat3DVec__[6] = 0;
                this.____motion_gameOptionsContaineraf1_mat3DVec__[7] = 0;
                this.____motion_gameOptionsContaineraf1_mat3DVec__[8] = 0;
                this.____motion_gameOptionsContaineraf1_mat3DVec__[9] = 0;
                this.____motion_gameOptionsContaineraf1_mat3DVec__[10] = 1;
                this.____motion_gameOptionsContaineraf1_mat3DVec__[11] = 0;
                this.____motion_gameOptionsContaineraf1_mat3DVec__[12] = 0;
                this.____motion_gameOptionsContaineraf1_mat3DVec__[13] = 0;
                this.____motion_gameOptionsContaineraf1_mat3DVec__[14] = 0;
                this.____motion_gameOptionsContaineraf1_mat3DVec__[15] = 1;
                this.____motion_gameOptionsContaineraf1_matArray__.push(new Matrix3D(this.____motion_gameOptionsContaineraf1_mat3DVec__));
                this.__motion_gameOptionsContaineraf1.addPropertyArray("matrix3D",this.____motion_gameOptionsContaineraf1_matArray__);
                this.__animArray_gameOptionsContaineraf1.push(this.__motion_gameOptionsContaineraf1);
                this.__animFactory_gameOptionsContaineraf1 = new AnimatorFactory3D(null,this.__animArray_gameOptionsContaineraf1);
                this.__animFactory_gameOptionsContaineraf1.addTargetInfo(this,"gameOptionsContainer",0,true,0,true,null,-1);
            }
            if(this.__animFactory_findGameContaineraf1 == null)
            {
                this.__animArray_findGameContaineraf1 = new Array();
                this.__motion_findGameContaineraf1 = new MotionBase();
                this.__motion_findGameContaineraf1.duration = 1;
                this.__motion_findGameContaineraf1.overrideTargetTransform();
                this.__motion_findGameContaineraf1.addPropertyArray("blendMode",["normal"]);
                this.__motion_findGameContaineraf1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_findGameContaineraf1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_findGameContaineraf1.addPropertyArray("visible",[true]);
                this.__motion_findGameContaineraf1.is3D = true;
                this.__motion_findGameContaineraf1.motion_internal::spanStart = 0;
                this.____motion_findGameContaineraf1_matArray__ = new Array();
                this.____motion_findGameContaineraf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_findGameContaineraf1_mat3DVec__[0] = 1;
                this.____motion_findGameContaineraf1_mat3DVec__[1] = 0;
                this.____motion_findGameContaineraf1_mat3DVec__[2] = 0;
                this.____motion_findGameContaineraf1_mat3DVec__[3] = 0;
                this.____motion_findGameContaineraf1_mat3DVec__[4] = 0;
                this.____motion_findGameContaineraf1_mat3DVec__[5] = 1;
                this.____motion_findGameContaineraf1_mat3DVec__[6] = 0;
                this.____motion_findGameContaineraf1_mat3DVec__[7] = 0;
                this.____motion_findGameContaineraf1_mat3DVec__[8] = 0;
                this.____motion_findGameContaineraf1_mat3DVec__[9] = 0;
                this.____motion_findGameContaineraf1_mat3DVec__[10] = 1;
                this.____motion_findGameContaineraf1_mat3DVec__[11] = 0;
                this.____motion_findGameContaineraf1_mat3DVec__[12] = 0;
                this.____motion_findGameContaineraf1_mat3DVec__[13] = 0;
                this.____motion_findGameContaineraf1_mat3DVec__[14] = 0;
                this.____motion_findGameContaineraf1_mat3DVec__[15] = 1;
                this.____motion_findGameContaineraf1_matArray__.push(new Matrix3D(this.____motion_findGameContaineraf1_mat3DVec__));
                this.__motion_findGameContaineraf1.addPropertyArray("matrix3D",this.____motion_findGameContaineraf1_matArray__);
                this.__animArray_findGameContaineraf1.push(this.__motion_findGameContaineraf1);
                this.__animFactory_findGameContaineraf1 = new AnimatorFactory3D(null,this.__animArray_findGameContaineraf1);
                this.__animFactory_findGameContaineraf1.addTargetInfo(this,"findGameContainer",0,true,0,true,null,-1);
            }
            this.__setProp_findGameContainer_StartMenuMC_FindGame_0();
        }
        
        function __setProp_findGameContainer_StartMenuMC_FindGame_0() : *
        {
            try
            {
                findGameContainer["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            findGameContainer.enabled = true;
            findGameContainer.enableInitCallback = true;
            findGameContainer.visible = true;
            try
            {
                findGameContainer["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
