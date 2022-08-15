/*******************************************************************************
 * TWSplatterMap2D generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TWSplatterMap2D extends Object
    native
    noexport;

/** The texture which contains the splatter-map data. */
var() private const editconst TWSplatterMapTexture2D Texture;
/** The scale which is applied to the splatter-map coordinates before sampling the splatter-map textures. */
var() private const editconst Vector2D CoordinateScale;
/** The bias which is applied to the splatter-map coordinates before sampling the splatter-map textures. */
var() private const editconst Vector2D CoordinateBias;
