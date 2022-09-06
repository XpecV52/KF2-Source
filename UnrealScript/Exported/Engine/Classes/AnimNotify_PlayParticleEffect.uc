/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class AnimNotify_PlayParticleEffect extends AnimNotify
	native(Anim);

/** The Particle system to play **/
var() ParticleSystem PSTemplate;

/** If this effect should be considered extreme content **/
var() bool bIsExtremeContent;

/** If this is extreme content(bIsExtremeContent == TRUE), play this instead **/
var() ParticleSystem PSNonExtremeContentTemplate;

/** If this particle system should be attached to the location.**/
var() bool bAttach;

/** The socketname in which to play the particle effect.  Looks for a socket name first then bone name **/
var() name SocketName;

/** The bone name in which to play the particle effect. Looks for a socket name first then bone name **/
var() name BoneName;

/** If TRUE, the particle system will play in the viewer as well as in game */
var() editoronly bool bPreview;

/** If Owner is hidden, skip particle effect */
var() bool bSkipIfOwnerIsHidden;

/** Parameter name for the bone socket actor - SkelMeshActorParamName in the LocationBoneSocketModule.
  *  (Default value in module is 'BoneSocketActor')
  */
var() name BoneSocketModuleActorName;


var() bool bUsePostUpdateWorkTickGroup;


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   bSkipIfOwnerIsHidden=True
   BoneSocketModuleActorName="BoneSocketActor"
   NotifyColor=(B=200,G=255,R=200,A=255)
   Name="Default__AnimNotify_PlayParticleEffect"
   ObjectArchetype=AnimNotify'Engine.Default__AnimNotify'
}
