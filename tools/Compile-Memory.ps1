$Output = {
    $Display = "MD"

    $Var1 = "P1"
    $Data1 = @"
< f1
f3 >
< f2
f4 >
"@

    $Var2 = "P2"
    $Data2 = @"
< f5
f7 >
< f6
f8 >
"@

    $Var3 = "P3"
    $Data3 = @"
< f9
f11 >
< f10
f12 >
"@

    "What each Page would look like:"
    "==========="
    "$Var1 :"
    "-----------"
    $Data1
    "==========="
    "$Var2 :"
    "-----------"
    $Data2
    "==========="
    "$Var3 :"
    "-----------"
    $Data3
    "-----------"
    "==========="
    $Data1 = $Data1 -replace "`r`n", "\n"
    $Data2 = $Data2 -replace "`r`n", "\n"
    $Data3 = $Data3 -replace "`r`n", "\n"
    ""
    "What device properies are needed to be set to in a memory chip:"
    ""
    "$Var1=`"\n$Data1`""
    "$Var2=`"\n$Data2`""
    "$Var3=`"\n$Data3`""
    ""
}.Invoke()
$Output | Set-Content -Path ..\memory.txt -Force -PassThru