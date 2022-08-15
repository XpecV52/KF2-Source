/**
 * Copyright (C) 2011 Tripwire Interactive LLC
 *
 * @author  Michiel 'elmuerte' Hendriks
 */
class HashLib extends Object abstract;

function string getAlgName();

function string getHash(coerce string inputData);

defaultproperties
{
   Name="Default__HashLib"
   ObjectArchetype=Object'Core.Default__Object'
}
