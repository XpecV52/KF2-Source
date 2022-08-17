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
    import tripwire.widgets.VoiceCommsWidget;
    
    public dynamic class VoiceCommsWidgetMC extends VoiceCommsWidget
    {
         
        
        public var __animFactory_dragBGaf1:AnimatorFactory3D;
        
        public var __animArray_dragBGaf1:Array;
        
        public var ____motion_dragBGaf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_dragBGaf1_matArray__:Array;
        
        public var __motion_dragBGaf1:MotionBase;
        
        public var __animFactory_ballAaf1:AnimatorFactory3D;
        
        public var __animArray_ballAaf1:Array;
        
        public var ____motion_ballAaf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_ballAaf1_matArray__:Array;
        
        public var __motion_ballAaf1:MotionBase;
        
        public var __animFactory_ItemBound7af1:AnimatorFactory3D;
        
        public var __animArray_ItemBound7af1:Array;
        
        public var ____motion_ItemBound7af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_ItemBound7af1_matArray__:Array;
        
        public var __motion_ItemBound7af1:MotionBase;
        
        public var __animFactory_ItemBound6af1:AnimatorFactory3D;
        
        public var __animArray_ItemBound6af1:Array;
        
        public var ____motion_ItemBound6af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_ItemBound6af1_matArray__:Array;
        
        public var __motion_ItemBound6af1:MotionBase;
        
        public var __animFactory_ItemBound4af1:AnimatorFactory3D;
        
        public var __animArray_ItemBound4af1:Array;
        
        public var ____motion_ItemBound4af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_ItemBound4af1_matArray__:Array;
        
        public var __motion_ItemBound4af1:MotionBase;
        
        public var __animFactory_ItemBound5af1:AnimatorFactory3D;
        
        public var __animArray_ItemBound5af1:Array;
        
        public var ____motion_ItemBound5af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_ItemBound5af1_matArray__:Array;
        
        public var __motion_ItemBound5af1:MotionBase;
        
        public var __animFactory_ItemBound3af1:AnimatorFactory3D;
        
        public var __animArray_ItemBound3af1:Array;
        
        public var ____motion_ItemBound3af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_ItemBound3af1_matArray__:Array;
        
        public var __motion_ItemBound3af1:MotionBase;
        
        public var __animFactory_ItemBound2af1:AnimatorFactory3D;
        
        public var __animArray_ItemBound2af1:Array;
        
        public var ____motion_ItemBound2af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_ItemBound2af1_matArray__:Array;
        
        public var __motion_ItemBound2af1:MotionBase;
        
        public var __animFactory_ItemBound0af1:AnimatorFactory3D;
        
        public var __animArray_ItemBound0af1:Array;
        
        public var ____motion_ItemBound0af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_ItemBound0af1_matArray__:Array;
        
        public var __motion_ItemBound0af1:MotionBase;
        
        public var __animFactory_ItemBound1af1:AnimatorFactory3D;
        
        public var __animArray_ItemBound1af1:Array;
        
        public var ____motion_ItemBound1af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_ItemBound1af1_matArray__:Array;
        
        public var __motion_ItemBound1af1:MotionBase;
        
        public var __animFactory_Item7af1:AnimatorFactory3D;
        
        public var __animArray_Item7af1:Array;
        
        public var ____motion_Item7af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_Item7af1_matArray__:Array;
        
        public var __motion_Item7af1:MotionBase;
        
        public var __animFactory_Item6af1:AnimatorFactory3D;
        
        public var __animArray_Item6af1:Array;
        
        public var ____motion_Item6af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_Item6af1_matArray__:Array;
        
        public var __motion_Item6af1:MotionBase;
        
        public var __animFactory_Item5af1:AnimatorFactory3D;
        
        public var __animArray_Item5af1:Array;
        
        public var ____motion_Item5af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_Item5af1_matArray__:Array;
        
        public var __motion_Item5af1:MotionBase;
        
        public var __animFactory_Item4af1:AnimatorFactory3D;
        
        public var __animArray_Item4af1:Array;
        
        public var ____motion_Item4af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_Item4af1_matArray__:Array;
        
        public var __motion_Item4af1:MotionBase;
        
        public var __animFactory_Item3af1:AnimatorFactory3D;
        
        public var __animArray_Item3af1:Array;
        
        public var ____motion_Item3af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_Item3af1_matArray__:Array;
        
        public var __motion_Item3af1:MotionBase;
        
        public var __animFactory_Item2af1:AnimatorFactory3D;
        
        public var __animArray_Item2af1:Array;
        
        public var ____motion_Item2af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_Item2af1_matArray__:Array;
        
        public var __motion_Item2af1:MotionBase;
        
        public var __animFactory_Item1af1:AnimatorFactory3D;
        
        public var __animArray_Item1af1:Array;
        
        public var ____motion_Item1af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_Item1af1_matArray__:Array;
        
        public var __motion_Item1af1:MotionBase;
        
        public var __animFactory_Item0af1:AnimatorFactory3D;
        
        public var __animArray_Item0af1:Array;
        
        public var ____motion_Item0af1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_Item0af1_matArray__:Array;
        
        public var __motion_Item0af1:MotionBase;
        
        public function VoiceCommsWidgetMC()
        {
            super();
            if(this.__animFactory_dragBGaf1 == null)
            {
                this.__animArray_dragBGaf1 = new Array();
                this.__motion_dragBGaf1 = new MotionBase();
                this.__motion_dragBGaf1.duration = 1;
                this.__motion_dragBGaf1.overrideTargetTransform();
                this.__motion_dragBGaf1.addPropertyArray("blendMode",["normal"]);
                this.__motion_dragBGaf1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_dragBGaf1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_dragBGaf1.addPropertyArray("visible",[true]);
                this.__motion_dragBGaf1.is3D = true;
                this.__motion_dragBGaf1.motion_internal::spanStart = 0;
                this.____motion_dragBGaf1_matArray__ = new Array();
                this.____motion_dragBGaf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_dragBGaf1_mat3DVec__[0] = 0.480011;
                this.____motion_dragBGaf1_mat3DVec__[1] = 0;
                this.____motion_dragBGaf1_mat3DVec__[2] = 0;
                this.____motion_dragBGaf1_mat3DVec__[3] = 0;
                this.____motion_dragBGaf1_mat3DVec__[4] = 0;
                this.____motion_dragBGaf1_mat3DVec__[5] = 1.199951;
                this.____motion_dragBGaf1_mat3DVec__[6] = 0;
                this.____motion_dragBGaf1_mat3DVec__[7] = 0;
                this.____motion_dragBGaf1_mat3DVec__[8] = 0;
                this.____motion_dragBGaf1_mat3DVec__[9] = 0;
                this.____motion_dragBGaf1_mat3DVec__[10] = 1;
                this.____motion_dragBGaf1_mat3DVec__[11] = 0;
                this.____motion_dragBGaf1_mat3DVec__[12] = 416;
                this.____motion_dragBGaf1_mat3DVec__[13] = 72;
                this.____motion_dragBGaf1_mat3DVec__[14] = 0;
                this.____motion_dragBGaf1_mat3DVec__[15] = 1;
                this.____motion_dragBGaf1_matArray__.push(new Matrix3D(this.____motion_dragBGaf1_mat3DVec__));
                this.__motion_dragBGaf1.addPropertyArray("matrix3D",this.____motion_dragBGaf1_matArray__);
                this.__animArray_dragBGaf1.push(this.__motion_dragBGaf1);
                this.__animFactory_dragBGaf1 = new AnimatorFactory3D(null,this.__animArray_dragBGaf1);
                this.__animFactory_dragBGaf1.addTargetInfo(this,"dragBG",0,true,0,true,null,-1);
            }
            if(this.__animFactory_ballAaf1 == null)
            {
                this.__animArray_ballAaf1 = new Array();
                this.__motion_ballAaf1 = new MotionBase();
                this.__motion_ballAaf1.duration = 1;
                this.__motion_ballAaf1.overrideTargetTransform();
                this.__motion_ballAaf1.addPropertyArray("blendMode",["normal"]);
                this.__motion_ballAaf1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_ballAaf1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_ballAaf1.addPropertyArray("visible",[true]);
                this.__motion_ballAaf1.initFilters(["flash.filters.BlurFilter"],[0],0,1);
                this.__motion_ballAaf1.addFilterPropertyArray(0,"blurX",[3],0,1);
                this.__motion_ballAaf1.addFilterPropertyArray(0,"blurY",[3],0,1);
                this.__motion_ballAaf1.addFilterPropertyArray(0,"quality",[1],0,1);
                this.__motion_ballAaf1.is3D = true;
                this.__motion_ballAaf1.motion_internal::spanStart = 0;
                this.____motion_ballAaf1_matArray__ = new Array();
                this.____motion_ballAaf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_ballAaf1_mat3DVec__[0] = 1;
                this.____motion_ballAaf1_mat3DVec__[1] = 0;
                this.____motion_ballAaf1_mat3DVec__[2] = 0;
                this.____motion_ballAaf1_mat3DVec__[3] = 0;
                this.____motion_ballAaf1_mat3DVec__[4] = 0;
                this.____motion_ballAaf1_mat3DVec__[5] = 1;
                this.____motion_ballAaf1_mat3DVec__[6] = 0;
                this.____motion_ballAaf1_mat3DVec__[7] = 0;
                this.____motion_ballAaf1_mat3DVec__[8] = 0;
                this.____motion_ballAaf1_mat3DVec__[9] = 0;
                this.____motion_ballAaf1_mat3DVec__[10] = 1;
                this.____motion_ballAaf1_mat3DVec__[11] = 0;
                this.____motion_ballAaf1_mat3DVec__[12] = 498.350006;
                this.____motion_ballAaf1_mat3DVec__[13] = 152;
                this.____motion_ballAaf1_mat3DVec__[14] = 0;
                this.____motion_ballAaf1_mat3DVec__[15] = 1;
                this.____motion_ballAaf1_matArray__.push(new Matrix3D(this.____motion_ballAaf1_mat3DVec__));
                this.__motion_ballAaf1.addPropertyArray("matrix3D",this.____motion_ballAaf1_matArray__);
                this.__animArray_ballAaf1.push(this.__motion_ballAaf1);
                this.__animFactory_ballAaf1 = new AnimatorFactory3D(null,this.__animArray_ballAaf1);
                this.__animFactory_ballAaf1.addTargetInfo(this,"ballA",0,true,0,true,null,-1);
            }
            if(this.__animFactory_ItemBound7af1 == null)
            {
                this.__animArray_ItemBound7af1 = new Array();
                this.__motion_ItemBound7af1 = new MotionBase();
                this.__motion_ItemBound7af1.duration = 1;
                this.__motion_ItemBound7af1.overrideTargetTransform();
                this.__motion_ItemBound7af1.addPropertyArray("blendMode",["normal"]);
                this.__motion_ItemBound7af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_ItemBound7af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_ItemBound7af1.addPropertyArray("visible",[true]);
                this.__motion_ItemBound7af1.is3D = true;
                this.__motion_ItemBound7af1.motion_internal::spanStart = 0;
                this.____motion_ItemBound7af1_matArray__ = new Array();
                this.____motion_ItemBound7af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_ItemBound7af1_mat3DVec__[0] = 1;
                this.____motion_ItemBound7af1_mat3DVec__[1] = 0;
                this.____motion_ItemBound7af1_mat3DVec__[2] = 0;
                this.____motion_ItemBound7af1_mat3DVec__[3] = 0;
                this.____motion_ItemBound7af1_mat3DVec__[4] = 0;
                this.____motion_ItemBound7af1_mat3DVec__[5] = 0.833344;
                this.____motion_ItemBound7af1_mat3DVec__[6] = 0;
                this.____motion_ItemBound7af1_mat3DVec__[7] = 0;
                this.____motion_ItemBound7af1_mat3DVec__[8] = 0;
                this.____motion_ItemBound7af1_mat3DVec__[9] = 0;
                this.____motion_ItemBound7af1_mat3DVec__[10] = 1;
                this.____motion_ItemBound7af1_mat3DVec__[11] = 0;
                this.____motion_ItemBound7af1_mat3DVec__[12] = 512.25;
                this.____motion_ItemBound7af1_mat3DVec__[13] = 184;
                this.____motion_ItemBound7af1_mat3DVec__[14] = 0;
                this.____motion_ItemBound7af1_mat3DVec__[15] = 1;
                this.____motion_ItemBound7af1_matArray__.push(new Matrix3D(this.____motion_ItemBound7af1_mat3DVec__));
                this.__motion_ItemBound7af1.addPropertyArray("matrix3D",this.____motion_ItemBound7af1_matArray__);
                this.__animArray_ItemBound7af1.push(this.__motion_ItemBound7af1);
                this.__animFactory_ItemBound7af1 = new AnimatorFactory3D(null,this.__animArray_ItemBound7af1);
                this.__animFactory_ItemBound7af1.addTargetInfo(this,"ItemBound7",0,true,0,true,null,-1);
            }
            if(this.__animFactory_ItemBound6af1 == null)
            {
                this.__animArray_ItemBound6af1 = new Array();
                this.__motion_ItemBound6af1 = new MotionBase();
                this.__motion_ItemBound6af1.duration = 1;
                this.__motion_ItemBound6af1.overrideTargetTransform();
                this.__motion_ItemBound6af1.addPropertyArray("blendMode",["normal"]);
                this.__motion_ItemBound6af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_ItemBound6af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_ItemBound6af1.addPropertyArray("visible",[true]);
                this.__motion_ItemBound6af1.is3D = true;
                this.__motion_ItemBound6af1.motion_internal::spanStart = 0;
                this.____motion_ItemBound6af1_matArray__ = new Array();
                this.____motion_ItemBound6af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_ItemBound6af1_mat3DVec__[0] = 1;
                this.____motion_ItemBound6af1_mat3DVec__[1] = 0;
                this.____motion_ItemBound6af1_mat3DVec__[2] = 0;
                this.____motion_ItemBound6af1_mat3DVec__[3] = 0;
                this.____motion_ItemBound6af1_mat3DVec__[4] = 0;
                this.____motion_ItemBound6af1_mat3DVec__[5] = 0.1875;
                this.____motion_ItemBound6af1_mat3DVec__[6] = 0;
                this.____motion_ItemBound6af1_mat3DVec__[7] = 0;
                this.____motion_ItemBound6af1_mat3DVec__[8] = 0;
                this.____motion_ItemBound6af1_mat3DVec__[9] = 0;
                this.____motion_ItemBound6af1_mat3DVec__[10] = 1;
                this.____motion_ItemBound6af1_mat3DVec__[11] = 0;
                this.____motion_ItemBound6af1_mat3DVec__[12] = 520;
                this.____motion_ItemBound6af1_mat3DVec__[13] = 168;
                this.____motion_ItemBound6af1_mat3DVec__[14] = 0;
                this.____motion_ItemBound6af1_mat3DVec__[15] = 1;
                this.____motion_ItemBound6af1_matArray__.push(new Matrix3D(this.____motion_ItemBound6af1_mat3DVec__));
                this.__motion_ItemBound6af1.addPropertyArray("matrix3D",this.____motion_ItemBound6af1_matArray__);
                this.__animArray_ItemBound6af1.push(this.__motion_ItemBound6af1);
                this.__animFactory_ItemBound6af1 = new AnimatorFactory3D(null,this.__animArray_ItemBound6af1);
                this.__animFactory_ItemBound6af1.addTargetInfo(this,"ItemBound6",0,true,0,true,null,-1);
            }
            if(this.__animFactory_ItemBound4af1 == null)
            {
                this.__animArray_ItemBound4af1 = new Array();
                this.__motion_ItemBound4af1 = new MotionBase();
                this.__motion_ItemBound4af1.duration = 1;
                this.__motion_ItemBound4af1.overrideTargetTransform();
                this.__motion_ItemBound4af1.addPropertyArray("blendMode",["normal"]);
                this.__motion_ItemBound4af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_ItemBound4af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_ItemBound4af1.addPropertyArray("visible",[true]);
                this.__motion_ItemBound4af1.is3D = true;
                this.__motion_ItemBound4af1.motion_internal::spanStart = 0;
                this.____motion_ItemBound4af1_matArray__ = new Array();
                this.____motion_ItemBound4af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_ItemBound4af1_mat3DVec__[0] = 1;
                this.____motion_ItemBound4af1_mat3DVec__[1] = 0;
                this.____motion_ItemBound4af1_mat3DVec__[2] = 0;
                this.____motion_ItemBound4af1_mat3DVec__[3] = 0;
                this.____motion_ItemBound4af1_mat3DVec__[4] = 0;
                this.____motion_ItemBound4af1_mat3DVec__[5] = 0.833344;
                this.____motion_ItemBound4af1_mat3DVec__[6] = 0;
                this.____motion_ItemBound4af1_mat3DVec__[7] = 0;
                this.____motion_ItemBound4af1_mat3DVec__[8] = 0;
                this.____motion_ItemBound4af1_mat3DVec__[9] = 0;
                this.____motion_ItemBound4af1_mat3DVec__[10] = 1;
                this.____motion_ItemBound4af1_mat3DVec__[11] = 0;
                this.____motion_ItemBound4af1_mat3DVec__[12] = 512;
                this.____motion_ItemBound4af1_mat3DVec__[13] = 72;
                this.____motion_ItemBound4af1_mat3DVec__[14] = 0;
                this.____motion_ItemBound4af1_mat3DVec__[15] = 1;
                this.____motion_ItemBound4af1_matArray__.push(new Matrix3D(this.____motion_ItemBound4af1_mat3DVec__));
                this.__motion_ItemBound4af1.addPropertyArray("matrix3D",this.____motion_ItemBound4af1_matArray__);
                this.__animArray_ItemBound4af1.push(this.__motion_ItemBound4af1);
                this.__animFactory_ItemBound4af1 = new AnimatorFactory3D(null,this.__animArray_ItemBound4af1);
                this.__animFactory_ItemBound4af1.addTargetInfo(this,"ItemBound4",0,true,0,true,null,-1);
            }
            if(this.__animFactory_ItemBound5af1 == null)
            {
                this.__animArray_ItemBound5af1 = new Array();
                this.__motion_ItemBound5af1 = new MotionBase();
                this.__motion_ItemBound5af1.duration = 1;
                this.__motion_ItemBound5af1.overrideTargetTransform();
                this.__motion_ItemBound5af1.addPropertyArray("blendMode",["normal"]);
                this.__motion_ItemBound5af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_ItemBound5af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_ItemBound5af1.addPropertyArray("visible",[true]);
                this.__motion_ItemBound5af1.is3D = true;
                this.__motion_ItemBound5af1.motion_internal::spanStart = 0;
                this.____motion_ItemBound5af1_matArray__ = new Array();
                this.____motion_ItemBound5af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_ItemBound5af1_mat3DVec__[0] = 1;
                this.____motion_ItemBound5af1_mat3DVec__[1] = 0;
                this.____motion_ItemBound5af1_mat3DVec__[2] = 0;
                this.____motion_ItemBound5af1_mat3DVec__[3] = 0;
                this.____motion_ItemBound5af1_mat3DVec__[4] = 0;
                this.____motion_ItemBound5af1_mat3DVec__[5] = 0.1875;
                this.____motion_ItemBound5af1_mat3DVec__[6] = 0;
                this.____motion_ItemBound5af1_mat3DVec__[7] = 0;
                this.____motion_ItemBound5af1_mat3DVec__[8] = 0;
                this.____motion_ItemBound5af1_mat3DVec__[9] = 0;
                this.____motion_ItemBound5af1_mat3DVec__[10] = 1;
                this.____motion_ItemBound5af1_mat3DVec__[11] = 0;
                this.____motion_ItemBound5af1_mat3DVec__[12] = 520;
                this.____motion_ItemBound5af1_mat3DVec__[13] = 150;
                this.____motion_ItemBound5af1_mat3DVec__[14] = 0;
                this.____motion_ItemBound5af1_mat3DVec__[15] = 1;
                this.____motion_ItemBound5af1_matArray__.push(new Matrix3D(this.____motion_ItemBound5af1_mat3DVec__));
                this.__motion_ItemBound5af1.addPropertyArray("matrix3D",this.____motion_ItemBound5af1_matArray__);
                this.__animArray_ItemBound5af1.push(this.__motion_ItemBound5af1);
                this.__animFactory_ItemBound5af1 = new AnimatorFactory3D(null,this.__animArray_ItemBound5af1);
                this.__animFactory_ItemBound5af1.addTargetInfo(this,"ItemBound5",0,true,0,true,null,-1);
            }
            if(this.__animFactory_ItemBound3af1 == null)
            {
                this.__animArray_ItemBound3af1 = new Array();
                this.__motion_ItemBound3af1 = new MotionBase();
                this.__motion_ItemBound3af1.duration = 1;
                this.__motion_ItemBound3af1.overrideTargetTransform();
                this.__motion_ItemBound3af1.addPropertyArray("blendMode",["normal"]);
                this.__motion_ItemBound3af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_ItemBound3af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_ItemBound3af1.addPropertyArray("visible",[true]);
                this.__motion_ItemBound3af1.is3D = true;
                this.__motion_ItemBound3af1.motion_internal::spanStart = 0;
                this.____motion_ItemBound3af1_matArray__ = new Array();
                this.____motion_ItemBound3af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_ItemBound3af1_mat3DVec__[0] = 1;
                this.____motion_ItemBound3af1_mat3DVec__[1] = 0;
                this.____motion_ItemBound3af1_mat3DVec__[2] = 0;
                this.____motion_ItemBound3af1_mat3DVec__[3] = 0;
                this.____motion_ItemBound3af1_mat3DVec__[4] = 0;
                this.____motion_ItemBound3af1_mat3DVec__[5] = 0.833344;
                this.____motion_ItemBound3af1_mat3DVec__[6] = 0;
                this.____motion_ItemBound3af1_mat3DVec__[7] = 0;
                this.____motion_ItemBound3af1_mat3DVec__[8] = 0;
                this.____motion_ItemBound3af1_mat3DVec__[9] = 0;
                this.____motion_ItemBound3af1_mat3DVec__[10] = 1;
                this.____motion_ItemBound3af1_mat3DVec__[11] = 0;
                this.____motion_ItemBound3af1_mat3DVec__[12] = 0;
                this.____motion_ItemBound3af1_mat3DVec__[13] = 184;
                this.____motion_ItemBound3af1_mat3DVec__[14] = 0;
                this.____motion_ItemBound3af1_mat3DVec__[15] = 1;
                this.____motion_ItemBound3af1_matArray__.push(new Matrix3D(this.____motion_ItemBound3af1_mat3DVec__));
                this.__motion_ItemBound3af1.addPropertyArray("matrix3D",this.____motion_ItemBound3af1_matArray__);
                this.__animArray_ItemBound3af1.push(this.__motion_ItemBound3af1);
                this.__animFactory_ItemBound3af1 = new AnimatorFactory3D(null,this.__animArray_ItemBound3af1);
                this.__animFactory_ItemBound3af1.addTargetInfo(this,"ItemBound3",0,true,0,true,null,-1);
            }
            if(this.__animFactory_ItemBound2af1 == null)
            {
                this.__animArray_ItemBound2af1 = new Array();
                this.__motion_ItemBound2af1 = new MotionBase();
                this.__motion_ItemBound2af1.duration = 1;
                this.__motion_ItemBound2af1.overrideTargetTransform();
                this.__motion_ItemBound2af1.addPropertyArray("blendMode",["normal"]);
                this.__motion_ItemBound2af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_ItemBound2af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_ItemBound2af1.addPropertyArray("visible",[true]);
                this.__motion_ItemBound2af1.is3D = true;
                this.__motion_ItemBound2af1.motion_internal::spanStart = 0;
                this.____motion_ItemBound2af1_matArray__ = new Array();
                this.____motion_ItemBound2af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_ItemBound2af1_mat3DVec__[0] = 1;
                this.____motion_ItemBound2af1_mat3DVec__[1] = 0;
                this.____motion_ItemBound2af1_mat3DVec__[2] = 0;
                this.____motion_ItemBound2af1_mat3DVec__[3] = 0;
                this.____motion_ItemBound2af1_mat3DVec__[4] = 0;
                this.____motion_ItemBound2af1_mat3DVec__[5] = 0.1875;
                this.____motion_ItemBound2af1_mat3DVec__[6] = 0;
                this.____motion_ItemBound2af1_mat3DVec__[7] = 0;
                this.____motion_ItemBound2af1_mat3DVec__[8] = 0;
                this.____motion_ItemBound2af1_mat3DVec__[9] = 0;
                this.____motion_ItemBound2af1_mat3DVec__[10] = 1;
                this.____motion_ItemBound2af1_mat3DVec__[11] = 0;
                this.____motion_ItemBound2af1_mat3DVec__[12] = -8;
                this.____motion_ItemBound2af1_mat3DVec__[13] = 168;
                this.____motion_ItemBound2af1_mat3DVec__[14] = 0;
                this.____motion_ItemBound2af1_mat3DVec__[15] = 1;
                this.____motion_ItemBound2af1_matArray__.push(new Matrix3D(this.____motion_ItemBound2af1_mat3DVec__));
                this.__motion_ItemBound2af1.addPropertyArray("matrix3D",this.____motion_ItemBound2af1_matArray__);
                this.__animArray_ItemBound2af1.push(this.__motion_ItemBound2af1);
                this.__animFactory_ItemBound2af1 = new AnimatorFactory3D(null,this.__animArray_ItemBound2af1);
                this.__animFactory_ItemBound2af1.addTargetInfo(this,"ItemBound2",0,true,0,true,null,-1);
            }
            if(this.__animFactory_ItemBound0af1 == null)
            {
                this.__animArray_ItemBound0af1 = new Array();
                this.__motion_ItemBound0af1 = new MotionBase();
                this.__motion_ItemBound0af1.duration = 1;
                this.__motion_ItemBound0af1.overrideTargetTransform();
                this.__motion_ItemBound0af1.addPropertyArray("blendMode",["normal"]);
                this.__motion_ItemBound0af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_ItemBound0af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_ItemBound0af1.addPropertyArray("visible",[true]);
                this.__motion_ItemBound0af1.is3D = true;
                this.__motion_ItemBound0af1.motion_internal::spanStart = 0;
                this.____motion_ItemBound0af1_matArray__ = new Array();
                this.____motion_ItemBound0af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_ItemBound0af1_mat3DVec__[0] = 1;
                this.____motion_ItemBound0af1_mat3DVec__[1] = 0;
                this.____motion_ItemBound0af1_mat3DVec__[2] = 0;
                this.____motion_ItemBound0af1_mat3DVec__[3] = 0;
                this.____motion_ItemBound0af1_mat3DVec__[4] = 0;
                this.____motion_ItemBound0af1_mat3DVec__[5] = 0.833344;
                this.____motion_ItemBound0af1_mat3DVec__[6] = 0;
                this.____motion_ItemBound0af1_mat3DVec__[7] = 0;
                this.____motion_ItemBound0af1_mat3DVec__[8] = 0;
                this.____motion_ItemBound0af1_mat3DVec__[9] = 0;
                this.____motion_ItemBound0af1_mat3DVec__[10] = 1;
                this.____motion_ItemBound0af1_mat3DVec__[11] = 0;
                this.____motion_ItemBound0af1_mat3DVec__[12] = 0;
                this.____motion_ItemBound0af1_mat3DVec__[13] = 72;
                this.____motion_ItemBound0af1_mat3DVec__[14] = 0;
                this.____motion_ItemBound0af1_mat3DVec__[15] = 1;
                this.____motion_ItemBound0af1_matArray__.push(new Matrix3D(this.____motion_ItemBound0af1_mat3DVec__));
                this.__motion_ItemBound0af1.addPropertyArray("matrix3D",this.____motion_ItemBound0af1_matArray__);
                this.__animArray_ItemBound0af1.push(this.__motion_ItemBound0af1);
                this.__animFactory_ItemBound0af1 = new AnimatorFactory3D(null,this.__animArray_ItemBound0af1);
                this.__animFactory_ItemBound0af1.addTargetInfo(this,"ItemBound0",0,true,0,true,null,-1);
            }
            if(this.__animFactory_ItemBound1af1 == null)
            {
                this.__animArray_ItemBound1af1 = new Array();
                this.__motion_ItemBound1af1 = new MotionBase();
                this.__motion_ItemBound1af1.duration = 1;
                this.__motion_ItemBound1af1.overrideTargetTransform();
                this.__motion_ItemBound1af1.addPropertyArray("blendMode",["normal"]);
                this.__motion_ItemBound1af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_ItemBound1af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_ItemBound1af1.addPropertyArray("visible",[true]);
                this.__motion_ItemBound1af1.is3D = true;
                this.__motion_ItemBound1af1.motion_internal::spanStart = 0;
                this.____motion_ItemBound1af1_matArray__ = new Array();
                this.____motion_ItemBound1af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_ItemBound1af1_mat3DVec__[0] = 1;
                this.____motion_ItemBound1af1_mat3DVec__[1] = 0;
                this.____motion_ItemBound1af1_mat3DVec__[2] = 0;
                this.____motion_ItemBound1af1_mat3DVec__[3] = 0;
                this.____motion_ItemBound1af1_mat3DVec__[4] = 0;
                this.____motion_ItemBound1af1_mat3DVec__[5] = 0.1875;
                this.____motion_ItemBound1af1_mat3DVec__[6] = 0;
                this.____motion_ItemBound1af1_mat3DVec__[7] = 0;
                this.____motion_ItemBound1af1_mat3DVec__[8] = 0;
                this.____motion_ItemBound1af1_mat3DVec__[9] = 0;
                this.____motion_ItemBound1af1_mat3DVec__[10] = 1;
                this.____motion_ItemBound1af1_mat3DVec__[11] = 0;
                this.____motion_ItemBound1af1_mat3DVec__[12] = -8;
                this.____motion_ItemBound1af1_mat3DVec__[13] = 150;
                this.____motion_ItemBound1af1_mat3DVec__[14] = 0;
                this.____motion_ItemBound1af1_mat3DVec__[15] = 1;
                this.____motion_ItemBound1af1_matArray__.push(new Matrix3D(this.____motion_ItemBound1af1_mat3DVec__));
                this.__motion_ItemBound1af1.addPropertyArray("matrix3D",this.____motion_ItemBound1af1_matArray__);
                this.__animArray_ItemBound1af1.push(this.__motion_ItemBound1af1);
                this.__animFactory_ItemBound1af1 = new AnimatorFactory3D(null,this.__animArray_ItemBound1af1);
                this.__animFactory_ItemBound1af1.addTargetInfo(this,"ItemBound1",0,true,0,true,null,-1);
            }
            if(this.__animFactory_Item7af1 == null)
            {
                this.__animArray_Item7af1 = new Array();
                this.__motion_Item7af1 = new MotionBase();
                this.__motion_Item7af1.duration = 1;
                this.__motion_Item7af1.overrideTargetTransform();
                this.__motion_Item7af1.addPropertyArray("blendMode",["layer"]);
                this.__motion_Item7af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_Item7af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_Item7af1.addPropertyArray("visible",[true]);
                this.__motion_Item7af1.is3D = true;
                this.__motion_Item7af1.motion_internal::spanStart = 0;
                this.____motion_Item7af1_matArray__ = new Array();
                this.____motion_Item7af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_Item7af1_mat3DVec__[0] = 0.961262;
                this.____motion_Item7af1_mat3DVec__[1] = 0;
                this.____motion_Item7af1_mat3DVec__[2] = -0.275637;
                this.____motion_Item7af1_mat3DVec__[3] = 0;
                this.____motion_Item7af1_mat3DVec__[4] = 0;
                this.____motion_Item7af1_mat3DVec__[5] = 1;
                this.____motion_Item7af1_mat3DVec__[6] = 0;
                this.____motion_Item7af1_mat3DVec__[7] = 0;
                this.____motion_Item7af1_mat3DVec__[8] = 0.275637;
                this.____motion_Item7af1_mat3DVec__[9] = 0;
                this.____motion_Item7af1_mat3DVec__[10] = 0.961262;
                this.____motion_Item7af1_mat3DVec__[11] = 0;
                this.____motion_Item7af1_mat3DVec__[12] = 559.4953;
                this.____motion_Item7af1_mat3DVec__[13] = 264;
                this.____motion_Item7af1_mat3DVec__[14] = 110.254944;
                this.____motion_Item7af1_mat3DVec__[15] = 1;
                this.____motion_Item7af1_matArray__.push(new Matrix3D(this.____motion_Item7af1_mat3DVec__));
                this.__motion_Item7af1.addPropertyArray("matrix3D",this.____motion_Item7af1_matArray__);
                this.__animArray_Item7af1.push(this.__motion_Item7af1);
                this.__animFactory_Item7af1 = new AnimatorFactory3D(null,this.__animArray_Item7af1);
                this.__animFactory_Item7af1.addTargetInfo(this,"Item7",0,true,0,true,null,-1);
            }
            if(this.__animFactory_Item6af1 == null)
            {
                this.__animArray_Item6af1 = new Array();
                this.__motion_Item6af1 = new MotionBase();
                this.__motion_Item6af1.duration = 1;
                this.__motion_Item6af1.overrideTargetTransform();
                this.__motion_Item6af1.addPropertyArray("blendMode",["layer"]);
                this.__motion_Item6af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_Item6af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_Item6af1.addPropertyArray("visible",[true]);
                this.__motion_Item6af1.is3D = true;
                this.__motion_Item6af1.motion_internal::spanStart = 0;
                this.____motion_Item6af1_matArray__ = new Array();
                this.____motion_Item6af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_Item6af1_mat3DVec__[0] = 0.961262;
                this.____motion_Item6af1_mat3DVec__[1] = 0;
                this.____motion_Item6af1_mat3DVec__[2] = -0.275637;
                this.____motion_Item6af1_mat3DVec__[3] = 0;
                this.____motion_Item6af1_mat3DVec__[4] = 0;
                this.____motion_Item6af1_mat3DVec__[5] = 1;
                this.____motion_Item6af1_mat3DVec__[6] = 0;
                this.____motion_Item6af1_mat3DVec__[7] = 0;
                this.____motion_Item6af1_mat3DVec__[8] = 0.275637;
                this.____motion_Item6af1_mat3DVec__[9] = 0;
                this.____motion_Item6af1_mat3DVec__[10] = 0.961262;
                this.____motion_Item6af1_mat3DVec__[11] = 0;
                this.____motion_Item6af1_mat3DVec__[12] = 607.495361;
                this.____motion_Item6af1_mat3DVec__[13] = 184;
                this.____motion_Item6af1_mat3DVec__[14] = 110.254944;
                this.____motion_Item6af1_mat3DVec__[15] = 1;
                this.____motion_Item6af1_matArray__.push(new Matrix3D(this.____motion_Item6af1_mat3DVec__));
                this.__motion_Item6af1.addPropertyArray("matrix3D",this.____motion_Item6af1_matArray__);
                this.__animArray_Item6af1.push(this.__motion_Item6af1);
                this.__animFactory_Item6af1 = new AnimatorFactory3D(null,this.__animArray_Item6af1);
                this.__animFactory_Item6af1.addTargetInfo(this,"Item6",0,true,0,true,null,-1);
            }
            if(this.__animFactory_Item5af1 == null)
            {
                this.__animArray_Item5af1 = new Array();
                this.__motion_Item5af1 = new MotionBase();
                this.__motion_Item5af1.duration = 1;
                this.__motion_Item5af1.overrideTargetTransform();
                this.__motion_Item5af1.addPropertyArray("blendMode",["layer"]);
                this.__motion_Item5af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_Item5af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_Item5af1.addPropertyArray("visible",[true]);
                this.__motion_Item5af1.is3D = true;
                this.__motion_Item5af1.motion_internal::spanStart = 0;
                this.____motion_Item5af1_matArray__ = new Array();
                this.____motion_Item5af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_Item5af1_mat3DVec__[0] = 0.961262;
                this.____motion_Item5af1_mat3DVec__[1] = 0;
                this.____motion_Item5af1_mat3DVec__[2] = -0.275637;
                this.____motion_Item5af1_mat3DVec__[3] = 0;
                this.____motion_Item5af1_mat3DVec__[4] = 0;
                this.____motion_Item5af1_mat3DVec__[5] = 1;
                this.____motion_Item5af1_mat3DVec__[6] = 0;
                this.____motion_Item5af1_mat3DVec__[7] = 0;
                this.____motion_Item5af1_mat3DVec__[8] = 0.275637;
                this.____motion_Item5af1_mat3DVec__[9] = 0;
                this.____motion_Item5af1_mat3DVec__[10] = 0.961262;
                this.____motion_Item5af1_mat3DVec__[11] = 0;
                this.____motion_Item5af1_mat3DVec__[12] = 607.495361;
                this.____motion_Item5af1_mat3DVec__[13] = 104;
                this.____motion_Item5af1_mat3DVec__[14] = 110.254944;
                this.____motion_Item5af1_mat3DVec__[15] = 1;
                this.____motion_Item5af1_matArray__.push(new Matrix3D(this.____motion_Item5af1_mat3DVec__));
                this.__motion_Item5af1.addPropertyArray("matrix3D",this.____motion_Item5af1_matArray__);
                this.__animArray_Item5af1.push(this.__motion_Item5af1);
                this.__animFactory_Item5af1 = new AnimatorFactory3D(null,this.__animArray_Item5af1);
                this.__animFactory_Item5af1.addTargetInfo(this,"Item5",0,true,0,true,null,-1);
            }
            if(this.__animFactory_Item4af1 == null)
            {
                this.__animArray_Item4af1 = new Array();
                this.__motion_Item4af1 = new MotionBase();
                this.__motion_Item4af1.duration = 1;
                this.__motion_Item4af1.overrideTargetTransform();
                this.__motion_Item4af1.addPropertyArray("blendMode",["layer"]);
                this.__motion_Item4af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_Item4af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_Item4af1.addPropertyArray("visible",[true]);
                this.__motion_Item4af1.is3D = true;
                this.__motion_Item4af1.motion_internal::spanStart = 0;
                this.____motion_Item4af1_matArray__ = new Array();
                this.____motion_Item4af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_Item4af1_mat3DVec__[0] = 0.961262;
                this.____motion_Item4af1_mat3DVec__[1] = 0;
                this.____motion_Item4af1_mat3DVec__[2] = -0.275637;
                this.____motion_Item4af1_mat3DVec__[3] = 0;
                this.____motion_Item4af1_mat3DVec__[4] = 0;
                this.____motion_Item4af1_mat3DVec__[5] = 1;
                this.____motion_Item4af1_mat3DVec__[6] = 0;
                this.____motion_Item4af1_mat3DVec__[7] = 0;
                this.____motion_Item4af1_mat3DVec__[8] = 0.275637;
                this.____motion_Item4af1_mat3DVec__[9] = 0;
                this.____motion_Item4af1_mat3DVec__[10] = 0.961262;
                this.____motion_Item4af1_mat3DVec__[11] = 0;
                this.____motion_Item4af1_mat3DVec__[12] = 559.4953;
                this.____motion_Item4af1_mat3DVec__[13] = 24;
                this.____motion_Item4af1_mat3DVec__[14] = 110.254944;
                this.____motion_Item4af1_mat3DVec__[15] = 1;
                this.____motion_Item4af1_matArray__.push(new Matrix3D(this.____motion_Item4af1_mat3DVec__));
                this.__motion_Item4af1.addPropertyArray("matrix3D",this.____motion_Item4af1_matArray__);
                this.__animArray_Item4af1.push(this.__motion_Item4af1);
                this.__animFactory_Item4af1 = new AnimatorFactory3D(null,this.__animArray_Item4af1);
                this.__animFactory_Item4af1.addTargetInfo(this,"Item4",0,true,0,true,null,-1);
            }
            if(this.__animFactory_Item3af1 == null)
            {
                this.__animArray_Item3af1 = new Array();
                this.__motion_Item3af1 = new MotionBase();
                this.__motion_Item3af1.duration = 1;
                this.__motion_Item3af1.overrideTargetTransform();
                this.__motion_Item3af1.addPropertyArray("blendMode",["layer"]);
                this.__motion_Item3af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_Item3af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_Item3af1.addPropertyArray("visible",[true]);
                this.__motion_Item3af1.is3D = true;
                this.__motion_Item3af1.motion_internal::spanStart = 0;
                this.____motion_Item3af1_matArray__ = new Array();
                this.____motion_Item3af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_Item3af1_mat3DVec__[0] = 0.961262;
                this.____motion_Item3af1_mat3DVec__[1] = 0;
                this.____motion_Item3af1_mat3DVec__[2] = 0.275637;
                this.____motion_Item3af1_mat3DVec__[3] = 0;
                this.____motion_Item3af1_mat3DVec__[4] = 0;
                this.____motion_Item3af1_mat3DVec__[5] = 1;
                this.____motion_Item3af1_mat3DVec__[6] = 0;
                this.____motion_Item3af1_mat3DVec__[7] = 0;
                this.____motion_Item3af1_mat3DVec__[8] = -0.275637;
                this.____motion_Item3af1_mat3DVec__[9] = 0;
                this.____motion_Item3af1_mat3DVec__[10] = 0.961262;
                this.____motion_Item3af1_mat3DVec__[11] = 0;
                this.____motion_Item3af1_mat3DVec__[12] = 464.504639;
                this.____motion_Item3af1_mat3DVec__[13] = 264;
                this.____motion_Item3af1_mat3DVec__[14] = 110.254944;
                this.____motion_Item3af1_mat3DVec__[15] = 1;
                this.____motion_Item3af1_matArray__.push(new Matrix3D(this.____motion_Item3af1_mat3DVec__));
                this.__motion_Item3af1.addPropertyArray("matrix3D",this.____motion_Item3af1_matArray__);
                this.__animArray_Item3af1.push(this.__motion_Item3af1);
                this.__animFactory_Item3af1 = new AnimatorFactory3D(null,this.__animArray_Item3af1);
                this.__animFactory_Item3af1.addTargetInfo(this,"Item3",0,true,0,true,null,-1);
            }
            if(this.__animFactory_Item2af1 == null)
            {
                this.__animArray_Item2af1 = new Array();
                this.__motion_Item2af1 = new MotionBase();
                this.__motion_Item2af1.duration = 1;
                this.__motion_Item2af1.overrideTargetTransform();
                this.__motion_Item2af1.addPropertyArray("blendMode",["layer"]);
                this.__motion_Item2af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_Item2af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_Item2af1.addPropertyArray("visible",[true]);
                this.__motion_Item2af1.is3D = true;
                this.__motion_Item2af1.motion_internal::spanStart = 0;
                this.____motion_Item2af1_matArray__ = new Array();
                this.____motion_Item2af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_Item2af1_mat3DVec__[0] = 0.961262;
                this.____motion_Item2af1_mat3DVec__[1] = 0;
                this.____motion_Item2af1_mat3DVec__[2] = 0.275637;
                this.____motion_Item2af1_mat3DVec__[3] = 0;
                this.____motion_Item2af1_mat3DVec__[4] = 0;
                this.____motion_Item2af1_mat3DVec__[5] = 1;
                this.____motion_Item2af1_mat3DVec__[6] = 0;
                this.____motion_Item2af1_mat3DVec__[7] = 0;
                this.____motion_Item2af1_mat3DVec__[8] = -0.275637;
                this.____motion_Item2af1_mat3DVec__[9] = 0;
                this.____motion_Item2af1_mat3DVec__[10] = 0.961262;
                this.____motion_Item2af1_mat3DVec__[11] = 0;
                this.____motion_Item2af1_mat3DVec__[12] = 416.5047;
                this.____motion_Item2af1_mat3DVec__[13] = 184;
                this.____motion_Item2af1_mat3DVec__[14] = 110.254944;
                this.____motion_Item2af1_mat3DVec__[15] = 1;
                this.____motion_Item2af1_matArray__.push(new Matrix3D(this.____motion_Item2af1_mat3DVec__));
                this.__motion_Item2af1.addPropertyArray("matrix3D",this.____motion_Item2af1_matArray__);
                this.__animArray_Item2af1.push(this.__motion_Item2af1);
                this.__animFactory_Item2af1 = new AnimatorFactory3D(null,this.__animArray_Item2af1);
                this.__animFactory_Item2af1.addTargetInfo(this,"Item2",0,true,0,true,null,-1);
            }
            if(this.__animFactory_Item1af1 == null)
            {
                this.__animArray_Item1af1 = new Array();
                this.__motion_Item1af1 = new MotionBase();
                this.__motion_Item1af1.duration = 1;
                this.__motion_Item1af1.overrideTargetTransform();
                this.__motion_Item1af1.addPropertyArray("blendMode",["layer"]);
                this.__motion_Item1af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_Item1af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_Item1af1.addPropertyArray("visible",[true]);
                this.__motion_Item1af1.is3D = true;
                this.__motion_Item1af1.motion_internal::spanStart = 0;
                this.____motion_Item1af1_matArray__ = new Array();
                this.____motion_Item1af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_Item1af1_mat3DVec__[0] = 0.961262;
                this.____motion_Item1af1_mat3DVec__[1] = 0;
                this.____motion_Item1af1_mat3DVec__[2] = 0.275637;
                this.____motion_Item1af1_mat3DVec__[3] = 0;
                this.____motion_Item1af1_mat3DVec__[4] = 0;
                this.____motion_Item1af1_mat3DVec__[5] = 1;
                this.____motion_Item1af1_mat3DVec__[6] = 0;
                this.____motion_Item1af1_mat3DVec__[7] = 0;
                this.____motion_Item1af1_mat3DVec__[8] = -0.275637;
                this.____motion_Item1af1_mat3DVec__[9] = 0;
                this.____motion_Item1af1_mat3DVec__[10] = 0.961262;
                this.____motion_Item1af1_mat3DVec__[11] = 0;
                this.____motion_Item1af1_mat3DVec__[12] = 416.5047;
                this.____motion_Item1af1_mat3DVec__[13] = 104;
                this.____motion_Item1af1_mat3DVec__[14] = 110.254944;
                this.____motion_Item1af1_mat3DVec__[15] = 1;
                this.____motion_Item1af1_matArray__.push(new Matrix3D(this.____motion_Item1af1_mat3DVec__));
                this.__motion_Item1af1.addPropertyArray("matrix3D",this.____motion_Item1af1_matArray__);
                this.__animArray_Item1af1.push(this.__motion_Item1af1);
                this.__animFactory_Item1af1 = new AnimatorFactory3D(null,this.__animArray_Item1af1);
                this.__animFactory_Item1af1.addTargetInfo(this,"Item1",0,true,0,true,null,-1);
            }
            if(this.__animFactory_Item0af1 == null)
            {
                this.__animArray_Item0af1 = new Array();
                this.__motion_Item0af1 = new MotionBase();
                this.__motion_Item0af1.duration = 1;
                this.__motion_Item0af1.overrideTargetTransform();
                this.__motion_Item0af1.addPropertyArray("blendMode",["layer"]);
                this.__motion_Item0af1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_Item0af1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_Item0af1.addPropertyArray("visible",[true]);
                this.__motion_Item0af1.is3D = true;
                this.__motion_Item0af1.motion_internal::spanStart = 0;
                this.____motion_Item0af1_matArray__ = new Array();
                this.____motion_Item0af1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_Item0af1_mat3DVec__[0] = 0.961262;
                this.____motion_Item0af1_mat3DVec__[1] = 0;
                this.____motion_Item0af1_mat3DVec__[2] = 0.275637;
                this.____motion_Item0af1_mat3DVec__[3] = 0;
                this.____motion_Item0af1_mat3DVec__[4] = 0;
                this.____motion_Item0af1_mat3DVec__[5] = 1;
                this.____motion_Item0af1_mat3DVec__[6] = 0;
                this.____motion_Item0af1_mat3DVec__[7] = 0;
                this.____motion_Item0af1_mat3DVec__[8] = -0.275637;
                this.____motion_Item0af1_mat3DVec__[9] = 0;
                this.____motion_Item0af1_mat3DVec__[10] = 0.961262;
                this.____motion_Item0af1_mat3DVec__[11] = 0;
                this.____motion_Item0af1_mat3DVec__[12] = 464.504639;
                this.____motion_Item0af1_mat3DVec__[13] = 24;
                this.____motion_Item0af1_mat3DVec__[14] = 110.254944;
                this.____motion_Item0af1_mat3DVec__[15] = 1;
                this.____motion_Item0af1_matArray__.push(new Matrix3D(this.____motion_Item0af1_mat3DVec__));
                this.__motion_Item0af1.addPropertyArray("matrix3D",this.____motion_Item0af1_matArray__);
                this.__animArray_Item0af1.push(this.__motion_Item0af1);
                this.__animFactory_Item0af1 = new AnimatorFactory3D(null,this.__animArray_Item0af1);
                this.__animFactory_Item0af1.addTargetInfo(this,"Item0",0,true,0,true,null,-1);
            }
        }
    }
}
