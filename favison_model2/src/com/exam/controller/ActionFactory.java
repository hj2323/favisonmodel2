package com.exam.controller;

import java.util.HashMap;
import java.util.Map;

import com.exam.controller.member.*;
import com.exam.controller.blog.*;
import com.exam.controller.my.*;
import com.exam.controller.admin.*;


public class ActionFactory {
	// 싱글톤 패턴 : 프로그램 시작작부터 종료까지 객체 한개만 사용하는 패턴
	private static ActionFactory instance = new ActionFactory();
	
	public static ActionFactory getInstance() {
		return instance;
	}
	
	
	private Map<String, Action> map = new HashMap<>();
	
	
	
	private ActionFactory() {
		// 명령어와 그 명령어를 처리하는 Action 타입 객체를 등록하기
		map.put("/index", new IndexAction());
		map.put("/feature", new FeatureAction());
		map.put("/price", new PriceAction());
		map.put("/contact", new ContactAction());
		
		//member
		map.put("/join", new JoinAction());
		map.put("/joinPro", new JoinAction());
		map.put("/joinIdDbCheck", new JoinIdDbCheckAction());
		map.put("/login", new LoginAction());
		map.put("/loginPro", new LoginProAction());
		map.put("/logout", new LogoutAction());
		
		
		//blog
		map.put("/blog", new BlogAction());
		map.put("/writeForm", new WriteFormAction());
		map.put("/writePro", new WriteProAction());
		map.put("/singleblog", new SingleBlogAction());
		map.put("/updateCheckForm", new UpdateCheckFormAction());
		map.put("/updateForm", new UpdateFormAction());
		map.put("/updatePro", new UpdateProAction());
		map.put("/deletePro", new DeleteAction());
		
		//my
		map.put("/mypage", new MyPageAction());
		
		//admin
		map.put("/memberPage", new MemberPageAction());
		map.put("/statistics", new StatisticsAction());
		map.put("/deleteSelectedMember", new DeleteSelectedMemberAction());
		
		
	} // 생성자
	
	public Action getAction(String command) {
		Action action = null;
		
		action = map.get(command);
		return action;
	}
	
}
