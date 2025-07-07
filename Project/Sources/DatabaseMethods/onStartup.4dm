// Must be non compiled and not as a component
If (Not:C34(Is compiled mode:C492)) & (Structure file:C489(*)=Structure file:C489)
	C_LONGINT:C283($Window_lref)
	$Window_lref:=Open form window:C675("ReleaseBuildNo_d"; Regular window:K27:1; 420; 200)
	BRING TO FRONT:C326($Window_lref)
	DIALOG:C40("ReleaseBuildNo_d")
	CLOSE WINDOW:C154
	
	ARRAY TEXT:C222($at_components; 0)
	COMPONENT LIST:C1001($at_components)
	
	If (Find in array:C230($at_components; "CodeSnippets")>0)
		EXECUTE METHOD:C1007("Snippet_ShowSelectorWindow")
	End if 
	
	If (Find in array:C230($at_components; "Mainfest Generator")>0)
		EXECUTE METHOD:C1007("Manifest_SetAuthor"; *; "Dani Beaubien")
		EXECUTE METHOD:C1007("Manifest_SetBuildDate"; *; Current date:C33)
		EXECUTE METHOD:C1007("Manifest_SetURL"; *; "http://openroaddevelopment.com")
		EXECUTE METHOD:C1007("Manifest_SetCopyright"; *; "Copyright "+String:C10(Year of:C25(Current date:C33))+" Open Road Development Inc.")
		EXECUTE METHOD:C1007("Manifest_SetVersion"; *; BuildNo_GetBuildNo_Comp.versionLong; True:C214)
	End if 
End if 
