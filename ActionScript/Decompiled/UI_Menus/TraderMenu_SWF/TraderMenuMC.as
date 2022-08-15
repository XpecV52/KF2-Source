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
    import tripwire.menus.TraderMenu;
    
    public dynamic class TraderMenuMC extends TraderMenu
    {
         
        
        public var Scanlines:MovieClip;
        
        public var __animFactory_shopContaineraf1:AnimatorFactory3D;
        
        public var __animArray_shopContaineraf1:Array;
        
        public var ____motion_shopContaineraf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_shopContaineraf1_matArray__:Array;
        
        public var __motion_shopContaineraf1:MotionBase;
        
        public var __animFactory_itemDetailsContaineraf1:AnimatorFactory3D;
        
        public var __animArray_itemDetailsContaineraf1:Array;
        
        public var ____motion_itemDetailsContaineraf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_itemDetailsContaineraf1_matArray__:Array;
        
        public var __motion_itemDetailsContaineraf1:MotionBase;
        
        public var __animFactory_exitButtonaf1:AnimatorFactory3D;
        
        public var __animArray_exitButtonaf1:Array;
        
        public var ____motion_exitButtonaf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_exitButtonaf1_matArray__:Array;
        
        public var __motion_exitButtonaf1:MotionBase;
        
        public var __animFactory_gameInfoContaineraf1:AnimatorFactory3D;
        
        public var __animArray_gameInfoContaineraf1:Array;
        
        public var ____motion_gameInfoContaineraf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_gameInfoContaineraf1_matArray__:Array;
        
        public var __motion_gameInfoContaineraf1:MotionBase;
        
        public var __animFactory_playerInventoryContaineraf1:AnimatorFactory3D;
        
        public var __animArray_playerInventoryContaineraf1:Array;
        
        public var ____motion_playerInventoryContaineraf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_playerInventoryContaineraf1_matArray__:Array;
        
        public var __motion_playerInventoryContaineraf1:MotionBase;
        
        public function TraderMenuMC()
        {
            super();
            addFrameScript(0,this.frame1);
            if(this.__animFactory_shopContaineraf1 == null)
            {
                this.__animArray_shopContaineraf1 = new Array();
                this.__motion_shopContaineraf1 = new MotionBase();
                this.__motion_shopContaineraf1.duration = 1;
                this.__motion_shopContaineraf1.overrideTargetTransform();
                this.__motion_shopContaineraf1.addPropertyArray("blendMode",["normal"]);
                this.__motion_shopContaineraf1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_shopContaineraf1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_shopContaineraf1.addPropertyArray("visible",[true]);
                this.__motion_shopContaineraf1.is3D = true;
                this.__motion_shopContaineraf1.motion_internal::spanStart = 0;
                this.____motion_shopContaineraf1_matArray__ = new Array();
                this.____motion_shopContaineraf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_shopContaineraf1_mat3DVec__[0] = 0.961262;
                this.____motion_shopContaineraf1_mat3DVec__[1] = 0;
                this.____motion_shopContaineraf1_mat3DVec__[2] = 0.275637;
                this.____motion_shopContaineraf1_mat3DVec__[3] = 0;
                this.____motion_shopContaineraf1_mat3DVec__[4] = 0;
                this.____motion_shopContaineraf1_mat3DVec__[5] = 1;
                this.____motion_shopContaineraf1_mat3DVec__[6] = 0;
                this.____motion_shopContaineraf1_mat3DVec__[7] = 0;
                this.____motion_shopContaineraf1_mat3DVec__[8] = -0.275637;
                this.____motion_shopContaineraf1_mat3DVec__[9] = 0;
                this.____motion_shopContaineraf1_mat3DVec__[10] = 0.961262;
                this.____motion_shopContaineraf1_mat3DVec__[11] = 0;
                this.____motion_shopContaineraf1_mat3DVec__[12] = 16.005686;
                this.____motion_shopContaineraf1_mat3DVec__[13] = 16;
                this.____motion_shopContaineraf1_mat3DVec__[14] = -0.034546;
                this.____motion_shopContaineraf1_mat3DVec__[15] = 1;
                this.____motion_shopContaineraf1_matArray__.push(new Matrix3D(this.____motion_shopContaineraf1_mat3DVec__));
                this.__motion_shopContaineraf1.addPropertyArray("matrix3D",this.____motion_shopContaineraf1_matArray__);
                this.__animArray_shopContaineraf1.push(this.__motion_shopContaineraf1);
                this.__animFactory_shopContaineraf1 = new AnimatorFactory3D(null,this.__animArray_shopContaineraf1);
                this.__animFactory_shopContaineraf1.addTargetInfo(this,"shopContainer",0,true,0,true,null,-1);
            }
            if(this.__animFactory_itemDetailsContaineraf1 == null)
            {
                this.__animArray_itemDetailsContaineraf1 = new Array();
                this.__motion_itemDetailsContaineraf1 = new MotionBase();
                this.__motion_itemDetailsContaineraf1.duration = 1;
                this.__motion_itemDetailsContaineraf1.overrideTargetTransform();
                this.__motion_itemDetailsContaineraf1.addPropertyArray("blendMode",["normal"]);
                this.__motion_itemDetailsContaineraf1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_itemDetailsContaineraf1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_itemDetailsContaineraf1.addPropertyArray("visible",[true]);
                this.__motion_itemDetailsContaineraf1.is3D = true;
                this.__motion_itemDetailsContaineraf1.motion_internal::spanStart = 0;
                this.____motion_itemDetailsContaineraf1_matArray__ = new Array();
                this.____motion_itemDetailsContaineraf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_itemDetailsContaineraf1_mat3DVec__[0] = 1;
                this.____motion_itemDetailsContaineraf1_mat3DVec__[1] = 0;
                this.____motion_itemDetailsContaineraf1_mat3DVec__[2] = 0;
                this.____motion_itemDetailsContaineraf1_mat3DVec__[3] = 0;
                this.____motion_itemDetailsContaineraf1_mat3DVec__[4] = 0;
                this.____motion_itemDetailsContaineraf1_mat3DVec__[5] = 1;
                this.____motion_itemDetailsContaineraf1_mat3DVec__[6] = 0;
                this.____motion_itemDetailsContaineraf1_mat3DVec__[7] = 0;
                this.____motion_itemDetailsContaineraf1_mat3DVec__[8] = 0;
                this.____motion_itemDetailsContaineraf1_mat3DVec__[9] = 0;
                this.____motion_itemDetailsContaineraf1_mat3DVec__[10] = 1;
                this.____motion_itemDetailsContaineraf1_mat3DVec__[11] = 0;
                this.____motion_itemDetailsContaineraf1_mat3DVec__[12] = 768;
                this.____motion_itemDetailsContaineraf1_mat3DVec__[13] = 216;
                this.____motion_itemDetailsContaineraf1_mat3DVec__[14] = 224;
                this.____motion_itemDetailsContaineraf1_mat3DVec__[15] = 1;
                this.____motion_itemDetailsContaineraf1_matArray__.push(new Matrix3D(this.____motion_itemDetailsContaineraf1_mat3DVec__));
                this.__motion_itemDetailsContaineraf1.addPropertyArray("matrix3D",this.____motion_itemDetailsContaineraf1_matArray__);
                this.__animArray_itemDetailsContaineraf1.push(this.__motion_itemDetailsContaineraf1);
                this.__animFactory_itemDetailsContaineraf1 = new AnimatorFactory3D(null,this.__animArray_itemDetailsContaineraf1);
                this.__animFactory_itemDetailsContaineraf1.addTargetInfo(this,"itemDetailsContainer",0,true,0,true,null,-1);
            }
            if(this.__animFactory_exitButtonaf1 == null)
            {
                this.__animArray_exitButtonaf1 = new Array();
                this.__motion_exitButtonaf1 = new MotionBase();
                this.__motion_exitButtonaf1.duration = 1;
                this.__motion_exitButtonaf1.overrideTargetTransform();
                this.__motion_exitButtonaf1.addPropertyArray("blendMode",["normal"]);
                this.__motion_exitButtonaf1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_exitButtonaf1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_exitButtonaf1.addPropertyArray("visible",[true]);
                this.__motion_exitButtonaf1.is3D = true;
                this.__motion_exitButtonaf1.motion_internal::spanStart = 0;
                this.____motion_exitButtonaf1_matArray__ = new Array();
                this.____motion_exitButtonaf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_exitButtonaf1_mat3DVec__[0] = 1;
                this.____motion_exitButtonaf1_mat3DVec__[1] = 0;
                this.____motion_exitButtonaf1_mat3DVec__[2] = 0;
                this.____motion_exitButtonaf1_mat3DVec__[3] = 0;
                this.____motion_exitButtonaf1_mat3DVec__[4] = 0;
                this.____motion_exitButtonaf1_mat3DVec__[5] = 1;
                this.____motion_exitButtonaf1_mat3DVec__[6] = 0;
                this.____motion_exitButtonaf1_mat3DVec__[7] = 0;
                this.____motion_exitButtonaf1_mat3DVec__[8] = 0;
                this.____motion_exitButtonaf1_mat3DVec__[9] = 0;
                this.____motion_exitButtonaf1_mat3DVec__[10] = 1;
                this.____motion_exitButtonaf1_mat3DVec__[11] = 0;
                this.____motion_exitButtonaf1_mat3DVec__[12] = 846.200012;
                this.____motion_exitButtonaf1_mat3DVec__[13] = 984;
                this.____motion_exitButtonaf1_mat3DVec__[14] = 224;
                this.____motion_exitButtonaf1_mat3DVec__[15] = 1;
                this.____motion_exitButtonaf1_matArray__.push(new Matrix3D(this.____motion_exitButtonaf1_mat3DVec__));
                this.__motion_exitButtonaf1.addPropertyArray("matrix3D",this.____motion_exitButtonaf1_matArray__);
                this.__animArray_exitButtonaf1.push(this.__motion_exitButtonaf1);
                this.__animFactory_exitButtonaf1 = new AnimatorFactory3D(null,this.__animArray_exitButtonaf1);
                this.__animFactory_exitButtonaf1.addTargetInfo(this,"exitButton",0,true,0,true,null,-1);
            }
            if(this.__animFactory_gameInfoContaineraf1 == null)
            {
                this.__animArray_gameInfoContaineraf1 = new Array();
                this.__motion_gameInfoContaineraf1 = new MotionBase();
                this.__motion_gameInfoContaineraf1.duration = 1;
                this.__motion_gameInfoContaineraf1.overrideTargetTransform();
                this.__motion_gameInfoContaineraf1.addPropertyArray("blendMode",["normal"]);
                this.__motion_gameInfoContaineraf1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_gameInfoContaineraf1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_gameInfoContaineraf1.addPropertyArray("visible",[true]);
                this.__motion_gameInfoContaineraf1.is3D = true;
                this.__motion_gameInfoContaineraf1.motion_internal::spanStart = 0;
                this.____motion_gameInfoContaineraf1_matArray__ = new Array();
                this.____motion_gameInfoContaineraf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_gameInfoContaineraf1_mat3DVec__[0] = 1;
                this.____motion_gameInfoContaineraf1_mat3DVec__[1] = 0;
                this.____motion_gameInfoContaineraf1_mat3DVec__[2] = 0;
                this.____motion_gameInfoContaineraf1_mat3DVec__[3] = 0;
                this.____motion_gameInfoContaineraf1_mat3DVec__[4] = 0;
                this.____motion_gameInfoContaineraf1_mat3DVec__[5] = 1;
                this.____motion_gameInfoContaineraf1_mat3DVec__[6] = 0;
                this.____motion_gameInfoContaineraf1_mat3DVec__[7] = 0;
                this.____motion_gameInfoContaineraf1_mat3DVec__[8] = 0;
                this.____motion_gameInfoContaineraf1_mat3DVec__[9] = 0;
                this.____motion_gameInfoContaineraf1_mat3DVec__[10] = 1;
                this.____motion_gameInfoContaineraf1_mat3DVec__[11] = 0;
                this.____motion_gameInfoContaineraf1_mat3DVec__[12] = 768;
                this.____motion_gameInfoContaineraf1_mat3DVec__[13] = 12;
                this.____motion_gameInfoContaineraf1_mat3DVec__[14] = 224;
                this.____motion_gameInfoContaineraf1_mat3DVec__[15] = 1;
                this.____motion_gameInfoContaineraf1_matArray__.push(new Matrix3D(this.____motion_gameInfoContaineraf1_mat3DVec__));
                this.__motion_gameInfoContaineraf1.addPropertyArray("matrix3D",this.____motion_gameInfoContaineraf1_matArray__);
                this.__animArray_gameInfoContaineraf1.push(this.__motion_gameInfoContaineraf1);
                this.__animFactory_gameInfoContaineraf1 = new AnimatorFactory3D(null,this.__animArray_gameInfoContaineraf1);
                this.__animFactory_gameInfoContaineraf1.addTargetInfo(this,"gameInfoContainer",0,true,0,true,null,-1);
            }
            if(this.__animFactory_playerInventoryContaineraf1 == null)
            {
                this.__animArray_playerInventoryContaineraf1 = new Array();
                this.__motion_playerInventoryContaineraf1 = new MotionBase();
                this.__motion_playerInventoryContaineraf1.duration = 1;
                this.__motion_playerInventoryContaineraf1.overrideTargetTransform();
                this.__motion_playerInventoryContaineraf1.addPropertyArray("blendMode",["normal"]);
                this.__motion_playerInventoryContaineraf1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_playerInventoryContaineraf1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_playerInventoryContaineraf1.addPropertyArray("visible",[true]);
                this.__motion_playerInventoryContaineraf1.is3D = true;
                this.__motion_playerInventoryContaineraf1.motion_internal::spanStart = 0;
                this.____motion_playerInventoryContaineraf1_matArray__ = new Array();
                this.____motion_playerInventoryContaineraf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_playerInventoryContaineraf1_mat3DVec__[0] = 0.961262;
                this.____motion_playerInventoryContaineraf1_mat3DVec__[1] = 0;
                this.____motion_playerInventoryContaineraf1_mat3DVec__[2] = -0.275637;
                this.____motion_playerInventoryContaineraf1_mat3DVec__[3] = 0;
                this.____motion_playerInventoryContaineraf1_mat3DVec__[4] = 0;
                this.____motion_playerInventoryContaineraf1_mat3DVec__[5] = 1;
                this.____motion_playerInventoryContaineraf1_mat3DVec__[6] = 0;
                this.____motion_playerInventoryContaineraf1_mat3DVec__[7] = 0;
                this.____motion_playerInventoryContaineraf1_mat3DVec__[8] = 0.275637;
                this.____motion_playerInventoryContaineraf1_mat3DVec__[9] = 0;
                this.____motion_playerInventoryContaineraf1_mat3DVec__[10] = 0.961262;
                this.____motion_playerInventoryContaineraf1_mat3DVec__[11] = 0;
                this.____motion_playerInventoryContaineraf1_mat3DVec__[12] = 1888.045288;
                this.____motion_playerInventoryContaineraf1_mat3DVec__[13] = 272;
                this.____motion_playerInventoryContaineraf1_mat3DVec__[14] = -0.017627;
                this.____motion_playerInventoryContaineraf1_mat3DVec__[15] = 1;
                this.____motion_playerInventoryContaineraf1_matArray__.push(new Matrix3D(this.____motion_playerInventoryContaineraf1_mat3DVec__));
                this.__motion_playerInventoryContaineraf1.addPropertyArray("matrix3D",this.____motion_playerInventoryContaineraf1_matArray__);
                this.__animArray_playerInventoryContaineraf1.push(this.__motion_playerInventoryContaineraf1);
                this.__animFactory_playerInventoryContaineraf1 = new AnimatorFactory3D(null,this.__animArray_playerInventoryContaineraf1);
                this.__animFactory_playerInventoryContaineraf1.addTargetInfo(this,"playerInventoryContainer",0,true,0,true,null,-1);
            }
            this.__setProp_exitButton_TraderMenuMC_Details_0();
        }
        
        function __setProp_exitButton_TraderMenuMC_Details_0() : *
        {
            try
            {
                exitButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            exitButton.autoRepeat = false;
            exitButton.autoSize = "none";
            exitButton.data = "";
            exitButton.enabled = true;
            exitButton.enableInitCallback = false;
            exitButton.focusable = false;
            exitButton.label = "";
            exitButton.selected = false;
            exitButton.toggle = false;
            exitButton.visible = true;
            try
            {
                exitButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function frame1() : *
        {
            this.Scanlines.mouseEnabled = false;
            this.Scanlines.mouseChildren = false;
        }
    }
}
