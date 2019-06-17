<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<HTML>
<HEAD>
	<TITLE>Itcast OA</TITLE>
	 <%@include file="/WEB-INF/jsp/public/header.jsp" %>
<%-- 	<LINK HREF="${pageContext.request.contextPath}/style/blue/login.css" type=text/css rel=stylesheet /> --%>
</HEAD>

<BODY LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0  style="background-image: url(style/images/login_bg.gif);
    color: #004779;
    font-size: 12px;
    font-family: 宋体;">
<s:form METHOD="post" NAME="actForm" action="user_login" namespace="/">
    <DIV ID="CenterAreaBg" style="margin-left:500px;">
        <DIV ID="CenterArea">
            <DIV ID="LoginInfo" style="margin-top:320px">
            	<font color="red">
					<s:actionerror/>   <!--  错误提示 -->
            	</font>
                <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 width=50%>
                    <TR>
                        <TD width=45 CLASS="Subject">用户名</TD>
                        <TD><INPUT SIZE="20" CLASS="TextField" TYPE="text" NAME="loginName" /></TD>
                        <TD ROWSPAN="2" STYLE="padding-left:10px;"><INPUT TYPE="image" SRC="${pageContext.request.contextPath}/style/blue/images/login/userLogin_button.gif"/></TD>
                    </TR>
                    <TR>
                        <TD CLASS="Subject">密码</TD>
                        <TD><INPUT SIZE="20" CLASS="TextField" TYPE="password" NAME="password" /></TD>
                    </TR>
                </TABLE>
            </DIV>
        </DIV>
    </DIV>
</s:form>
</BODY>

</HTML>

