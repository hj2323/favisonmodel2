package com.exam.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.controller.Action;
import com.exam.dao.MemberDao;
import com.exam.domain.MemberVo;
import com.exam.domain.PageDto;

public class MemberPageAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// pageNum 파라미터 값 가져오기
		String strPageNum = request.getParameter("pageNum");
		// strPageNum 값이 null이면 "1"로 수정하기(디폴트값을 "1"로 설정)
		strPageNum = (strPageNum == null) ? "1" : strPageNum;
		// 문자열 페이지 번호를 정수형으로 변환하기
		int pageNum = Integer.parseInt(strPageNum);

		String field = request.getParameter("field");
		String word = request.getParameter("word");

		MemberDao dao = new MemberDao();

		int totalCount = dao.countAll();// 전체 글갯수
		int searchCount = dao.getSearchCount(field, word); // 검색 글갯수

		int pageSize = 5;
		// 시작행 인덱스번호 구하기 수식
		int startRow = (pageNum - 1) * pageSize;
		
		List<MemberVo> mlist = null;
		List<MemberVo> smlist= null;
		if (totalCount > 0 && word == null) {
			mlist = dao.getAllMember(startRow, pageSize);
		} 

		if (searchCount > 0) {
			smlist = dao.searchMembers(field, word, startRow, pageSize);
		}
		request.setAttribute("mlist", mlist);
		request.setAttribute("smlist", smlist);
		
		
		PageDto pageDto = new PageDto();
		pageDto.setTotalCount(totalCount);
		pageDto.setSearchCount(searchCount);
		
		if (totalCount > 0) {
			int pageCount = (totalCount / pageSize) + (totalCount % pageSize == 0 ? 0 : 1);

			int pageBlock = 2;
			int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;

			if (endPage > pageCount) {
				endPage = pageCount;
			}
			
			pageDto.setPageCount(pageCount);
			pageDto.setPageBlock(pageBlock);
			pageDto.setStartPage(startPage);
			pageDto.setEndPage(endPage);
			
		}//if
		
		request.setAttribute("pageDto",pageDto);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("word", word);
		request.setAttribute("field", field);
	
		return "memberPage";
	}

}
