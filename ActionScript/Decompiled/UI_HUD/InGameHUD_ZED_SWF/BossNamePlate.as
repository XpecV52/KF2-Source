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
    import tripwire.widgets.BossNameplateWidget;
    
    public dynamic class BossNamePlate extends BossNameplateWidget
    {
         
        
        public var __animFactory_bossNameContaineraf1:AnimatorFactory3D;
        
        public var __animArray_bossNameContaineraf1:Array;
        
        public var ____motion_bossNameContaineraf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_bossNameContaineraf1_matArray__:Array;
        
        public var __motion_bossNameContaineraf1:MotionBase;
        
        public var __animFactory_subTextContaineraf1:AnimatorFactory3D;
        
        public var __animArray_subTextContaineraf1:Array;
        
        public var ____motion_subTextContaineraf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_subTextContaineraf1_matArray__:Array;
        
        public var __motion_subTextContaineraf1:MotionBase;
        
        public function BossNamePlate()
        {
            super();
            addFrameScript(0,this.frame1,29,this.frame30);
            if(this.__animFactory_bossNameContaineraf1 == null)
            {
                this.__animArray_bossNameContaineraf1 = new Array();
                this.__motion_bossNameContaineraf1 = new MotionBase();
                this.__motion_bossNameContaineraf1.duration = 30;
                this.__motion_bossNameContaineraf1.overrideTargetTransform();
                this.__motion_bossNameContaineraf1.addPropertyArray("alphaMultiplier",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
                this.__motion_bossNameContaineraf1.addPropertyArray("blendMode",["normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal"]);
                this.__motion_bossNameContaineraf1.addPropertyArray("cacheAsBitmap",[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]);
                this.__motion_bossNameContaineraf1.addPropertyArray("opaqueBackground",[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]);
                this.__motion_bossNameContaineraf1.addPropertyArray("visible",[true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true]);
                this.__motion_bossNameContaineraf1.is3D = true;
                this.__motion_bossNameContaineraf1.motion_internal::spanStart = 0;
                this.____motion_bossNameContaineraf1_matArray__ = new Array();
                this.____motion_bossNameContaineraf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_bossNameContaineraf1_mat3DVec__[0] = 1;
                this.____motion_bossNameContaineraf1_mat3DVec__[1] = 0;
                this.____motion_bossNameContaineraf1_mat3DVec__[2] = 0;
                this.____motion_bossNameContaineraf1_mat3DVec__[3] = 0;
                this.____motion_bossNameContaineraf1_mat3DVec__[4] = 0;
                this.____motion_bossNameContaineraf1_mat3DVec__[5] = 1;
                this.____motion_bossNameContaineraf1_mat3DVec__[6] = 0;
                this.____motion_bossNameContaineraf1_mat3DVec__[7] = 0;
                this.____motion_bossNameContaineraf1_mat3DVec__[8] = 0;
                this.____motion_bossNameContaineraf1_mat3DVec__[9] = 0;
                this.____motion_bossNameContaineraf1_mat3DVec__[10] = 1;
                this.____motion_bossNameContaineraf1_mat3DVec__[11] = 0;
                this.____motion_bossNameContaineraf1_mat3DVec__[12] = 112;
                this.____motion_bossNameContaineraf1_mat3DVec__[13] = 320;
                this.____motion_bossNameContaineraf1_mat3DVec__[14] = -128;
                this.____motion_bossNameContaineraf1_mat3DVec__[15] = 1;
                this.____motion_bossNameContaineraf1_matArray__.push(new Matrix3D(this.____motion_bossNameContaineraf1_mat3DVec__));
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.____motion_bossNameContaineraf1_matArray__.push(null);
                this.__motion_bossNameContaineraf1.addPropertyArray("matrix3D",this.____motion_bossNameContaineraf1_matArray__);
                this.__animArray_bossNameContaineraf1.push(this.__motion_bossNameContaineraf1);
                this.__animFactory_bossNameContaineraf1 = new AnimatorFactory3D(null,this.__animArray_bossNameContaineraf1);
                this.__animFactory_bossNameContaineraf1.addTargetInfo(this,"bossNameContainer",0,true,0,true,null,-1);
            }
            if(this.__animFactory_subTextContaineraf1 == null)
            {
                this.__animArray_subTextContaineraf1 = new Array();
                this.__motion_subTextContaineraf1 = new MotionBase();
                this.__motion_subTextContaineraf1.duration = 30;
                this.__motion_subTextContaineraf1.overrideTargetTransform();
                this.__motion_subTextContaineraf1.addPropertyArray("alphaMultiplier",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
                this.__motion_subTextContaineraf1.addPropertyArray("blendMode",["normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal"]);
                this.__motion_subTextContaineraf1.addPropertyArray("cacheAsBitmap",[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]);
                this.__motion_subTextContaineraf1.addPropertyArray("opaqueBackground",[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]);
                this.__motion_subTextContaineraf1.addPropertyArray("visible",[true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true]);
                this.__motion_subTextContaineraf1.is3D = true;
                this.__motion_subTextContaineraf1.motion_internal::spanStart = 0;
                this.____motion_subTextContaineraf1_matArray__ = new Array();
                this.____motion_subTextContaineraf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_subTextContaineraf1_mat3DVec__[0] = 1;
                this.____motion_subTextContaineraf1_mat3DVec__[1] = 0;
                this.____motion_subTextContaineraf1_mat3DVec__[2] = 0;
                this.____motion_subTextContaineraf1_mat3DVec__[3] = 0;
                this.____motion_subTextContaineraf1_mat3DVec__[4] = 0;
                this.____motion_subTextContaineraf1_mat3DVec__[5] = 1;
                this.____motion_subTextContaineraf1_mat3DVec__[6] = 0;
                this.____motion_subTextContaineraf1_mat3DVec__[7] = 0;
                this.____motion_subTextContaineraf1_mat3DVec__[8] = 0;
                this.____motion_subTextContaineraf1_mat3DVec__[9] = 0;
                this.____motion_subTextContaineraf1_mat3DVec__[10] = 1;
                this.____motion_subTextContaineraf1_mat3DVec__[11] = 0;
                this.____motion_subTextContaineraf1_mat3DVec__[12] = 320;
                this.____motion_subTextContaineraf1_mat3DVec__[13] = 384;
                this.____motion_subTextContaineraf1_mat3DVec__[14] = -128;
                this.____motion_subTextContaineraf1_mat3DVec__[15] = 1;
                this.____motion_subTextContaineraf1_matArray__.push(new Matrix3D(this.____motion_subTextContaineraf1_mat3DVec__));
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.____motion_subTextContaineraf1_matArray__.push(null);
                this.__motion_subTextContaineraf1.addPropertyArray("matrix3D",this.____motion_subTextContaineraf1_matArray__);
                this.__animArray_subTextContaineraf1.push(this.__motion_subTextContaineraf1);
                this.__animFactory_subTextContaineraf1 = new AnimatorFactory3D(null,this.__animArray_subTextContaineraf1);
                this.__animFactory_subTextContaineraf1.addTargetInfo(this,"subTextContainer",0,true,0,true,null,-1);
            }
        }
        
        function frame1() : *
        {
            stop();
        }
        
        function frame30() : *
        {
            stop();
        }
    }
}
