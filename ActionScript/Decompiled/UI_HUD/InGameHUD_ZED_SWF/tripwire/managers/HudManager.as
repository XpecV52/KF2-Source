package tripwire.managers
{
    import com.greensock.TweenMax;
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.geom.Point;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.layout.Layout;
    import scaleform.clik.layout.LayoutData;
    import scaleform.gfx.Extensions;
    import tripwire.containers.TripContainer;
    import tripwire.controls.HudBarkMessage;
    import tripwire.widgets.BossNameplateWidget;
    import tripwire.widgets.ControllerWeaponSelectWidget;
    import tripwire.widgets.NonCriticalGameMessageWidget;
    import tripwire.widgets.PlayerStatWidget;
    import tripwire.widgets.WeaponSelectWidget;
    
    public class HudManager extends UIComponent
    {
        
        private static var _manager:HudManager;
         
        
        public var WaveCompassWidget:UIComponent;
        
        public var ChatBoxWidget:UIComponent;
        
        public var PlayerStatWidgetMC:PlayerStatWidget;
        
        public var WeaponSelectContainer:WeaponSelectWidget;
        
        public var ScoreboardWidgetMC:TripContainer;
        
        public var PriorityMsgWidget:UIComponent;
        
        public var PlayerBackpackWidget:UIComponent;
        
        public var voipWidget:UIComponent;
        
        public var VoiceCommsWidget:UIComponent;
        
        public var LevelUpNotificationWidget:UIComponent;
        
        public var interactionMsgWidget:UIComponent;
        
        public var SpectatorInfoWidget:UIComponent;
        
        public var KickVoteWidget:UIComponent;
        
        public var BossNamePlate:BossNameplateWidget;
        
        public var NonCriticalMessageWidget:NonCriticalGameMessageWidget;
        
        public var MusicNotification:MusicNotificationWidget;
        
        public var RhythmCounter:RhythmCounterWidget;
        
        public var ControllerWeaponSelectContainer:ControllerWeaponSelectWidget;
        
        public var barkNode:UIComponent;
        
        public var barkCount:int = 0;
        
        public var barkIndex:int = 0;
        
        public var maxBarkCount:int = 15;
        
        public var barkOffset:Number = 0.69;
        
        public var sw:Number;
        
        public var sh:Number;
        
        public var sX:Number;
        
        public var sY:Number;
        
        public var newScale:Number = 1;
        
        protected var _bSpectating:Boolean = false;
        
        public const ORIGINAL_STAGE_WIDTH:Number = 1920;
        
        public const ORIGINAL_STAGE_HEIGHT:Number = 1080;
        
        private var _HUDScale:Number = 1;
        
        public var layout:Layout;
        
        public var centerPoint:Point;
        
        private var _bConsoleBuild:Boolean;
        
        public function HudManager()
        {
            super();
            this.SpectatorInfoWidget.visible = false;
            _manager = this;
        }
        
        public static function get manager() : HudManager
        {
            return _manager;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        public function get bConsoleBuild() : Boolean
        {
            return this._bConsoleBuild;
        }
        
        public function set bConsoleBuild(param1:Boolean) : *
        {
            if(this._bConsoleBuild != param1)
            {
                this._bConsoleBuild = param1;
            }
        }
        
        public function set bSpectating(param1:Boolean) : void
        {
            this._bSpectating = param1;
            this.PlayerBackpackWidget.visible = !param1;
            this.PlayerStatWidgetMC.visible = !param1;
            if(this.SpectatorInfoWidget.visible)
            {
                this.SpectatorInfoWidget.visible = param1;
            }
            if(param1)
            {
                this.interactionMsgWidget.visible = false;
            }
        }
        
        public function set bossData(param1:Object) : void
        {
            this.WaveCompassWidget.visible = false;
            this.ChatBoxWidget.visible = false;
            this.PlayerStatWidgetMC.visible = false;
            this.WeaponSelectContainer.visible = false;
            if(this.ControllerWeaponSelectContainer)
            {
                this.ControllerWeaponSelectContainer.visible = false;
            }
            this.ScoreboardWidgetMC.visible = false;
            this.PriorityMsgWidget.visible = false;
            this.PlayerBackpackWidget.visible = false;
            this.voipWidget.visible = false;
            this.VoiceCommsWidget.visible = false;
            this.LevelUpNotificationWidget.visible = false;
            this.interactionMsgWidget.visible = false;
            this.SpectatorInfoWidget.visible = false;
            this.KickVoteWidget.visible = false;
            this.NonCriticalMessageWidget.visible = false;
            this.MusicNotification.visible = false;
            this.BossNamePlate.setText(!!param1.bossName ? param1.bossName : "",!!param1.subString ? param1.subString : "");
        }
        
        public function hideBossNamePlate() : void
        {
            this.WaveCompassWidget.visible = true;
            this.ChatBoxWidget.visible = true;
            this.PlayerStatWidgetMC.visible = true;
            this.PlayerBackpackWidget.visible = true;
            this.voipWidget.visible = true;
            this.VoiceCommsWidget.visible = true;
            this.bSpectating = this._bSpectating;
            this.BossNamePlate.visible = false;
        }
        
        public function createLayout() : *
        {
            this.centerPoint = new Point(stage.stageWidth / 2,stage.stageHeight / 2);
            root.transform.perspectiveProjection.projectionCenter = this.centerPoint;
            this.barkNode.layoutData = new LayoutData();
            this.barkNode.layoutData.alignV = "center";
            this.barkNode.layoutData.alignH = "right";
            this.barkNode.layoutData.offsetH = 0;
            this.barkNode.layoutData.offsetV = -128;
            this.WaveCompassWidget.layoutData = new LayoutData();
            this.WaveCompassWidget.layoutData.alignV = "top";
            this.WaveCompassWidget.layoutData.alignH = "left";
            this.WaveCompassWidget.layoutData.offsetH = 16;
            this.WaveCompassWidget.layoutData.offsetV = 16;
            this.voipWidget.layoutData = new LayoutData();
            this.voipWidget.layoutData.alignV = "center";
            this.voipWidget.layoutData.alignH = "left";
            this.voipWidget.layoutData.offsetH = 24;
            this.voipWidget.layoutData.offsetV = -70;
            this.ChatBoxWidget.layoutData = new LayoutData();
            this.ChatBoxWidget.layoutData.alignV = "bottom";
            this.ChatBoxWidget.layoutData.alignH = "left";
            this.ChatBoxWidget.layoutData.offsetH = 24;
            this.ChatBoxWidget.layoutData.offsetV = -216;
            this.KickVoteWidget.layoutData = new LayoutData();
            this.KickVoteWidget.layoutData.alignV = "bottom";
            this.KickVoteWidget.layoutData.alignH = "right";
            this.KickVoteWidget.layoutData.offsetH = -20;
            this.KickVoteWidget.layoutData.offsetV = -256;
            this.BossNamePlate.layoutData = new LayoutData();
            this.BossNamePlate.layoutData.alignV = "bottom";
            this.BossNamePlate.layoutData.alignH = "right";
            this.BossNamePlate.layoutData.offsetH = -8;
            this.BossNamePlate.layoutData.offsetV = -8;
            this.PlayerBackpackWidget.layoutData = new LayoutData();
            this.PlayerBackpackWidget.layoutData.alignV = "bottom";
            this.PlayerBackpackWidget.layoutData.alignH = "right";
            this.PlayerBackpackWidget.layoutData.offsetH = -20;
            this.PlayerBackpackWidget.layoutData.offsetV = -16;
            this.PlayerStatWidgetMC.layoutData = new LayoutData();
            this.PlayerStatWidgetMC.layoutData.alignV = "bottom";
            this.PlayerStatWidgetMC.layoutData.alignH = "left";
            this.PlayerStatWidgetMC.layoutData.offsetH = 16;
            this.PlayerStatWidgetMC.layoutData.offsetV = -16;
            this.PriorityMsgWidget.layoutData = new LayoutData();
            this.PriorityMsgWidget.layoutData.alignV = "center";
            this.PriorityMsgWidget.layoutData.alignH = "center";
            this.PriorityMsgWidget.layoutData.offsetH = 0;
            this.PriorityMsgWidget.layoutData.offsetV = 0;
            this.NonCriticalMessageWidget.layoutData = new LayoutData();
            this.NonCriticalMessageWidget.layoutData.alignV = "bottom";
            this.NonCriticalMessageWidget.layoutData.alignH = "center";
            this.NonCriticalMessageWidget.layoutData.offsetH = 0;
            this.NonCriticalMessageWidget.layoutData.offsetV = -64;
            this.interactionMsgWidget.layoutData = new LayoutData();
            this.interactionMsgWidget.layoutData.alignV = "bottom";
            this.interactionMsgWidget.layoutData.alignH = "center";
            this.interactionMsgWidget.layoutData.offsetV = -128;
            this.interactionMsgWidget.layoutData.offsetH = 0;
            this.SpectatorInfoWidget.layoutData = new LayoutData();
            this.SpectatorInfoWidget.layoutData.alignV = "bottom";
            this.SpectatorInfoWidget.layoutData.alignH = "center";
            this.SpectatorInfoWidget.layoutData.offsetV = -60;
            this.SpectatorInfoWidget.layoutData.offsetH = 0;
            this.LevelUpNotificationWidget.layoutData = new LayoutData();
            this.LevelUpNotificationWidget.layoutData.alignV = "bottom";
            this.LevelUpNotificationWidget.layoutData.alignH = "center";
            this.LevelUpNotificationWidget.layoutData.offsetV = -40;
            this.LevelUpNotificationWidget.layoutData.offsetH = 0;
            this.VoiceCommsWidget.layoutData = new LayoutData();
            this.VoiceCommsWidget.layoutData.alignV = "center";
            this.VoiceCommsWidget.layoutData.alignH = "center";
            this.VoiceCommsWidget.layoutData.offsetH = 0;
            this.VoiceCommsWidget.layoutData.offsetV = 0;
            this.ScoreboardWidgetMC.layoutData = new LayoutData();
            this.ScoreboardWidgetMC.layoutData.alignV = "center";
            this.ScoreboardWidgetMC.layoutData.alignH = "center";
            this.ScoreboardWidgetMC.layoutData.offsetH = 0;
            this.ScoreboardWidgetMC.layoutData.offsetV = 0;
            if(this.ControllerWeaponSelectContainer)
            {
                this.ControllerWeaponSelectContainer.layoutData = new LayoutData();
                this.ControllerWeaponSelectContainer.layoutData.alignV = "center";
                this.ControllerWeaponSelectContainer.layoutData.alignH = "center";
                this.ControllerWeaponSelectContainer.layoutData.offsetV = 0;
                this.ControllerWeaponSelectContainer.layoutData.offsetH = 0;
            }
            this.WeaponSelectContainer.layoutData = new LayoutData();
            this.WeaponSelectContainer.layoutData.alignV = "top";
            this.WeaponSelectContainer.layoutData.alignH = "center";
            this.WeaponSelectContainer.layoutData.offsetV = 0;
            this.WeaponSelectContainer.layoutData.offsetH = 0;
            this.MusicNotification.layoutData = new LayoutData();
            this.MusicNotification.layoutData.alignV = "top";
            this.MusicNotification.layoutData.alignH = "right";
            this.MusicNotification.layoutData.offsetV = 32;
            this.MusicNotification.layoutData.offsetH = -32;
            this.RhythmCounter.layoutData = new LayoutData();
            this.RhythmCounter.layoutData.alignV = "top";
            this.RhythmCounter.layoutData.alignH = "center";
            this.RhythmCounter.layoutData.offsetV = 0;
            this.RhythmCounter.layoutData.offsetH = 0;
            this.layout = new Layout();
            this.layout.tiedToStageSize = true;
            this.layout.hidden = false;
            addChild(this.layout);
        }
        
        override protected function configUI() : void
        {
            super.configUI();
            Extensions.enabled = true;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
            stage.addEventListener(Event.RESIZE,this.handleStageResize,false,0,true);
            if(this.layout == null)
            {
                this.createLayout();
            }
            this.handleStageResize();
        }
        
        function showLocalizedMessage(param1:String) : void
        {
            if(this.NonCriticalMessageWidget)
            {
                this.NonCriticalMessageWidget.message = param1;
            }
        }
        
        public function set newBark(param1:Object) : void
        {
            if(this.barkCount >= this.maxBarkCount)
            {
                return;
            }
            var _loc2_:HudBarkMessage = new HudBarkMC() as HudBarkMessage;
            this.barkNode.addChild(_loc2_);
            this.scaleChild(_loc2_);
            _loc2_.y = _loc2_.height + _loc2_.height * this.barkOffset * (this.barkIndex % this.maxBarkCount);
            _loc2_.addEventListener("onTweenComplete",this.removeUsedBark,false,0,true);
            _loc2_.text = param1;
            ++this.barkCount;
            ++this.barkIndex;
        }
        
        public function removeUsedBark(param1:Event) : void
        {
            var _loc2_:HudBarkMessage = null;
            _loc2_ = param1.currentTarget as HudBarkMessage;
            if(_loc2_ != null)
            {
                _loc2_.removeEventListener("onTweenComplete",this.removeUsedBark);
                this.barkNode.removeChild(_loc2_);
                --this.barkCount;
            }
        }
        
        public function handleStageResize(param1:Event = null) : void
        {
            this.sw = stage.stageWidth;
            this.sh = stage.stageHeight;
            this.sX = this.sw / this.ORIGINAL_STAGE_WIDTH;
            this.sY = this.sh / this.ORIGINAL_STAGE_HEIGHT;
            if(this.sX > this.sY)
            {
                this.newScale = this.sY;
            }
            else
            {
                this.newScale = this.sX;
            }
            if(this.newScale > 1)
            {
                this.newScale = 1;
            }
            stage.transform.perspectiveProjection.projectionCenter = new Point(this.sw / 2,this.sh / 2);
            this.UpdateElementScales();
            this.NonCriticalMessageWidget.message = "";
            TweenMax.to(this.PlayerStatWidgetMC,3,{
                "onComplete":this.start3d,
                "useFrames":true
            });
        }
        
        public function ForceConfigUI() : *
        {
            this.layout.reset();
        }
        
        public function set HUDScale(param1:Number) : void
        {
            if(this._HUDScale != param1)
            {
                this._HUDScale = param1;
                this.UpdateElementScales();
            }
        }
        
        public function set WeaponSelectY(param1:Number) : void
        {
            this.WeaponSelectContainer.y = param1;
        }
        
        public function UpdateElementScales() : void
        {
            this.scaleChild(this.WeaponSelectContainer);
            this.scaleChild(this.ControllerWeaponSelectContainer);
            this.scaleChild(this.ChatBoxWidget);
            this.scaleChild(this.voipWidget);
            this.scaleChild(this.ScoreboardWidgetMC);
            this.scaleChild(this.WaveCompassWidget);
            this.scaleChild(this.PlayerStatWidgetMC);
            this.scaleChild(this.VoiceCommsWidget);
            this.scaleChild(this.PlayerBackpackWidget);
            this.scaleChild(this.PriorityMsgWidget);
            this.scaleChild(this.interactionMsgWidget);
            this.scaleChild(this.LevelUpNotificationWidget);
            this.scaleChild(this.SpectatorInfoWidget);
            this.scaleChild(this.MusicNotification);
            this.scaleChild(this.NonCriticalMessageWidget);
            this.scaleChild(this.KickVoteWidget);
            this.scaleChild(this.BossNamePlate);
            this.scaleChild(this.RhythmCounter);
        }
        
        public function scaleChild(param1:UIComponent) : void
        {
            param1.scaleX = this.newScale * this._HUDScale;
            param1.scaleY = this.newScale * this._HUDScale;
        }
        
        public function start3d() : void
        {
            this.apply3d(this.WeaponSelectContainer,0,0,0,"center","center");
            this.apply3d(this.ControllerWeaponSelectContainer,0,0,0,"center","center");
            this.apply3d(this.PlayerStatWidgetMC,0,-24,0,"bottom","left");
            this.apply3d(this.PlayerBackpackWidget,0,24,0,"bottom","right");
            this.apply3d(this.KickVoteWidget,0,24,0,"bottom","right");
            this.apply3d(this.BossNamePlate,0,0,0,"bottom","right");
            this.apply3d(this.WaveCompassWidget,0,-24,0,"top","left");
            this.apply3d(this.SpectatorInfoWidget,0,0,288,"center","center");
            this.apply3d(this.LevelUpNotificationWidget,0,0,288,"center","center");
            this.apply3d(this.interactionMsgWidget,0,0,288,"center","center");
            this.apply3d(this.ChatBoxWidget,0,-24,0,"top","left");
            this.apply3d(this.voipWidget,0,-24,0,"top","left");
            this.apply3d(this.barkNode,0,24,0,"bottom","right");
            this.apply3d(this.PriorityMsgWidget,0,0,288,"center","center");
            this.apply3d(this.VoiceCommsWidget,0,0,288,"center","center");
            this.apply3d(this.ScoreboardWidgetMC,0,0,288,"center","center");
            this.apply3d(this.NonCriticalMessageWidget,0,0,0,"center","center");
            this.apply3d(this.MusicNotification,0,24,0,"top","right");
            this.apply3d(this.RhythmCounter,0,0,288,"top","center");
        }
        
        public function apply3d(param1:UIComponent, param2:Number, param3:Number, param4:Number, param5:String = "top", param6:String = "left") : void
        {
            var _loc7_:Number = NaN;
            var _loc8_:Number = NaN;
            var _loc9_:Number = NaN;
            var _loc10_:Number = NaN;
            var _loc13_:Sprite = null;
            var _loc11_:* = param1.x;
            var _loc12_:* = param1.y;
            if(param5 == "top")
            {
                _loc8_ = param1.y;
                _loc10_ = 0;
            }
            else if(param5 == "bottom")
            {
                _loc8_ = param1.y + param1.height;
                _loc10_ = -param1.height;
            }
            else if(param5 == "center")
            {
                _loc8_ = param1.y + param1.height / 2;
                _loc10_ = -(param1.height / 2);
            }
            if(param6 == "left")
            {
                _loc7_ = param1.x;
                _loc9_ = 0;
            }
            else if(param6 == "right")
            {
                _loc7_ = param1.x + param1.width;
                _loc9_ = -param1.width;
            }
            else if(param6 == "center")
            {
                _loc7_ = param1.x + param1.width / 2;
                _loc9_ = -(param1.width / 2);
            }
            else
            {
                _loc7_ = param1.x;
                _loc8_ = param1.y;
            }
            if(this.getChildByName("square" + param1.name) != null)
            {
                this.addChild(param1);
                this.removeChild(this.getChildByName("square" + param1.name));
                _loc13_ = null;
            }
            (_loc13_ = new Sprite()).name = "square" + param1.name;
            this.addChild(_loc13_);
            _loc13_.x = _loc7_;
            _loc13_.y = _loc8_;
            _loc13_.addChild(param1);
            param1.x = _loc9_;
            param1.y = _loc10_;
            _loc13_.rotationX = param2;
            _loc13_.rotationY = param3;
            _loc13_.z = param4;
        }
    }
}
