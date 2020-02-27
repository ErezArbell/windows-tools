FileName = CreateObject( "WScript.Shell" ).ExpandEnvironmentStrings( "%USERPROFILE%" ) & "\Documents\Activity_log\Activity_log.txt"
Const ForReading = 1, ForWriting = 2, ForAppending = 8

Task = InputBox("What did you do in the last hour", Now)

If IsEmpty(Task) Then
    'cancelled
    Wscript.Quit
End If

Set FSO = CreateObject("Scripting.FileSystemObject")

If FSO.FileExists(FileName) Then
  Set File = FSO.GetFile(FileName)
  Set Output = File.OpenAsTextStream(ForAppending)
Else
  Set Output = FSO.CreateTextFile(FileName)
End If

dtmDayOfWeek = Weekday(Date(), 1)
Select Case dtmDayOfWeek
    Case 1 DayName = "Sunday"
    Case 2 DayName = "Monday"
    Case 3 DayName = "Tuesday"
    Case 4 DayName = "Wednesday"
    Case 5 DayName = "Thursday"
    Case 6 DayName = "Friday"
    Case 7 DayName = "Saturday"
End Select

Output.WriteLine(DayName & " " & Now)
Output.WriteLine("    " & Task)
Output.Close