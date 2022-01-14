package bean;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/board/boardUpdate")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		BoardBean oldBean = (BoardBean)session.getAttribute("bean");
		
		BoardBean newBean = new BoardBean();
		newBean.setNum(Integer.parseInt(request.getParameter("num")));
		newBean.setName(request.getParameter("name"));
		newBean.setSubject(request.getParameter("subject"));
		newBean.setContent(request.getParameter("content"));
		newBean.setPass(request.getParameter("pass"));
		
		BoardMgr bMgr = new BoardMgr();
		PrintWriter out = response.getWriter();
		if(oldBean.getPass().equals(newBean.getPass())) {
			bMgr.updateBoard(newBean);
			String url = "read.jsp?num="+ newBean.getNum();
			response.sendRedirect(url);
		} else {
			out.println("<script>");
			out.println("alert('입력하신 비밀번호가 일치하지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}

}
