package com.exam.controller.member;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.controller.Action;

public class LogoutAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("id");
		session.invalidate();
		Cookie[] cookies = request.getCookies();

		if(cookies != null){
			for (Cookie cookie : cookies){
				if(cookie.getName().equals("id")){
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
				}
			}// for
		}
		// "로그아웃됨"   index.do로 리다이렉트 이동
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();//jsp에서는 out이라는 객체를 씀
				out.println("<script>");
				out.println("alert('로그아웃됨');");
				out.println("location.href = '/favison_model2/index.hj';  ");
				out.println("</script>");
				out.close();//닫을때 버퍼 비움
				
				return "redirect:/favison_model2/index.hj";
	}

}
