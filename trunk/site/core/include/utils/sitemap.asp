<!--#include file="../global.asp"-->
<!--#include file="../../src/classes/class.sitemap.asp"-->
<%
page.setFile("default.asp")

dim sMap : set sMap = new SiteMap

' xml format
if request.QueryString() = "sitemap.xml" then sMap.XML

' html format (shown inside main content of page)
function customContent(byval area)
	select case area
		case "main"
			page.ignoreDBContent = true
			customContent = div(h2("Sitemap")&sMap.HTML,globalvarfill("{SITENAME} Sitemap"),"sitemap",null)
		case else
	end select
end function
%>
<!--#include file = "../template.asp"-->
