package com.exam.controller.member;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.controller.Action;
import com.exam.dao.MemberDao;
import com.exam.domain.MemberVo;

public class LoginProAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");


		//로그인 상태 유지(쿠키)
		String strKeepLogin = request.getParameter("keepLogin");
		
		boolean keepLogin = false;
		if(strKeepLogin != null){
			keepLogin = Boolean.parseBoolean(strKeepLogin);//"true"->true
		}
		
		
		MemberDao dao = new MemberDao();
		MemberVo member = dao.selectMemberById(id);
		if (member == null) {
			// 아이디 없음
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('없는 아이디 입니다.');");
			out.println("history.back(); // 뒤로가기");
			out.println("</script>");
			//out.flush(); // 버퍼 비우기
			out.close();  // 닫을때 자동으로 버퍼 비움
			return null;
		} else if (!passwd.equals(member.getPasswd())) { // memberVo != null
			// 패스워드 틀림
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('패스워드가 일치하지 않습니다.');");
			out.println("history.back(); // 뒤로가기");
			out.println("</script>");
			//out.flush(); // 버퍼 비우기
			out.close();  // 닫을때 자동으로 버퍼 비움
			return null;
		}
		
		
		// 아이디, 패스워드 모두 일치할때(로그인 성공일때)

		// 세션객체 참조 가져오기
		HttpSession session = request.getSession();
		
		// 세션은 사용자 한명당 유지되는 일종의 자료구조 맵 객체
		// 로그인 처리. 세션에 로그인 확인용 데이터 저장.
		session.setAttribute("id", id);
	
		// 로그인 상태유지 원하면 쿠키 생성 후 응답주기
		if (keepLogin) { // keepLogin == true
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(60 * 10); // 쿠키 유효기간. 초단위 설정. 10분
			cookie.setPath("/");  // 쿠키생성 기준경로 설정
			
			response.addCookie(cookie);
		}
	
		// 로그인 성공하면 index 화면으로 리다이렉트
		return "redirect:/favison_model2/index.hj";
	}

}
