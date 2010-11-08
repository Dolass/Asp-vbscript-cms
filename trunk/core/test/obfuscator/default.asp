<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file = "../../core/include/bootstrap.asp"-->
<% 
session(CUSTOM_MESSAGE) = getContent()

function getContent()
dim eml, subj, hov, lnk, result
if len(request("email"))>0 then
	eml = request("email")
	subj = iif(len(request("subject"))>0,request("subject"),"")
	hov = iif(len(request("hover"))>0,request("hover"),iif(len(subj)>0,subj,eml))
	lnk = iif(len(request("link"))>0,request("link"),iif(len(subj)>0,subj,eml))
	
	if len(subj)>0 then eml = eml & "?subject=" & subj
	
	result = EmailObfuscate("<a href=""mailto:"&eml&""" title="""&hov&""">"&lnk&"</a>")
end if
%>
<form id="form1" name="form1" method="post" action="default.asp">
  <label for="email"></label>
  <table width="500" border="0" cellspacing="4" cellpadding="0">
    <caption>
      Email Obfuscator
    </caption>
    <tr>
      <td width="103">
        <label for="label">Email Address</label>      </td>
      <td width="339"><input name="email" type="text" class="style1" id="email" accesskey="e" tabindex="1" value="<%=request("email")%>"/></td>
    </tr>
    <tr>
      <td>
        <label for="subject">Subject Line</label>      </td>
      <td><input name="subject" type="text" id="subject" accesskey="s" tabindex="2" value="<%=request("subject")%>"/></td>
    </tr>
    <tr>
      <td>
        <label for="link">Link Text</label>      </td>
      <td><input name="link" type="text" id="link" accesskey="l" tabindex="3" value="<%=request("link")%>"/></td>
    </tr>
    <tr>
      <td>
        <label for="hover">Hover Text</label>      </td>
      <td><input name="hover" type="text" id="hover" accesskey="h" tabindex="4" value="<%=request("hover")%>"/></td>
    </tr>
    <tr>
      <td><label for="result">Result</label></td>
      <td>
      <textarea name="result" id="result" cols="45" rows="5" accesskey="r" tabindex="5"></textarea></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="submit" id="submit" value="Obfuscate" tabindex="6" /></td>
    </tr>
  </table>
  <br />
</form>

<script type='text/javascript'>
//<![CDATA[
<% if len(result)>0 then %>
var strTemp = '<%=result%>'
document.getElementById('result').value='<%=result%>';
document.getElementById('result').focus();
<% else %>
document.getElementById('email').focus();
<% end if %>
//]]>
</script>
<% 
end function
%>
