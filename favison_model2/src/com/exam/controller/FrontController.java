package com.exam.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "*.hj", loadOnStartup = 1)
public class FrontController extends HttpServlet {

	public FrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		// 웹프로그램 당 유지되는 맵 자료구조 객체
		ServletContext application = config.getServletContext();
		application.setAttribute("aa", "AA");
	}

	@Override
	public void destroy() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		System.out.println("URI주소:" + requestURI);

		String contextPath = request.getContextPath();
		System.out.println("contextPath : " + contextPath);

		String command = requestURI.substring(contextPath.length());
		command = command.substring(0, command.indexOf(".hj")); // ".hj" 제거
		System.out.println("command : " + command);

		ActionFactory actionFactory = ActionFactory.getInstance();
		Action action = null;
		String strView = null;

		action = actionFactory.getAction(command);

		if (action == null) {
			System.out.println(command + "를 처리하는 Action 객체가 없습니다.");
			return;
		}

		// Action 타입 객체 실행하기
		try {
			strView = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		if (strView == null) {
			System.out.println("화면이동 없음");
			return;
		}

	
		if (strView.startsWith("redirect:")) {
			String redirectPath = strView.substring("redirect:".length());
			response.sendRedirect(redirectPath);
		} else {
			
			String jspPath = "/WEB-INF/views/" + strView + ".jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(jspPath);
			dispatcher.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 한글처리
		doGet(request, response);
	}

}
