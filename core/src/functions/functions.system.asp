<%
'================================================
' FUNCTIONS FOR SYSTEM MANAGEMENT
'
'
function getMachineName()
	on error resume next
	dim objSystem,ComputerName,IntMachinName
	set objSystem = server.CreateObject("ActiveDs.WinNTSystemInfo")
	if err.number = 0 then 
		getMachineName = objSystem.ComputerName
	else
		set objSystem = server.CreateObject("WScript.Network") 
		if err.number > 0 then 
			trapError
		else 
			getMachineName = objSystem.ComputerName
		end if
	end if
	set objSystem = Nothing
end function
%>
