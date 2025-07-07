
C_POINTER:C301($vp_stringYear)
$vp_stringYear:=OBJECT Get data source:C1265(*; "string_year")
$vp_stringYear->:=String:C10(Num:C11($vp_stringYear->)-1)

// Reset this to "r1" as well
C_POINTER:C301($vp_stringReleaseNo)
$vp_stringReleaseNo:=OBJECT Get data source:C1265(*; "string_releaseNo")
$vp_stringReleaseNo->:="r1"
