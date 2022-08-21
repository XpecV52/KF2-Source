package tripwire.managers
{
    import com.greensock.*;
    import com.greensock.easing.*;
    import fl.motion.AnimatorFactory3D;
    import fl.motion.MotionBase;
    import fl.motion.motion_internal;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.filters.*;
    import flash.geom.*;
    import scaleform.clik.layout.LayoutData;
    import tripwire.Tools.TripLayout;
    import tripwire.containers.MoveContainer;
    import tripwire.widgets.PlayerRosterWidget;
    
    public class ZedHudManager extends HudManager
    {
         
        
        public var __animFactory_BossNamePlateaf1:AnimatorFactory3D;
        
        public var __animArray_BossNamePlateaf1:Array;
        
        public var ____motion_BossNamePlateaf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_BossNamePlateaf1_matArray__:Array;
        
        public var __motion_BossNamePlateaf1:MotionBase;
        
        public var health:int = 100;
        
        public var teamRoster:PlayerRosterWidget;
        
        public var moveListContainer:MoveContainer;
        
        public function ZedHudManager()
        {
            addFrameScript(0,this.frame1);
            super();
            SpectatorInfoWidget.visible = false;
            addEventListener(Event.ADDED_TO_STAGE,this.__setPerspectiveProjection_);
            if(this.__animFactory_BossNamePlateaf1 == null)
            {
                this.__animArray_BossNamePlateaf1 = new Array();
                this.__motion_BossNamePlateaf1 = new MotionBase();
                this.__motion_BossNamePlateaf1.duration = 1;
                this.__motion_BossNamePlateaf1.overrideTargetTransform();
                this.__motion_BossNamePlateaf1.addPropertyArray("blendMode",["normal"]);
                this.__motion_BossNamePlateaf1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_BossNamePlateaf1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_BossNamePlateaf1.addPropertyArray("visible",[false]);
                this.__motion_BossNamePlateaf1.is3D = true;
                this.__motion_BossNamePlateaf1.motion_internal::spanStart = 0;
                this.____motion_BossNamePlateaf1_matArray__ = new Array();
                this.____motion_BossNamePlateaf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_BossNamePlateaf1_mat3DVec__[0] = 0.75;
                this.____motion_BossNamePlateaf1_mat3DVec__[1] = 0;
                this.____motion_BossNamePlateaf1_mat3DVec__[2] = 0;
                this.____motion_BossNamePlateaf1_mat3DVec__[3] = 0;
                this.____motion_BossNamePlateaf1_mat3DVec__[4] = 0;
                this.____motion_BossNamePlateaf1_mat3DVec__[5] = 0.75;
                this.____motion_BossNamePlateaf1_mat3DVec__[6] = 0;
                this.____motion_BossNamePlateaf1_mat3DVec__[7] = 0;
                this.____motion_BossNamePlateaf1_mat3DVec__[8] = 0;
                this.____motion_BossNamePlateaf1_mat3DVec__[9] = 0;
                this.____motion_BossNamePlateaf1_mat3DVec__[10] = 1;
                this.____motion_BossNamePlateaf1_mat3DVec__[11] = 0;
                this.____motion_BossNamePlateaf1_mat3DVec__[12] = 991.450012;
                this.____motion_BossNamePlateaf1_mat3DVec__[13] = 524.150024;
                this.____motion_BossNamePlateaf1_mat3DVec__[14] = 0;
                this.____motion_BossNamePlateaf1_mat3DVec__[15] = 1;
                this.____motion_BossNamePlateaf1_matArray__.push(new Matrix3D(this.____motion_BossNamePlateaf1_mat3DVec__));
                this.__motion_BossNamePlateaf1.addPropertyArray("matrix3D",this.____motion_BossNamePlateaf1_matArray__);
                this.__animArray_BossNamePlateaf1.push(this.__motion_BossNamePlateaf1);
                this.__animFactory_BossNamePlateaf1 = new AnimatorFactory3D(null,this.__animArray_BossNamePlateaf1);
                this.__animFactory_BossNamePlateaf1.sceneName = "Scene 1";
                this.__animFactory_BossNamePlateaf1.addTargetInfo(this,"BossNamePlate",0,true,0,true,null,-1);
            }
            this.__setProp_voipWidget_Scene1_VOIPList_0();
        }
        
        public function __setPerspectiveProjection_(param1:Event) : void
        {
            root.transform.perspectiveProjection.fieldOfView = 32;
            root.transform.perspectiveProjection.projectionCenter = new Point(960,540);
        }
        
        override public function set bossData(param1:Object) : void
        {
            this.teamRoster.visible = false;
            WaveCompassWidget.visible = false;
            ChatBoxWidget.visible = false;
            PlayerStatWidgetMC.visible = false;
            PriorityMsgWidget.visible = false;
            voipWidget.visible = false;
            VoiceCommsWidget.visible = false;
            LevelUpNotificationWidget.visible = false;
            interactionMsgWidget.visible = false;
            SpectatorInfoWidget.visible = false;
            KickVoteWidget.visible = false;
            NonCriticalMessageWidget.visible = false;
            MusicNotification.visible = false;
            this.moveListContainer.visible = false;
            if(BossNamePlate)
            {
                BossNamePlate.setText(!!param1.bossName ? param1.bossName : "",!!param1.subString ? param1.subString : "");
            }
        }
        
        override public function hideBossNamePlate() : void
        {
            if(WaveCompassWidget)
            {
                WaveCompassWidget.visible = true;
            }
            if(ChatBoxWidget)
            {
                ChatBoxWidget.visible = true;
            }
            if(PlayerStatWidgetMC)
            {
                PlayerStatWidgetMC.visible = true;
            }
            if(this.teamRoster)
            {
                this.teamRoster.visible = true;
            }
            if(voipWidget)
            {
                voipWidget.visible = true;
            }
            if(VoiceCommsWidget)
            {
                VoiceCommsWidget.visible = true;
            }
            if(this.moveListContainer)
            {
                this.moveListContainer.visible = true;
            }
            this.bSpectating = _bSpectating;
            if(BossNamePlate)
            {
                BossNamePlate.visible = false;
            }
        }
        
        override public function set bSpectating(param1:Boolean) : void
        {
            _bSpectating = param1;
            PlayerStatWidgetMC.visible = !param1;
            if(SpectatorInfoWidget.visible)
            {
                SpectatorInfoWidget.visible = param1;
            }
            if(param1)
            {
                interactionMsgWidget.visible = false;
            }
            this.moveListContainer.visible = !param1;
        }
        
        public function test(param1:KeyboardEvent) : void
        {
            var _loc2_:String = "TW_TURNWAYS KILLED TW_ZANE";
            var _loc3_:Object = {"text":_loc2_};
            newBark = _loc3_;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        override public function createLayout() : *
        {
            centerPoint = new Point(stage.stageWidth / 2,stage.stageHeight / 2);
            root.transform.perspectiveProjection.projectionCenter = centerPoint;
            WaveCompassWidget.layoutData = new LayoutData();
            WaveCompassWidget.layoutData.alignV = "top";
            WaveCompassWidget.layoutData.alignH = "left";
            WaveCompassWidget.layoutData.offsetH = 16;
            WaveCompassWidget.layoutData.offsetV = 16;
            voipWidget.layoutData = new LayoutData();
            voipWidget.layoutData.alignV = "center";
            voipWidget.layoutData.alignH = "left";
            voipWidget.layoutData.offsetH = 24;
            voipWidget.layoutData.offsetV = -70;
            ChatBoxWidget.layoutData = new LayoutData();
            ChatBoxWidget.layoutData.alignV = "bottom";
            ChatBoxWidget.layoutData.alignH = "left";
            ChatBoxWidget.layoutData.offsetH = 24;
            ChatBoxWidget.layoutData.offsetV = -216;
            KickVoteWidget.layoutData = new LayoutData();
            KickVoteWidget.layoutData.alignV = "bottom";
            KickVoteWidget.layoutData.alignH = "right";
            KickVoteWidget.layoutData.offsetH = -20;
            KickVoteWidget.layoutData.offsetV = -256;
            this.moveListContainer.layoutData = new LayoutData();
            this.moveListContainer.layoutData.alignV = "bottom";
            this.moveListContainer.layoutData.alignH = "right";
            this.moveListContainer.layoutData.offsetH = -24;
            this.moveListContainer.layoutData.offsetV = -16;
            BossNamePlate.layoutData = new LayoutData();
            BossNamePlate.layoutData.alignV = "bottom";
            BossNamePlate.layoutData.alignH = "right";
            BossNamePlate.layoutData.offsetH = -8;
            BossNamePlate.layoutData.offsetV = -8;
            PlayerStatWidgetMC.layoutData = new LayoutData();
            PlayerStatWidgetMC.layoutData.alignV = "bottom";
            PlayerStatWidgetMC.layoutData.alignH = "left";
            PlayerStatWidgetMC.layoutData.offsetH = 16;
            PlayerStatWidgetMC.layoutData.offsetV = -16;
            PriorityMsgWidget.layoutData = new LayoutData();
            PriorityMsgWidget.layoutData.alignV = "center";
            PriorityMsgWidget.layoutData.alignH = "center";
            PriorityMsgWidget.layoutData.offsetH = 0;
            PriorityMsgWidget.layoutData.offsetV = 0;
            if(this.teamRoster)
            {
                this.teamRoster.layoutData = new LayoutData();
                this.teamRoster.layoutData.alignV = "top";
                this.teamRoster.layoutData.alignH = "center";
                this.teamRoster.layoutData.offsetH = 0;
                this.teamRoster.layoutData.offsetV = 32;
            }
            NonCriticalMessageWidget.layoutData = new LayoutData();
            NonCriticalMessageWidget.layoutData.alignV = "top";
            NonCriticalMessageWidget.layoutData.alignH = "center";
            NonCriticalMessageWidget.layoutData.offsetH = 0;
            NonCriticalMessageWidget.layoutData.offsetV = 144;
            interactionMsgWidget.layoutData = new LayoutData();
            interactionMsgWidget.layoutData.alignV = "bottom";
            interactionMsgWidget.layoutData.alignH = "center";
            interactionMsgWidget.layoutData.offsetV = -128;
            interactionMsgWidget.layoutData.offsetH = 0;
            SpectatorInfoWidget.layoutData = new LayoutData();
            SpectatorInfoWidget.layoutData.alignV = "bottom";
            SpectatorInfoWidget.layoutData.alignH = "center";
            SpectatorInfoWidget.layoutData.offsetV = -60;
            SpectatorInfoWidget.layoutData.offsetH = 0;
            LevelUpNotificationWidget.layoutData = new LayoutData();
            LevelUpNotificationWidget.layoutData.alignV = "bottom";
            LevelUpNotificationWidget.layoutData.alignH = "center";
            LevelUpNotificationWidget.layoutData.offsetV = -40;
            LevelUpNotificationWidget.layoutData.offsetH = 0;
            VoiceCommsWidget.layoutData = new LayoutData();
            VoiceCommsWidget.layoutData.alignV = "center";
            VoiceCommsWidget.layoutData.alignH = "center";
            VoiceCommsWidget.layoutData.offsetH = 0;
            VoiceCommsWidget.layoutData.offsetV = 0;
            MusicNotification.layoutData = new LayoutData();
            MusicNotification.layoutData.alignV = "top";
            MusicNotification.layoutData.alignH = "right";
            MusicNotification.layoutData.offsetV = 32;
            MusicNotification.layoutData.offsetH = -32;
            barkNode.layoutData = new LayoutData();
            barkNode.layoutData.alignV = "bottom";
            barkNode.layoutData.alignH = "right";
            barkNode.layoutData.offsetH = -32;
            barkNode.layoutData.offsetV = 0;
            barkNode.layoutData.relativeToV = MusicNotification.name;
            layout = new TripLayout();
            layout.tiedToStageSize = true;
            layout.hidden = false;
            addChild(layout);
        }
        
        override public function start3d() : void
        {
            apply3d(this.moveListContainer,0,24,0,"bottom","right");
            apply3d(barkNode,0,24,0,"bottom","right");
            apply3d(PlayerStatWidgetMC,0,-24,0,"bottom","left");
            apply3d(KickVoteWidget,0,24,0,"bottom","right");
            apply3d(BossNamePlate,0,0,0,"bottom","right");
            apply3d(WaveCompassWidget,0,-24,0,"top","left");
            apply3d(SpectatorInfoWidget,0,0,288,"center","center");
            apply3d(LevelUpNotificationWidget,0,0,288,"center","center");
            apply3d(interactionMsgWidget,0,0,288,"center","center");
            apply3d(ChatBoxWidget,0,-24,0,"top","left");
            apply3d(voipWidget,0,-24,0,"top","left");
            apply3d(PriorityMsgWidget,0,0,288,"center","center");
            apply3d(VoiceCommsWidget,0,0,288,"center","center");
            if(this.teamRoster)
            {
                apply3d(this.teamRoster,0,0,0,"center","center");
            }
            apply3d(NonCriticalMessageWidget,0,0,0,"center","center");
            apply3d(MusicNotification,0,24,0,"top","right");
        }
        
        override public function UpdateElementScales() : void
        {
            if(this.teamRoster)
            {
                scaleChild(this.teamRoster);
            }
            scaleChild(this.moveListContainer);
            scaleChild(ChatBoxWidget);
            scaleChild(voipWidget);
            scaleChild(WaveCompassWidget);
            scaleChild(PlayerStatWidgetMC);
            scaleChild(VoiceCommsWidget);
            scaleChild(PriorityMsgWidget);
            scaleChild(interactionMsgWidget);
            scaleChild(LevelUpNotificationWidget);
            scaleChild(SpectatorInfoWidget);
            scaleChild(MusicNotification);
            scaleChild(NonCriticalMessageWidget);
            scaleChild(KickVoteWidget);
            scaleChild(BossNamePlate);
        }
        
        function __setProp_voipWidget_Scene1_VOIPList_0() : *
        {
            try
            {
                voipWidget["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            voipWidget.enabled = true;
            voipWidget.enableInitCallback = true;
            voipWidget.visible = true;
            try
            {
                voipWidget["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function frame1() : *
        {
        }
    }
}
