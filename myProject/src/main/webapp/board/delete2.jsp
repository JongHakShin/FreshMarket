<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="bean.BoardBean" %>

<jsp:useBean id="bMgr" class="bean.BoardMgr" />   
    
<%
	request.setCharacterEncoding("utf-8");
	String pass = request.getParameter("pass");
	
	if(pass != null && !pass.equals("")){
		BoardBean bean = (BoardBean)session.getAttribute("bean");
		if(pass.equals(bean.getPass())){
			bMgr.deleteBoard(bean.getNum());
			response.sendRedirect("list.jsp");
		} else {
%>
<script>
	alert("입력하시 비밀번호가 일치하지 않습니다.");
	history.back();
</script>
<%			
		}//if(pass.equals(bean.getPass()))
	}//if(pass != null && !pass.equals(""))
%>    

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="../Style.css" rel="stylesheet" type="text/css">
    <link href="boardStyle.css" rel="stylesheet" type="text/css">
    
    <title>JSP Board</title>
</head>
<body>
    <div class="pageName">사용자의 비밀번호를 입력해 주세요</div>
    <form name="delFrm" method="post" action="delete.jsp">
        <table>
            <tr>
                <td style="text-align: center;">
                    <input name="pass" type="password" size="17" maxlength="15">
                </td>
            </tr>
            <tr>
                <td><hr></td>
            </tr>
            <tr>
                <td class="buttons">
                    <button type="button" onclick="check()">삭제완료</button>&nbsp;&nbsp;
                    <button type="reset">다시쓰기</button>&nbsp;&nbsp;
                    <button type="button" onclick="history.go(-1)">뒤로</button>
                </td>
            </tr>
        </table>
    </form>
</body>

<script>
	function check(){
		if(document.delFrm.pass.value == ""){
			alert("패스워드를 입력해 주세요");
			document.delFrm.pass.focus();
			return;
		}
		
		document.delFrm.submit();
	}
</script>

</html>    