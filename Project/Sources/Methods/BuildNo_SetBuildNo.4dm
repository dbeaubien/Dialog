//%attributes = {"invisible":true,"preemptive":"capable"}
// BuildNo_SetBuildNo (year; releaseNo; buildNo)
// 
// DESCRIPTION
//   Stores the build no object for the component.
//   For example: {"releaseYear":"2017","releaseNo":"r1","buildNo":"20170529","versionShort":"2017.r1","versionLong":"2017.r1 (build 20170529)"}
//   
//   NOTE: Cannot be run in a pre-emptive process.
//   NOTE: Private to the component
//
#DECLARE($vt_stringYear : Text; $vt_stringReleaseNo : Text; $vt_stringBuildNo : Text)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=3)

// Construct the bulid No obj
var $vo_buildNoObj : Object
$vo_buildNoObj:={}
$vo_buildNoObj.releaseYear:=$vt_stringYear
$vo_buildNoObj.releaseNo:=$vt_stringReleaseNo
$vo_buildNoObj.buildNo:=$vt_stringBuildNo
$vo_buildNoObj.versionShort:=$vt_stringYear+"."+$vt_stringReleaseNo
$vo_buildNoObj.versionLong:=$vt_stringYear+"."+$vt_stringReleaseNo+" (build "+$vt_stringBuildNo+")"

ARRAY TEXT:C222($at_buildNo; 1)
$at_buildNo{1}:=JSON Stringify:C1217($vo_buildNoObj)

// Save it into the Resources
TEXT TO DOCUMENT:C1237(Get 4D folder:C485(Current resources folder:K5:16)+"build.json"; JSON Stringify:C1217($vo_buildNoObj))
