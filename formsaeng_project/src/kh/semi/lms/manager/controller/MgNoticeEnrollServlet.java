package kh.semi.lms.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.member.model.vo.MemberVo;
import kh.semi.notice.model.service.NoticeService;
import kh.semi.notice.model.vo.NoticeVo;

/**
 * Servlet implementation class MgBoardEnrollServlet
 */
@WebServlet("/mg/notice/insert")
public class MgNoticeEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MgNoticeEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("doGet/mgnoticeenroll");
		
		request.getRequestDispatcher("/WEB-INF/view/manager/mgNoticeEnroll.jsp").forward(request,response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기 들어오는지 확인용");
		
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		MemberVo mvo=(MemberVo) request.getSession().getAttribute("ssMemberVo");
		String id=mvo.getId();
		String name=mvo.getName();
		
		NoticeVo vo=new NoticeVo();
		vo.setBoardNoticeTitle(title);
		vo.setBoardNoticeContent(content);
		System.out.println("controller vo : " + vo); //vo에 담겼는지 확인
		
		int result=new NoticeService().insertBoard(vo, id, name);
		
		System.out.println("controller result : "+result);
		
		if(result==0) {
			System.out.println("글쓰기 실패ㅠㅠㅠㅠㅠㅠㅠㅠㅠ");
		}else {
			System.out.println("글쓰기 성공!!!!");
//			등록하기 버튼을 클릭하여 DB에 저장되면 공지사항 리스트페이지로 이동
			response.sendRedirect(request.getContextPath()+"/mg/notice/list");
		}
		
		
		
		
//		doGet(request, response);
	}

}
