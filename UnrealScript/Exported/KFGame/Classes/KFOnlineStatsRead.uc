//=============================================================================
// KFOnlineStatsRead
//=============================================================================
// The KF 2 game stats class that holds and modifies the read stats data
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Joshua Rowan 3/4/2014
//=============================================================================

class KFOnlineStatsRead extends OnlineStatsRead
	native;



 


 


  



 



 




 



 




 



 



 



 



 



 





 


 



 







#linenumber 14

var	KFOnlineStatsWrite		LinkedWriteObject;

var	UniqueNetID OwningUniqueID;
/** Sets when Steam's UserStatsReceived callback triggers. */
var EOnlineEnumerationReadState UserStatsReceivedState;

/** Debugging */
var 		bool 	bLogStatsRead;

function OnStatsInitialized(bool bWasSuccessful)
{
	if( !bWasSuccessful)
	{
		WarnInternal("##########################################################################");
		WarnInternal("KFOnlineStatsRead: Unable to get Steam statistics.  Stats will not be set!");
		WarnInternal("##########################################################################");
	}
	else
	{
		OnReadComplete();
	}
}
//@HSL_MOD_BEGIN - amiller 3/30/2016 - Adding support for saving Stats object to SaveData
native function NativeOnReadComplete();

event OnReadComplete()
{
	NativeOnReadComplete();
	if (bLogStatsRead) LogInternal("KFOnlineStatsRead: OnReadComplete called, Rows[0].Columns.Length=" $ Rows[0].Columns.Length @ "self:'"$self$"'",'DevOnline');

}
//@HSL_MOD_END

defaultproperties
{
   ViewId=1
   ColumnIds(0)=1
   ColumnIds(1)=2
   ColumnIds(2)=10
   ColumnIds(3)=11
   ColumnIds(4)=20
   ColumnIds(5)=21
   ColumnIds(6)=30
   ColumnIds(7)=31
   ColumnIds(8)=40
   ColumnIds(9)=41
   ColumnIds(10)=50
   ColumnIds(11)=51
   ColumnIds(12)=60
   ColumnIds(13)=61
   ColumnIds(14)=70
   ColumnIds(15)=71
   ColumnIds(16)=80
   ColumnIds(17)=81
   ColumnIds(18)=90
   ColumnIds(19)=91
   ColumnIds(20)=200
   ColumnIds(21)=201
   ColumnIds(22)=22
   ColumnIds(23)=42
   ColumnIds(24)=202
   ColumnIds(25)=203
   ColumnIds(26)=2000
   ColumnIds(27)=2001
   ColumnIds(28)=2002
   ColumnIds(29)=2003
   ColumnIds(30)=2004
   ColumnIds(31)=2005
   ColumnIds(32)=2006
   ColumnIds(33)=2007
   ColumnMappings(0)=(Id=1)
   ColumnMappings(1)=(Id=2)
   ColumnMappings(2)=(Id=10)
   ColumnMappings(3)=(Id=11)
   ColumnMappings(4)=(Id=20)
   ColumnMappings(5)=(Id=21)
   ColumnMappings(6)=(Id=30)
   ColumnMappings(7)=(Id=31)
   ColumnMappings(8)=(Id=40)
   ColumnMappings(9)=(Id=41)
   ColumnMappings(10)=(Id=50)
   ColumnMappings(11)=(Id=51)
   ColumnMappings(12)=(Id=60)
   ColumnMappings(13)=(Id=61)
   ColumnMappings(14)=(Id=70)
   ColumnMappings(15)=(Id=71)
   ColumnMappings(16)=(Id=80)
   ColumnMappings(17)=(Id=81)
   ColumnMappings(18)=(Id=90)
   ColumnMappings(19)=(Id=91)
   ColumnMappings(20)=(Id=200)
   ColumnMappings(21)=(Id=201)
   ColumnMappings(22)=(Id=22)
   ColumnMappings(23)=(Id=42)
   ColumnMappings(24)=(Id=202)
   ColumnMappings(25)=(Id=203)
   ColumnMappings(26)=(Id=2000)
   ColumnMappings(27)=(Id=2001)
   ColumnMappings(28)=(Id=2002)
   ColumnMappings(29)=(Id=2003)
   ColumnMappings(30)=(Id=2004)
   ColumnMappings(31)=(Id=2005)
   ColumnMappings(32)=(Id=2006)
   ColumnMappings(33)=(Id=2007)
   Name="Default__KFOnlineStatsRead"
   ObjectArchetype=OnlineStatsRead'Engine.Default__OnlineStatsRead'
}
