//%attributes = {"invisible":true,"preemptive":"capable"}
// BuildNo_GetBuildNo_Comp () : buildNoObj
// 
// DESCRIPTION
//   Returns a build no object or the component.
//   For example: {"releaseYear":"2017","releaseNo":"r1","buildNo":"20170529","versionShort":"2017.r1","versionLong":"2017.r1 (build 20170529)"}
//
//   NOTE: Cannot be run in a pre-emptive process.
//
#DECLARE()->$build_object : Object
// ----------------------------------------------------

var $build_file : 4D:C1709.File
$build_file:=File:C1566(Get 4D folder:C485(Current resources folder:K5:16)+"build.json"; fk platform path:K87:2)
If (Not:C34($build_file.exists))
	BuildNo_SetBuildNo(String:C10(Year of:C25(Current date:C33)); "r1"; Date2String(Current date:C33; "yyyymmdd"))
End if 

var $raw_json : Text
$raw_json:=$build_file.getText()

$build_object:=JSON Parse:C1218($raw_json)