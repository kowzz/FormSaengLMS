package kh.semi.lms.professor.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.board.model.service.BoardService;
import kh.semi.board.model.vo.BoardVo;
import kh.semi.member.model.vo.MemberVo;

/**
 * Servlet implementation class PfLmsInsertDoBoardServlet
 */
@WebServlet("/board/insertdo")
public class PfLmsInsertDoBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PfLmsInsertDoBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title = request.getParameter("title");
		MemberVo mvo = (MemberVo)request.getSession().getAttribute("ssMemberVo");
		String writer = "아무개";
		String content = request.getParameter("content");
		
		BoardVo vo = new BoardVo(); 
		vo.setbATitle(title);
		vo.setbAWriter(writer);
		vo.setbAContent(content);
		
		int result = new BoardService().insertBoard(vo);
		
		if(result == 0) {
			System.out.println("글등록실패");
			request.setAttribute("msg","글등록 실패");
			request.getRequestDispatcher("/WEB-INF/view/professor/pf_enrollasgboard.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "글등록 성공");
			request.getSession().setAttribute("inf", vo);
			request.getRequestDispatcher("/WEB-INF/view/professor/pf_enrollasgboard.jsp").forward(request, response);
		}
	}

}
