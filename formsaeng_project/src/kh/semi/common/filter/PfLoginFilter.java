package kh.semi.common.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kh.semi.member.model.vo.MemberVo;

@WebFilter("/PfLoginFilter")
public class PfLoginFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpSession session = ((HttpServletRequest) request).getSession(); // 없으면 null 반환
		 
		  boolean check = false;
		  
		  MemberVo ssvo = (MemberVo)session.getAttribute("ssMemberVo");
			if (ssvo != null) {
				String id = ssvo.getId();

				boolean idCheck = Pattern.matches("^[P][0-9]{10}$", id); // P로 시작해

				if (session != null) {
					if (ssvo != null && idCheck == true) {
						check = true;
					}
				}
			}
			if (check == true) {
				chain.doFilter(request, response); // 세션 정보 있어
			} else { // 로그인 페이지로 이동
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("window.alert('로그인이 필요한 페이지입니다');");
				out.println("window.location.href='"+request.getServletContext().getContextPath()+"/pflogin';");
				out.println("</script>");

			}
		}
	}


