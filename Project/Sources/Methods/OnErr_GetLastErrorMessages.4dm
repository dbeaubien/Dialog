//%attributes = {"invisible":true,"preemptive":"capable"}
// OnErr_GetLastErrorMessages () : errorMessages
//
// DESCRIPTION
//   Returns the text of the last error encountered.
//
#DECLARE()->$error_message : Text
// ----------------------------------------------------
$error_message:=""

var $i : Integer
For ($i; 1; Size of array:C274(gErrorTextArr))
	If ($i#1)
		$error_message+=Char:C90(Carriage return:K15:38)
	End if 
	$error_message+=gErrorTextArr{$i}
End for 
