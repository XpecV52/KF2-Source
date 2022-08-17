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
    import tripwire.widgets.WeaponSelectWidget;
    
    public dynamic class WeaponSelectContainerMC extends WeaponSelectWidget
    {
         
        
        public var __id0_:MovieClip;
        
        public var __animFactory_WeaponCategoryContainer3af1:AnimatorFactory3D;
        
        public var __animArray_WeaponCategoryContainer3af1:Array;
        
        public var ____motion_WeaponCategoryContainer3af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_WeaponCategoryContainer3af1_matArray__:Array;
        
        public var __motion_WeaponCategoryContainer3af1:MotionBase;
        
        public var __animFactory_WeaponCategoryContainer2af1:AnimatorFactory3D;
        
        public var __animArray_WeaponCategoryContainer2af1:Array;
        
        public var ____motion_WeaponCategoryContainer2af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_WeaponCategoryContainer2af1_matArray__:Array;
        
        public var __motion_WeaponCategoryContainer2af1:MotionBase;
        
        public var __animFactory_WeaponCategoryContainer1af1:AnimatorFactory3D;
        
        public var __animArray_WeaponCategoryContainer1af1:Array;
        
        public var ____motion_WeaponCategoryContainer1af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_WeaponCategoryContainer1af1_matArray__:Array;
        
        public var __motion_WeaponCategoryContainer1af1:MotionBase;
        
        public var __animFactory_WeaponCategoryContainer0af1:AnimatorFactory3D;
        
        public var __animArray_WeaponCategoryContainer0af1:Array;
        
        public var ____motion_WeaponCategoryContainer0af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_WeaponCategoryContainer0af1_matArray__:Array;
        
        public var __motion_WeaponCategoryContainer0af1:MotionBase;
        
        public var __animFactory_WeaponCategoryContainerGamePad3af1:AnimatorFactory3D;
        
        public var __animArray_WeaponCategoryContainerGamePad3af1:Array;
        
        public var ____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_WeaponCategoryContainerGamePad3af1_matArray__:Array;
        
        public var __motion_WeaponCategoryContainerGamePad3af1:MotionBase;
        
        public var __animFactory_WeaponCategoryContainerGamePad2af1:AnimatorFactory3D;
        
        public var __animArray_WeaponCategoryContainerGamePad2af1:Array;
        
        public var ____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_WeaponCategoryContainerGamePad2af1_matArray__:Array;
        
        public var __motion_WeaponCategoryContainerGamePad2af1:MotionBase;
        
        public var __animFactory_WeaponCategoryContainerGamePad1af1:AnimatorFactory3D;
        
        public var __animArray_WeaponCategoryContainerGamePad1af1:Array;
        
        public var ____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_WeaponCategoryContainerGamePad1af1_matArray__:Array;
        
        public var __motion_WeaponCategoryContainerGamePad1af1:MotionBase;
        
        public var __animFactory_WeaponCategoryContainerGamePad0af1:AnimatorFactory3D;
        
        public var __animArray_WeaponCategoryContainerGamePad0af1:Array;
        
        public var ____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_WeaponCategoryContainerGamePad0af1_matArray__:Array;
        
        public var __motion_WeaponCategoryContainerGamePad0af1:MotionBase;
        
        public var __animFactory___id0_af1:AnimatorFactory3D;
        
        public var __animArray___id0_af1:Array;
        
        public var ____motion___id0_af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion___id0_af1_matArray__:Array;
        
        public var __motion___id0_af1:MotionBase;
        
        public function WeaponSelectContainerMC()
        {
            super();
            addFrameScript(0,this.frame1,1,this.frame2);
            if(this.__animFactory_WeaponCategoryContainer3af1 == null)
            {
                this.__animArray_WeaponCategoryContainer3af1 = new Array();
                this.__motion_WeaponCategoryContainer3af1 = new MotionBase();
                this.__motion_WeaponCategoryContainer3af1.duration = 1;
                this.__motion_WeaponCategoryContainer3af1.overrideTargetTransform();
                this.__motion_WeaponCategoryContainer3af1.addPropertyArray("blendMode",["layer"]);
                this.__motion_WeaponCategoryContainer3af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_WeaponCategoryContainer3af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_WeaponCategoryContainer3af1.addPropertyArray("visible",[true]);
                this.__motion_WeaponCategoryContainer3af1.is3D = true;
                this.__motion_WeaponCategoryContainer3af1.motion_internal::spanStart = 0;
                this.____motion_WeaponCategoryContainer3af1_matArray__ = new Array();
                this.____motion_WeaponCategoryContainer3af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_WeaponCategoryContainer3af1_mat3DVec__[0] = 0.961262;
                this.____motion_WeaponCategoryContainer3af1_mat3DVec__[1] = 0;
                this.____motion_WeaponCategoryContainer3af1_mat3DVec__[2] = -0.275637;
                this.____motion_WeaponCategoryContainer3af1_mat3DVec__[3] = 0;
                this.____motion_WeaponCategoryContainer3af1_mat3DVec__[4] = 0;
                this.____motion_WeaponCategoryContainer3af1_mat3DVec__[5] = 1;
                this.____motion_WeaponCategoryContainer3af1_mat3DVec__[6] = 0;
                this.____motion_WeaponCategoryContainer3af1_mat3DVec__[7] = 0;
                this.____motion_WeaponCategoryContainer3af1_mat3DVec__[8] = 0.275637;
                this.____motion_WeaponCategoryContainer3af1_mat3DVec__[9] = 0;
                this.____motion_WeaponCategoryContainer3af1_mat3DVec__[10] = 0.961262;
                this.____motion_WeaponCategoryContainer3af1_mat3DVec__[11] = 0;
                this.____motion_WeaponCategoryContainer3af1_mat3DVec__[12] = 1230.297119;
                this.____motion_WeaponCategoryContainer3af1_mat3DVec__[13] = 32;
                this.____motion_WeaponCategoryContainer3af1_mat3DVec__[14] = 274.152954;
                this.____motion_WeaponCategoryContainer3af1_mat3DVec__[15] = 1;
                this.____motion_WeaponCategoryContainer3af1_matArray__.push(new Matrix3D(this.____motion_WeaponCategoryContainer3af1_mat3DVec__));
                this.__motion_WeaponCategoryContainer3af1.addPropertyArray("matrix3D",this.____motion_WeaponCategoryContainer3af1_matArray__);
                this.__animArray_WeaponCategoryContainer3af1.push(this.__motion_WeaponCategoryContainer3af1);
                this.__animFactory_WeaponCategoryContainer3af1 = new AnimatorFactory3D(null,this.__animArray_WeaponCategoryContainer3af1);
                this.__animFactory_WeaponCategoryContainer3af1.addTargetInfo(this,"WeaponCategoryContainer3",0,true,0,true,null,-1);
            }
            if(this.__animFactory_WeaponCategoryContainer2af1 == null)
            {
                this.__animArray_WeaponCategoryContainer2af1 = new Array();
                this.__motion_WeaponCategoryContainer2af1 = new MotionBase();
                this.__motion_WeaponCategoryContainer2af1.duration = 1;
                this.__motion_WeaponCategoryContainer2af1.overrideTargetTransform();
                this.__motion_WeaponCategoryContainer2af1.addPropertyArray("blendMode",["layer"]);
                this.__motion_WeaponCategoryContainer2af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_WeaponCategoryContainer2af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_WeaponCategoryContainer2af1.addPropertyArray("visible",[true]);
                this.__motion_WeaponCategoryContainer2af1.is3D = true;
                this.__motion_WeaponCategoryContainer2af1.motion_internal::spanStart = 0;
                this.____motion_WeaponCategoryContainer2af1_matArray__ = new Array();
                this.____motion_WeaponCategoryContainer2af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_WeaponCategoryContainer2af1_mat3DVec__[0] = 1;
                this.____motion_WeaponCategoryContainer2af1_mat3DVec__[1] = 0;
                this.____motion_WeaponCategoryContainer2af1_mat3DVec__[2] = 0;
                this.____motion_WeaponCategoryContainer2af1_mat3DVec__[3] = 0;
                this.____motion_WeaponCategoryContainer2af1_mat3DVec__[4] = 0;
                this.____motion_WeaponCategoryContainer2af1_mat3DVec__[5] = 1;
                this.____motion_WeaponCategoryContainer2af1_mat3DVec__[6] = 0;
                this.____motion_WeaponCategoryContainer2af1_mat3DVec__[7] = 0;
                this.____motion_WeaponCategoryContainer2af1_mat3DVec__[8] = 0;
                this.____motion_WeaponCategoryContainer2af1_mat3DVec__[9] = 0;
                this.____motion_WeaponCategoryContainer2af1_mat3DVec__[10] = 1;
                this.____motion_WeaponCategoryContainer2af1_mat3DVec__[11] = 0;
                this.____motion_WeaponCategoryContainer2af1_mat3DVec__[12] = 973;
                this.____motion_WeaponCategoryContainer2af1_mat3DVec__[13] = 32;
                this.____motion_WeaponCategoryContainer2af1_mat3DVec__[14] = 288;
                this.____motion_WeaponCategoryContainer2af1_mat3DVec__[15] = 1;
                this.____motion_WeaponCategoryContainer2af1_matArray__.push(new Matrix3D(this.____motion_WeaponCategoryContainer2af1_mat3DVec__));
                this.__motion_WeaponCategoryContainer2af1.addPropertyArray("matrix3D",this.____motion_WeaponCategoryContainer2af1_matArray__);
                this.__animArray_WeaponCategoryContainer2af1.push(this.__motion_WeaponCategoryContainer2af1);
                this.__animFactory_WeaponCategoryContainer2af1 = new AnimatorFactory3D(null,this.__animArray_WeaponCategoryContainer2af1);
                this.__animFactory_WeaponCategoryContainer2af1.addTargetInfo(this,"WeaponCategoryContainer2",0,true,0,true,null,-1);
            }
            if(this.__animFactory_WeaponCategoryContainer1af1 == null)
            {
                this.__animArray_WeaponCategoryContainer1af1 = new Array();
                this.__motion_WeaponCategoryContainer1af1 = new MotionBase();
                this.__motion_WeaponCategoryContainer1af1.duration = 1;
                this.__motion_WeaponCategoryContainer1af1.overrideTargetTransform();
                this.__motion_WeaponCategoryContainer1af1.addPropertyArray("blendMode",["layer"]);
                this.__motion_WeaponCategoryContainer1af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_WeaponCategoryContainer1af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_WeaponCategoryContainer1af1.addPropertyArray("visible",[true]);
                this.__motion_WeaponCategoryContainer1af1.is3D = true;
                this.__motion_WeaponCategoryContainer1af1.motion_internal::spanStart = 0;
                this.____motion_WeaponCategoryContainer1af1_matArray__ = new Array();
                this.____motion_WeaponCategoryContainer1af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_WeaponCategoryContainer1af1_mat3DVec__[0] = 1;
                this.____motion_WeaponCategoryContainer1af1_mat3DVec__[1] = 0;
                this.____motion_WeaponCategoryContainer1af1_mat3DVec__[2] = 0;
                this.____motion_WeaponCategoryContainer1af1_mat3DVec__[3] = 0;
                this.____motion_WeaponCategoryContainer1af1_mat3DVec__[4] = 0;
                this.____motion_WeaponCategoryContainer1af1_mat3DVec__[5] = 1;
                this.____motion_WeaponCategoryContainer1af1_mat3DVec__[6] = 0;
                this.____motion_WeaponCategoryContainer1af1_mat3DVec__[7] = 0;
                this.____motion_WeaponCategoryContainer1af1_mat3DVec__[8] = 0;
                this.____motion_WeaponCategoryContainer1af1_mat3DVec__[9] = 0;
                this.____motion_WeaponCategoryContainer1af1_mat3DVec__[10] = 1;
                this.____motion_WeaponCategoryContainer1af1_mat3DVec__[11] = 0;
                this.____motion_WeaponCategoryContainer1af1_mat3DVec__[12] = 717;
                this.____motion_WeaponCategoryContainer1af1_mat3DVec__[13] = 32;
                this.____motion_WeaponCategoryContainer1af1_mat3DVec__[14] = 288;
                this.____motion_WeaponCategoryContainer1af1_mat3DVec__[15] = 1;
                this.____motion_WeaponCategoryContainer1af1_matArray__.push(new Matrix3D(this.____motion_WeaponCategoryContainer1af1_mat3DVec__));
                this.__motion_WeaponCategoryContainer1af1.addPropertyArray("matrix3D",this.____motion_WeaponCategoryContainer1af1_matArray__);
                this.__animArray_WeaponCategoryContainer1af1.push(this.__motion_WeaponCategoryContainer1af1);
                this.__animFactory_WeaponCategoryContainer1af1 = new AnimatorFactory3D(null,this.__animArray_WeaponCategoryContainer1af1);
                this.__animFactory_WeaponCategoryContainer1af1.addTargetInfo(this,"WeaponCategoryContainer1",0,true,0,true,null,-1);
            }
            if(this.__animFactory_WeaponCategoryContainer0af1 == null)
            {
                this.__animArray_WeaponCategoryContainer0af1 = new Array();
                this.__motion_WeaponCategoryContainer0af1 = new MotionBase();
                this.__motion_WeaponCategoryContainer0af1.duration = 1;
                this.__motion_WeaponCategoryContainer0af1.overrideTargetTransform();
                this.__motion_WeaponCategoryContainer0af1.addPropertyArray("blendMode",["layer"]);
                this.__motion_WeaponCategoryContainer0af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_WeaponCategoryContainer0af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_WeaponCategoryContainer0af1.addPropertyArray("visible",[true]);
                this.__motion_WeaponCategoryContainer0af1.is3D = true;
                this.__motion_WeaponCategoryContainer0af1.motion_internal::spanStart = 0;
                this.____motion_WeaponCategoryContainer0af1_matArray__ = new Array();
                this.____motion_WeaponCategoryContainer0af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_WeaponCategoryContainer0af1_mat3DVec__[0] = 0.961262;
                this.____motion_WeaponCategoryContainer0af1_mat3DVec__[1] = 0;
                this.____motion_WeaponCategoryContainer0af1_mat3DVec__[2] = 0.275637;
                this.____motion_WeaponCategoryContainer0af1_mat3DVec__[3] = 0;
                this.____motion_WeaponCategoryContainer0af1_mat3DVec__[4] = 0;
                this.____motion_WeaponCategoryContainer0af1_mat3DVec__[5] = 1;
                this.____motion_WeaponCategoryContainer0af1_mat3DVec__[6] = 0;
                this.____motion_WeaponCategoryContainer0af1_mat3DVec__[7] = 0;
                this.____motion_WeaponCategoryContainer0af1_mat3DVec__[8] = -0.275637;
                this.____motion_WeaponCategoryContainer0af1_mat3DVec__[9] = 0;
                this.____motion_WeaponCategoryContainer0af1_mat3DVec__[10] = 0.961262;
                this.____motion_WeaponCategoryContainer0af1_mat3DVec__[11] = 0;
                this.____motion_WeaponCategoryContainer0af1_mat3DVec__[12] = 469;
                this.____motion_WeaponCategoryContainer0af1_mat3DVec__[13] = 32;
                this.____motion_WeaponCategoryContainer0af1_mat3DVec__[14] = 208;
                this.____motion_WeaponCategoryContainer0af1_mat3DVec__[15] = 1;
                this.____motion_WeaponCategoryContainer0af1_matArray__.push(new Matrix3D(this.____motion_WeaponCategoryContainer0af1_mat3DVec__));
                this.__motion_WeaponCategoryContainer0af1.addPropertyArray("matrix3D",this.____motion_WeaponCategoryContainer0af1_matArray__);
                this.__animArray_WeaponCategoryContainer0af1.push(this.__motion_WeaponCategoryContainer0af1);
                this.__animFactory_WeaponCategoryContainer0af1 = new AnimatorFactory3D(null,this.__animArray_WeaponCategoryContainer0af1);
                this.__animFactory_WeaponCategoryContainer0af1.addTargetInfo(this,"WeaponCategoryContainer0",0,true,0,true,null,-1);
            }
            if(this.__animFactory_WeaponCategoryContainerGamePad3af1 == null)
            {
                this.__animArray_WeaponCategoryContainerGamePad3af1 = new Array();
                this.__motion_WeaponCategoryContainerGamePad3af1 = new MotionBase();
                this.__motion_WeaponCategoryContainerGamePad3af1.duration = 1;
                this.__motion_WeaponCategoryContainerGamePad3af1.overrideTargetTransform();
                this.__motion_WeaponCategoryContainerGamePad3af1.addPropertyArray("blendMode",["normal"]);
                this.__motion_WeaponCategoryContainerGamePad3af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_WeaponCategoryContainerGamePad3af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_WeaponCategoryContainerGamePad3af1.addPropertyArray("visible",[true]);
                this.__motion_WeaponCategoryContainerGamePad3af1.is3D = true;
                this.__motion_WeaponCategoryContainerGamePad3af1.motion_internal::spanStart = 1;
                this.____motion_WeaponCategoryContainerGamePad3af1_matArray__ = new Array();
                this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__[0] = 1;
                this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__[1] = 0;
                this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__[2] = 0;
                this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__[3] = 0;
                this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__[4] = 0;
                this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__[5] = 1;
                this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__[6] = 0;
                this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__[7] = 0;
                this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__[8] = 0;
                this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__[9] = 0;
                this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__[10] = 1;
                this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__[11] = 0;
                this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__[12] = 847.950012;
                this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__[13] = 432;
                this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__[14] = 656;
                this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__[15] = 1;
                this.____motion_WeaponCategoryContainerGamePad3af1_matArray__.push(new Matrix3D(this.____motion_WeaponCategoryContainerGamePad3af1_mat3DVec__));
                this.__motion_WeaponCategoryContainerGamePad3af1.addPropertyArray("matrix3D",this.____motion_WeaponCategoryContainerGamePad3af1_matArray__);
                this.__animArray_WeaponCategoryContainerGamePad3af1.push(this.__motion_WeaponCategoryContainerGamePad3af1);
                this.__animFactory_WeaponCategoryContainerGamePad3af1 = new AnimatorFactory3D(null,this.__animArray_WeaponCategoryContainerGamePad3af1);
                this.__animFactory_WeaponCategoryContainerGamePad3af1.addTargetInfo(this,"WeaponCategoryContainerGamePad3",0,true,0,true,null,-1);
            }
            if(this.__animFactory_WeaponCategoryContainerGamePad2af1 == null)
            {
                this.__animArray_WeaponCategoryContainerGamePad2af1 = new Array();
                this.__motion_WeaponCategoryContainerGamePad2af1 = new MotionBase();
                this.__motion_WeaponCategoryContainerGamePad2af1.duration = 1;
                this.__motion_WeaponCategoryContainerGamePad2af1.overrideTargetTransform();
                this.__motion_WeaponCategoryContainerGamePad2af1.addPropertyArray("blendMode",["normal"]);
                this.__motion_WeaponCategoryContainerGamePad2af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_WeaponCategoryContainerGamePad2af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_WeaponCategoryContainerGamePad2af1.addPropertyArray("visible",[true]);
                this.__motion_WeaponCategoryContainerGamePad2af1.is3D = true;
                this.__motion_WeaponCategoryContainerGamePad2af1.motion_internal::spanStart = 1;
                this.____motion_WeaponCategoryContainerGamePad2af1_matArray__ = new Array();
                this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__[0] = 1;
                this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__[1] = 0;
                this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__[2] = 0;
                this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__[3] = 0;
                this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__[4] = 0;
                this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__[5] = 1;
                this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__[6] = 0;
                this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__[7] = 0;
                this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__[8] = 0;
                this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__[9] = 0;
                this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__[10] = 1;
                this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__[11] = 0;
                this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__[12] = 848;
                this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__[13] = 648;
                this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__[14] = 656;
                this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__[15] = 1;
                this.____motion_WeaponCategoryContainerGamePad2af1_matArray__.push(new Matrix3D(this.____motion_WeaponCategoryContainerGamePad2af1_mat3DVec__));
                this.__motion_WeaponCategoryContainerGamePad2af1.addPropertyArray("matrix3D",this.____motion_WeaponCategoryContainerGamePad2af1_matArray__);
                this.__animArray_WeaponCategoryContainerGamePad2af1.push(this.__motion_WeaponCategoryContainerGamePad2af1);
                this.__animFactory_WeaponCategoryContainerGamePad2af1 = new AnimatorFactory3D(null,this.__animArray_WeaponCategoryContainerGamePad2af1);
                this.__animFactory_WeaponCategoryContainerGamePad2af1.addTargetInfo(this,"WeaponCategoryContainerGamePad2",0,true,0,true,null,-1);
            }
            if(this.__animFactory_WeaponCategoryContainerGamePad1af1 == null)
            {
                this.__animArray_WeaponCategoryContainerGamePad1af1 = new Array();
                this.__motion_WeaponCategoryContainerGamePad1af1 = new MotionBase();
                this.__motion_WeaponCategoryContainerGamePad1af1.duration = 1;
                this.__motion_WeaponCategoryContainerGamePad1af1.overrideTargetTransform();
                this.__motion_WeaponCategoryContainerGamePad1af1.addPropertyArray("blendMode",["normal"]);
                this.__motion_WeaponCategoryContainerGamePad1af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_WeaponCategoryContainerGamePad1af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_WeaponCategoryContainerGamePad1af1.addPropertyArray("visible",[true]);
                this.__motion_WeaponCategoryContainerGamePad1af1.is3D = true;
                this.__motion_WeaponCategoryContainerGamePad1af1.motion_internal::spanStart = 1;
                this.____motion_WeaponCategoryContainerGamePad1af1_matArray__ = new Array();
                this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__[0] = 0.961262;
                this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__[1] = 0;
                this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__[2] = -0.275637;
                this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__[3] = 0;
                this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__[4] = 0;
                this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__[5] = 1;
                this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__[6] = 0;
                this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__[7] = 0;
                this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__[8] = 0.275637;
                this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__[9] = 0;
                this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__[10] = 0.961262;
                this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__[11] = 0;
                this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__[12] = 1076.821045;
                this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__[13] = 448;
                this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__[14] = 653.074097;
                this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__[15] = 1;
                this.____motion_WeaponCategoryContainerGamePad1af1_matArray__.push(new Matrix3D(this.____motion_WeaponCategoryContainerGamePad1af1_mat3DVec__));
                this.__motion_WeaponCategoryContainerGamePad1af1.addPropertyArray("matrix3D",this.____motion_WeaponCategoryContainerGamePad1af1_matArray__);
                this.__animArray_WeaponCategoryContainerGamePad1af1.push(this.__motion_WeaponCategoryContainerGamePad1af1);
                this.__animFactory_WeaponCategoryContainerGamePad1af1 = new AnimatorFactory3D(null,this.__animArray_WeaponCategoryContainerGamePad1af1);
                this.__animFactory_WeaponCategoryContainerGamePad1af1.addTargetInfo(this,"WeaponCategoryContainerGamePad1",0,true,0,true,null,-1);
            }
            if(this.__animFactory_WeaponCategoryContainerGamePad0af1 == null)
            {
                this.__animArray_WeaponCategoryContainerGamePad0af1 = new Array();
                this.__motion_WeaponCategoryContainerGamePad0af1 = new MotionBase();
                this.__motion_WeaponCategoryContainerGamePad0af1.duration = 1;
                this.__motion_WeaponCategoryContainerGamePad0af1.overrideTargetTransform();
                this.__motion_WeaponCategoryContainerGamePad0af1.addPropertyArray("blendMode",["normal"]);
                this.__motion_WeaponCategoryContainerGamePad0af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_WeaponCategoryContainerGamePad0af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_WeaponCategoryContainerGamePad0af1.addPropertyArray("visible",[true]);
                this.__motion_WeaponCategoryContainerGamePad0af1.is3D = true;
                this.__motion_WeaponCategoryContainerGamePad0af1.motion_internal::spanStart = 1;
                this.____motion_WeaponCategoryContainerGamePad0af1_matArray__ = new Array();
                this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__[0] = 0.961262;
                this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__[1] = 0;
                this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__[2] = 0.275637;
                this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__[3] = 0;
                this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__[4] = 0;
                this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__[5] = 1;
                this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__[6] = 0;
                this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__[7] = 0;
                this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__[8] = -0.275637;
                this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__[9] = 0;
                this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__[10] = 0.961262;
                this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__[11] = 0;
                this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__[12] = 843.178711;
                this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__[13] = 448;
                this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__[14] = 653.074219;
                this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__[15] = 1;
                this.____motion_WeaponCategoryContainerGamePad0af1_matArray__.push(new Matrix3D(this.____motion_WeaponCategoryContainerGamePad0af1_mat3DVec__));
                this.__motion_WeaponCategoryContainerGamePad0af1.addPropertyArray("matrix3D",this.____motion_WeaponCategoryContainerGamePad0af1_matArray__);
                this.__animArray_WeaponCategoryContainerGamePad0af1.push(this.__motion_WeaponCategoryContainerGamePad0af1);
                this.__animFactory_WeaponCategoryContainerGamePad0af1 = new AnimatorFactory3D(null,this.__animArray_WeaponCategoryContainerGamePad0af1);
                this.__animFactory_WeaponCategoryContainerGamePad0af1.addTargetInfo(this,"WeaponCategoryContainerGamePad0",0,true,0,true,null,-1);
            }
            if(this.__animFactory___id0_af1 == null)
            {
                this.__animArray___id0_af1 = new Array();
                this.__motion___id0_af1 = new MotionBase();
                this.__motion___id0_af1.duration = 1;
                this.__motion___id0_af1.overrideTargetTransform();
                this.__motion___id0_af1.addPropertyArray("blendMode",["normal"]);
                this.__motion___id0_af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion___id0_af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion___id0_af1.addPropertyArray("visible",[true]);
                this.__motion___id0_af1.is3D = true;
                this.__motion___id0_af1.motion_internal::spanStart = 1;
                this.____motion___id0_af1_matArray__ = new Array();
                this.____motion___id0_af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion___id0_af1_mat3DVec__[0] = 1;
                this.____motion___id0_af1_mat3DVec__[1] = 0;
                this.____motion___id0_af1_mat3DVec__[2] = 0;
                this.____motion___id0_af1_mat3DVec__[3] = 0;
                this.____motion___id0_af1_mat3DVec__[4] = 0;
                this.____motion___id0_af1_mat3DVec__[5] = 1;
                this.____motion___id0_af1_mat3DVec__[6] = 0;
                this.____motion___id0_af1_mat3DVec__[7] = 0;
                this.____motion___id0_af1_mat3DVec__[8] = 0;
                this.____motion___id0_af1_mat3DVec__[9] = 0;
                this.____motion___id0_af1_mat3DVec__[10] = 1;
                this.____motion___id0_af1_mat3DVec__[11] = 0;
                this.____motion___id0_af1_mat3DVec__[12] = 960;
                this.____motion___id0_af1_mat3DVec__[13] = 540;
                this.____motion___id0_af1_mat3DVec__[14] = 656;
                this.____motion___id0_af1_mat3DVec__[15] = 1;
                this.____motion___id0_af1_matArray__.push(new Matrix3D(this.____motion___id0_af1_mat3DVec__));
                this.__motion___id0_af1.addPropertyArray("matrix3D",this.____motion___id0_af1_matArray__);
                this.__animArray___id0_af1.push(this.__motion___id0_af1);
                this.__animFactory___id0_af1 = new AnimatorFactory3D(null,this.__animArray___id0_af1);
                this.__animFactory___id0_af1.addTargetInfo(this,"__id0_",0,true,0,true,null,-1);
            }
        }
        
        function frame1() : *
        {
            stop();
        }
        
        function frame2() : *
        {
            stop();
        }
    }
}
