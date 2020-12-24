package com.exam.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.controller.Action;
import com.exam.dao.MemberDao;
import com.exam.domain.MemberVo;

import java.sql.Timestamp;

public class JoinProAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		//post전송 파라미터값 한글처리
		//request.setCharacterEncoding("utf-8");

		//vo객체 준비
		MemberVo member = new MemberVo();

		//파라미터값을 찾아서 VO 객체에 저장
		member.setId(request.getParameter("id"));
		member.setPasswd(request.getParameter("passwd"));
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));
		member.setAddress(request.getParameter("address"));
		member.setTel(request.getParameter("tel"));
		member.setGender(request.getParameter("gender"));



		//현재 날짜시간 정보 Timestamp 설정
		member.setRegDate(new Timestamp(System.currentTimeMillis()));

		//dao 객체 준비
		MemberDao dao = new MemberDao();

		//insert메서드 호출
		dao.insert(member);
		
		return "redirect:/favison_model2/login.hj";
	}

}
