package com.exam.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


import com.exam.domain.MemberVo;

public class MemberDao {
	private static MemberDao instance = new MemberDao();
	public static MemberDao getInstance() {
		return instance;
	}
	public void insert(MemberVo member) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			con = JdbcUtils.getConnection();

			sql = "insert into member (id, passwd, name, gender, email, reg_date, address, tel) "
					+ "values(?,?,?,?,?,?,?,?) ";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getEmail());
			pstmt.setTimestamp(6, member.getRegDate());
			pstmt.setString(7, member.getAddress());
			pstmt.setString(8, member.getTel());

			pstmt.executeUpdate();
			System.out.println("insert ����!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	}// insert

	// 아이디 중복체크
	public int idcheck(String id) {
		int count = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			con = JdbcUtils.getConnection();

			sql = "SELECT COUNT(*) from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return count;
	}// idcheck

	public MemberVo selectMemberById(String id) {
		MemberVo memberVo = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			con = JdbcUtils.getConnection();

			sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				memberVo = new MemberVo();
				memberVo.setId(rs.getString("id"));
				memberVo.setPasswd(rs.getString("passwd"));
				memberVo.setName(rs.getString("name"));
				memberVo.setGender(rs.getString("gender"));
				memberVo.setEmail(rs.getString("email"));
				memberVo.setRegDate(rs.getTimestamp("reg_date"));
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}

		return memberVo;
	}

	public List<MemberVo> getAllMember(int startRow, int pageSize) {
		List<MemberVo> mlist = new ArrayList<MemberVo>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();

			// sql = "Select * from openboard order by re_ref desc, re_seq asc limit ?,?";
			// 주글 답글 구현 전 에스큐엘
			sql = "Select * from member limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVo vo = new MemberVo();
				vo.setName(rs.getString("name"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setId(rs.getString("id"));
				vo.setGender(rs.getString("gender"));
				vo.setEmail(rs.getString("email"));
				vo.setAddress(rs.getString("address"));
				vo.setTel(rs.getString("tel"));
				vo.setRegDate(rs.getTimestamp("reg_date"));
				

				mlist.add(vo);
			} // while
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				JdbcUtils.close(con, pstmt, rs);
			}

			return mlist;
	}
	
	public int countAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";
		int count = 0;
		try {
			con = JdbcUtils.getConnection();

			sql = "select count(*) from member";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// TODO Auto-generated catch block
			JdbcUtils.close(con, pstmt, rs);
		}
		return count;

	}// countAll
	
	
	
	public int getSearchCount(String field, String word) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = JdbcUtils.getConnection();
			String sql = "select count(*) from member where " + field + " like '%"+word+"%'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		//System.out.println("search count :" +count);
		return count;
	}
	
	public List<MemberVo> searchMembers(String field, String word,int startRow, int pageSize) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberVo> list = new ArrayList<>();

		try {
			con = JdbcUtils.getConnection();
			String sql = "select * from member where " + field + " like '%"+word+"%' LIMIT ?, ? ";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVo vo = new MemberVo();
				vo.setName(rs.getString("name"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setId(rs.getString("id"));
				vo.setGender(rs.getString("gender"));
				vo.setEmail(rs.getString("email"));
				vo.setAddress(rs.getString("address"));
				vo.setTel(rs.getString("tel"));
				vo.setRegDate(rs.getTimestamp("reg_date"));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return list;
	}
	
	public void deleteById(String id) {
		Connection con = null;
		PreparedStatement pstmt =null;
		String sql ="";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql = "delete from member where id = ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
					
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
		
	}// deleteById

}
