<%		
function contentEdit()
	page.setName("Edit Product")
	myForm.Action = "?update"
	if (myForm.getValue(strKey)<> "") then
		contentEdit = buildFormContents(myForm.getValue(strKey))
	elseif Request.QueryString("edit") <> "" then 
		contentEdit = buildFormContents(Request.QueryString("edit"))
	else
		strError = "<p>No "&strContent&" was selected for editing. <br/>Would you like to:<ul> "& vbcrlf & _
			"<li><a href='?view'>select a "&strContent&"</a> to edit</li> " & vbcrlf & _
			"<li><a href='?create'>create a new "&strContent&"</a></li></ul></p>"
		contentEdit = strError
		debugError(strError)
	end if
end function
%>
