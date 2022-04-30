package kh.semi.lms.professor.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.lms.reference.service.ReferenceService;
import kh.semi.lms.reference.vo.ReferenceVo;

/**
 * Servlet implementation class LectureBoardListSerlvet
 */
@WebServlet("/reflist")
public class PfReferenceListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PfReferenceListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<ReferenceVo> volist = null;
//		ArrayList<BoardVo> volist = service.listBoard(startRnum, endRnum);
		
		volist = new ReferenceService().referenceboardlist();
		System.out.println(volist);	
		request.setAttribute("referenceboardlist", volist);
		request.getRequestDispatcher("/WEB-INF/view/professor/Referenceboardlist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		ArrayList<ReferenceVo> volist = null;
//		ArrayList<BoardVo> volist = service.listBoard(startRnum, endRnum);
//		
//		volist = new ReferenceService().referenceboardlist();
//		System.out.println(volist);	
//		request.setAttribute("referenceboardlist", volist);
//		request.getRequestDispatcher("/WEB-INF/view/professor/Referenceboardlist.jsp").forward(request, response);
	}

}
