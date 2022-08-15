/*******************************************************************************
 * ForceFieldShapeBox generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ForceFieldShapeBox extends ForceFieldShape
    native(ForceField)
    editinlinenew;

var export editinline DrawBoxComponent Shape;

event Vector GetRadii()
{
    return Shape.BoxExtent;
}

event FillBySphere(float Radius)
{
    Shape.BoxExtent.X = Radius;
    Shape.BoxExtent.Y = Radius;
    Shape.BoxExtent.Z = Radius;
}

event FillByBox(Vector Extent)
{
    Shape.BoxExtent = Extent;
}

event FillByCapsule(float Height, float Radius)
{
    Shape.BoxExtent.X = Radius;
    Shape.BoxExtent.Y = Radius;
    Shape.BoxExtent.Z = Radius + (Height / float(2));
}

event FillByCylinder(float BottomRadius, float TopRadius, float Height, float HeightOffset)
{
    Shape.BoxExtent.X = FMax(BottomRadius, TopRadius);
    Shape.BoxExtent.Y = Shape.BoxExtent.X;
    Shape.BoxExtent.Z = (Height / float(2)) + Abs(HeightOffset);
}

event PrimitiveComponent GetDrawComponent()
{
    return Shape;
}

defaultproperties
{
    begin object name=DrawBox0 class=DrawBoxComponent
        ReplacementPrimitive=none
    object end
    // Reference: DrawBoxComponent'Default__ForceFieldShapeBox.DrawBox0'
    Shape=DrawBox0
}