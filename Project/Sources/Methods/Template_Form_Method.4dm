//%attributes = {}

var $update_timer_message : Boolean
Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.auto_cancel_message:=""
		Form:C1466.button_pressed:=""
		If (Form:C1466.auto_cancel_in_seconds>0)
			Form:C1466.auto_cancel_at_timestamp:=TS_FromDateTime(Current date:C33; Current time:C178)
			Form:C1466.auto_cancel_at_timestamp+=Form:C1466.auto_cancel_in_seconds
			SET TIMER:C645(55)
		Else 
			Form:C1466.auto_cancel_at_timestamp:=0
		End if 
		$update_timer_message:=True:C214
		
		
	: (Form event code:C388=On Timer:K2:25)
		$update_timer_message:=True:C214
		If (TS_FromDateTime(Current date:C33; Current time:C178)>=Form:C1466.auto_cancel_at_timestamp)
			Form:C1466.button_pressed:="Cancel"
			CANCEL:C270
		End if 
		
End case 

If ($update_timer_message)
	var $num_seconds; $num_minutes : Integer
	$num_seconds:=Form:C1466.auto_cancel_at_timestamp-TS_FromDateTime()
	If ($num_seconds>120)
		$num_minutes:=$num_seconds\60
		$num_seconds:=Mod:C98($num_seconds; 60)
		Form:C1466.auto_cancel_message:="This dialog auto cancels in less than "+String:C10($num_minutes+1)+" minutes."
		
	Else 
		Form:C1466.auto_cancel_message:="This dialog auto cancels in "+String:C10($num_seconds)+" secs."
	End if 
	
End if 