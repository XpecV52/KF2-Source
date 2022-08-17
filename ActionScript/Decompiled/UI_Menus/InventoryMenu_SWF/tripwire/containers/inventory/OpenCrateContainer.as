package tripwire.containers.inventory
{
    import com.greensock.TimelineMax;
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import com.greensock.plugins.ScrambleTextPlugin;
    import com.greensock.plugins.TweenPlugin;
    import com.greensock.plugins.TypewriterPlugin;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import flash.ui.Keyboard;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.gfx.Extensions;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripUILoader;
    
    public class OpenCrateContainer extends TripContainer
    {
         
        
        public var itemNameText:TextField;
        
        public var itemTypeText:TextField;
        
        public var itemDescText:TextField;
        
        public var iconLoader:TripUILoader;
        
        public var imageLoader:MovieClip;
        
        public var confirmButton:TripButton;
        
        public var itemObject:Object;
        
        public var bDecryptPlayed:Boolean;
        
        public var crateHeader:TextField;
        
        public var blackBG:MovieClip;
        
        public var horzineLogo:MovieClip;
        
        public var confirmBlocker:MovieClip;
        
        public var crateLine0:TextField;
        
        public var crateLine1:TextField;
        
        public var crateLine2:TextField;
        
        public var crateLine3:TextField;
        
        public var crateLine4:TextField;
        
        public var crateLine5:TextField;
        
        public var crateLine6:TextField;
        
        public var crateLineArray:Array;
        
        public var crateDec0:MovieClip;
        
        public var crateDec1:MovieClip;
        
        public var crateDec2:MovieClip;
        
        public var crateDec3:MovieClip;
        
        public var crateDec4:MovieClip;
        
        public var crateDec5:MovieClip;
        
        public var crateDec6:MovieClip;
        
        public var crateDec7:MovieClip;
        
        public var crateDec8:MovieClip;
        
        public var crateArray:Array;
        
        public var itemNameString:String;
        
        public var defColor:uint = 12255231;
        
        public var highColor:uint = 64191;
        
        public var masterTimeline:TimelineMax;
        
        public var crateDecTimeline:TimelineMax;
        
        public var highlightDecTimeline:TimelineMax;
        
        public var revealTimeline:TimelineMax;
        
        public const startAnimDuration:int = 105;
        
        public const endAnimDuration:int = 45;
        
        public const loopDuration:int = 16;
        
        public var bItemReceived:Boolean = false;
        
        public var bLoopingStarted:Boolean = false;
        
        public function OpenCrateContainer()
        {
            this.masterTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.crateDecTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.highlightDecTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.revealTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            super();
            defaultFirstElement = currentElement = this.confirmButton;
            visible = false;
            defaultNumPrompts = 2;
            TweenPlugin.activate([ScrambleTextPlugin]);
            TweenPlugin.activate([TypewriterPlugin]);
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.iconLoader = TripUILoader(this.imageLoader.iconLoader);
            this.crateLineArray = [this.crateHeader,this.crateLine0,this.crateLine1,this.crateLine2,this.crateLine3,this.crateLine4,this.crateLine5,this.crateLine6];
            this.crateArray = [this.crateDec0,this.crateDec1,this.crateDec2,this.crateDec3,this.crateDec4,this.crateDec5,this.crateDec6,this.crateDec7,this.crateDec8];
            this.closeContainer();
            this.confirmButton.tabIndex = 1;
            this.confirmButton.addEventListener(ButtonEvent.PRESS,this.onConfirmClicked,false,0,true);
        }
        
        public function onConfirmClicked(param1:ButtonEvent) : void
        {
            this.bDecryptPlayed = false;
            this.bItemReceived = false;
            this.itemObject = null;
            this.closeContainer();
        }
        
        public function startAnimating() : *
        {
            this.bLoopingStarted = false;
            this.setCrateDecTimeline();
            this.sethighlightCrate();
            this.setMasterTimeline();
            openContainer();
        }
        
        public function set data(param1:Object) : void
        {
            if(param1)
            {
                this.itemObject = param1;
                this.bItemReceived = true;
                this.itemNameString = !!param1.label ? param1.label : "";
                this.itemTypeText.text = !!param1.typeRarity ? param1.typeRarity : "";
                this.itemDescText.text = !!param1.description ? param1.description : "";
                if(param1.iconURLLarge && param1.iconURLLarge != "")
                {
                    this.iconLoader.source = param1.iconURLLarge;
                }
                else
                {
                    this.imageLoader.visible = false;
                }
            }
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            dispatchEvent(new Event("containerClosed"));
        }
        
        public function testOpen() : void
        {
            this.openAnimation();
        }
        
        override protected function openAnimation() : *
        {
            this.masterTimeline.duration(this.startAnimDuration);
            this.masterTimeline.time(0);
            this.confirmBlocker.visible = true;
            this.confirmButton.visible = false;
            this.masterTimeline.play();
            mouseEnabled = mouseChildren = true;
            _bReadyForInput = true;
        }
        
        override protected function closeAnimation() : *
        {
            TweenMax.fromTo(this,6,{
                "z":0,
                "alpha":1
            },{
                "visible":false,
                "z":-128,
                "alpha":0,
                "blurFilter":{
                    "blurX":12,
                    "blurY":12,
                    "quality":1,
                    "remove":true
                },
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":onClosed
            });
        }
        
        public function setMasterTimeline() : void
        {
            this.masterTimeline.clear();
            this.masterTimeline.append(TweenMax.allTo(this.crateArray,1,{
                "x":332,
                "y":504,
                "alpha":0,
                "useFrames":true
            }));
            this.masterTimeline.append(TweenMax.allTo(this.crateLineArray,1,{
                "typewriter":"",
                "alpha":0,
                "useFrames":true
            }),"-=1");
            this.masterTimeline.append(TweenMax.allTo([this.itemTypeText,this.itemDescText,this.imageLoader,this.itemNameText,this.confirmButton],1,{
                "visible":false,
                "alpha":0,
                "useFrames":true
            }),"-=1");
            this.masterTimeline.append(TweenMax.fromTo(this,24,{
                "z":-128,
                "autoAlpha":0,
                "blurFilter":{
                    "blurX":12,
                    "blurY":12,
                    "quality":1
                }
            },{
                "z":0,
                "autoAlpha":1,
                "blurFilter":{
                    "blurX":0,
                    "blurY":0,
                    "quality":1,
                    "remove":true
                },
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onStart":this.playStartAnimationSound
            }),"-=1");
            this.masterTimeline.append(TweenMax.fromTo(this.blackBG,8,{"width":112},{
                "width":664,
                "ease":Cubic.easeOut,
                "useFrames":true
            }));
            this.masterTimeline.append(TweenMax.fromTo(this.blackBG,8,{"height":112},{
                "height":776,
                "ease":Cubic.easeOut,
                "useFrames":true
            }));
            this.masterTimeline.append(TweenMax.fromTo(this.horzineLogo,8,{
                "width":80,
                "height":80
            },{
                "width":640,
                "height":640,
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"-=8");
            this.masterTimeline.append(TweenMax.allTo(this.crateLineArray,1,{
                "alpha":1,
                "useFrames":true
            }));
            this.masterTimeline.append(TweenMax.to(this.crateHeader,24,{
                "typewriter":"KEY ACCEPTED",
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"+=16");
            this.masterTimeline.append(TweenMax.to(this.crateLine0,40,{
                "typewriter":"INITIALIZING TARGET...........",
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"+=16");
            this.masterTimeline.append(TweenMax.to(this.crateLine1,16,{
                "typewriter":"BYPASSING HORZINE SECURITY.........",
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"+=8");
            this.masterTimeline.append(TweenMax.to(this.crateLine2,56,{
                "typewriter":"DISABLING SECURITY PROTOCOLS.........................................",
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"+=16");
            this.masterTimeline.append(TweenMax.to(this.crateLine3,40,{
                "typewriter":"ACCESSING INTERNAL DATABASE............",
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"+=16");
            this.masterTimeline.append(TweenMax.to(this.crateLine4,16,{
                "typewriter":"VERIFYING INTERNAL DATABASE................",
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"+=8");
            this.masterTimeline.append(TweenMax.to(this.crateLine5,56,{
                "typewriter":"INITIALIZING SELECTION PROCEDURE..............................",
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"+=16");
            this.masterTimeline.append(TweenMax.to(this.crateLine6,24,{
                "typewriter":"UNLOCKING...............",
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"+=24");
            this.masterTimeline.append(this.crateDecTimeline.play());
            this.masterTimeline.append(TweenMax.to(this.itemNameText,1,{
                "visible":true,
                "y":201.25,
                "alpha":1,
                "useFrames":true
            }));
            this.masterTimeline.append(TweenMax.to(this.itemNameText,16,{
                "typewriter":"LGA92E-W921ZK9-2095Z-WJL-WI92D290-2924",
                "useFrames":true,
                "onComplete":this.highlightCrateDec
            }),"-=1");
        }
        
        public function playStartAnimationSound() : void
        {
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"SoundTheme_Crate","Crate_Start");
            }
        }
        
        public function playEndAnimationSound() : void
        {
            ExternalInterface.call("Callback_CrateOpenComplete",this.itemObject.rarity);
        }
        
        public function setCrateDecTimeline() : void
        {
            this.crateDecTimeline.clear();
            this.crateDecTimeline.append(TweenMax.allFromTo(this.crateArray,16,{"alpha":0},{
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            }));
            this.crateDecTimeline.append(TweenMax.fromTo(this.crateDec1,16,{
                "x":332,
                "y":504
            },{
                "x":156,
                "y":328,
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"-=16");
            this.crateDecTimeline.append(TweenMax.fromTo(this.crateDec2,16,{
                "x":332,
                "y":504
            },{
                "x":332,
                "y":328,
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"-=16");
            this.crateDecTimeline.append(TweenMax.fromTo(this.crateDec3,16,{
                "x":332,
                "y":504
            },{
                "x":508,
                "y":328,
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"-=16");
            this.crateDecTimeline.append(TweenMax.fromTo(this.crateDec4,16,{
                "x":332,
                "y":504
            },{
                "x":156,
                "y":504,
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"-=16");
            this.crateDecTimeline.append(TweenMax.fromTo(this.crateDec5,16,{
                "x":332,
                "y":504
            },{
                "x":508,
                "y":504,
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"-=16");
            this.crateDecTimeline.append(TweenMax.fromTo(this.crateDec6,16,{
                "x":332,
                "y":504
            },{
                "x":156,
                "y":680,
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"-=16");
            this.crateDecTimeline.append(TweenMax.fromTo(this.crateDec7,16,{
                "x":332,
                "y":504
            },{
                "x":332,
                "y":680,
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"-=16");
            this.crateDecTimeline.append(TweenMax.fromTo(this.crateDec8,16,{
                "x":332,
                "y":504
            },{
                "x":508,
                "y":680,
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"-=16");
        }
        
        public function sethighlightCrate() : void
        {
            this.highlightDecTimeline.clear();
            this.highlightDecTimeline.stop();
            var _loc1_:int = 0;
            var _loc2_:int = 0;
            while(_loc2_ < this.loopDuration)
            {
                this.highlightDecTimeline.append(TweenMax.to(this.crateArray[_loc1_],1,{
                    "alpha":1,
                    "removeTint":true,
                    "useFrames":true
                }),"+=1");
                if(_loc2_ != this.loopDuration - 1)
                {
                    _loc1_ = 0 + Math.round(Math.random() * (8 - 0));
                }
                else
                {
                    _loc1_ = 0;
                }
                this.highlightDecTimeline.append(TweenMax.to(this.crateArray[_loc1_],1,{
                    "tint":this.highColor,
                    "useFrames":true
                }),"-=1");
                _loc2_++;
            }
        }
        
        public function highlightCrateDec() : void
        {
            if(Extensions.gfxProcessSound != null && !this.bLoopingStarted)
            {
                this.bLoopingStarted = true;
                Extensions.gfxProcessSound(this,"SoundTheme_Crate","Crate_Get_LP");
            }
            this.highlightDecTimeline.time(0);
            this.highlightDecTimeline.play();
            if(this.bItemReceived && this.bDecryptPlayed)
            {
                this.setRevealTimeline();
                this.revealTimeline.duration(this.endAnimDuration);
                this.revealTimeline.time(0);
                TweenMax.to(this.itemNameText,this.loopDuration * 2,{
                    "scrambleText":{
                        "text":this.itemNameString,
                        "revealDelay":this.loopDuration * 2 - 8
                    },
                    "useFrames":true,
                    "onComplete":this.revealTimeline.play
                });
            }
            else
            {
                TweenMax.to(this.itemNameText,this.loopDuration * 2,{
                    "scrambleText":{
                        "text":"GAWESW-952JW9A-BNIL25-76524-WLJ2SK92-2S2",
                        "revealDelay":this.loopDuration * 2 - 8
                    },
                    "useFrames":true,
                    "onComplete":this.highlightCrateDec
                });
                this.bDecryptPlayed = true;
            }
        }
        
        public function setRevealTimeline() : void
        {
            this.revealTimeline.clear();
            this.revealTimeline.stop();
            this.revealTimeline.append(TweenMax.fromTo(this.imageLoader,16,{
                "visible":true,
                "alpha":0,
                "width":144,
                "height":144,
                "y":504
            },{
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onStart":this.playEndAnimationSound
            }));
            this.revealTimeline.append(TweenMax.allTo([this.crateArray,this.crateLineArray],16,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            }));
            this.revealTimeline.append(TweenMax.to(this.itemNameText,16,{
                "y":13.3,
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"+=32");
            this.revealTimeline.append(TweenMax.to(this.imageLoader,16,{
                "y":184,
                "width":256,
                "height":256,
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"-=16");
            this.revealTimeline.append(TweenMax.allFromTo([this.itemTypeText,this.itemDescText],16,{
                "visible":true,
                "alpha":0
            },{
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            }),"+=16");
            this.revealTimeline.append(TweenMax.to(this.confirmBlocker,1,{
                "visible":false,
                "useFrames":true
            }));
            this.revealTimeline.append(TweenMax.fromTo(this.confirmButton,16,{
                "visible":true,
                "alpha":0
            },{
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            }));
        }
        
        public function animCheck() : void
        {
        }
        
        public function testCrate(param1:KeyboardEvent) : void
        {
            if(param1.keyCode == 70)
            {
                this.bItemReceived = true;
            }
            else if(param1.keyCode == Keyboard.A)
            {
                openContainer();
            }
        }
    }
}
