<HTML>
<HEAD>
    <TITLE>没有权限</TITLE>
   <%@include file="/WEB-INF/jsp/public/header.jsp" %>
</HEAD>
<BODY>

<DIV ID="Title_bar">
    <DIV ID="Title_bar_Head">
        <DIV ID="Title_Head"></DIV>
        <DIV ID="Title">
            <IMG BORDER="0" WIDTH="13" HEIGHT="13" SRC="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 提示
        </DIV>
        <DIV ID="Title_End"></DIV>
    </DIV>
</DIV>



<DIV ID="MainArea">
		<DIV CLASS="ItemBlock_Title1">
        </DIV> 

        <DIV CLASS="ItemBlockBorder" STYLE="margin-left: 15px;">
            <DIV CLASS="ItemBlock" STYLE="text-align: center; font-size: 16px;">
                不好意思，您没有该权限访问此页面
            </DIV>
        </DIV>
        
 
        <DIV ID="InputDetailBar">
            <A HREF="javascript:history.go(-1);"><IMG SRC="${pageContext.request.contextPath}/style/images/goBack.png"/></A>
        </DIV>
    
</DIV>

</BODY>
</HTML>
