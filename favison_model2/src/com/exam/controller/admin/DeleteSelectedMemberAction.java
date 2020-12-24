package com.exam.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.controller.Action;
import com.exam.dao.MemberDao;

public class DeleteSelectedMemberAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String[] checkRow = request.getParameterValues("checkRow") ;


		MemberDao dao = MemberDao.getInstance();

		if (checkRow != null) {
			for (int i=0; i<checkRow.length; i++) {
				String id = checkRow[i];
			
				dao.deleteById(id);
			}
			return "redirect:/favison_model2/memberPage.hj";
		} else {
			return "redirect:/favison_model2/memberPage.hj";
		}
		
	}

}
