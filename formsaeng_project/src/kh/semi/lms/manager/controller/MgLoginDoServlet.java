package kh.semi.lms.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.member.model.service.MemberService;
import kh.semi.member.model.vo.MemberVo;

/**
 * Servlet implementation class MgMainServlet
 */
@WebServlet("/mglogin.do")
public class MgLoginDoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MgLoginDoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberVo vo = new MemberVo(id, pwd);
		vo.setId(id);
		vo.setPwd(pwd);
		
		MemberVo result = new MemberService().login(vo);
		if(result == null) {
			System.out.println("로그인에 실패했습니다.");
		}else {
			System.out.println("로그인에 성공했습니다.");
			//TODO session 등록
			response.sendRedirect("mgmain");
		}
		
		
		
	}

}