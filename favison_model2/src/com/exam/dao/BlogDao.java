package com.exam.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.exam.domain.BlogVo;

public class BlogDao {
	public void insert(BlogVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			con = JdbcUtils.getConnection();

			sql = "insert into openboard(name, passwd, subject, content, readcount,"
					+ " reg_date, ip, filename, re_ref, re_lev, re_seq)\r\n" + " values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setString(3, vo.getSubject());
			pstmt.setString(4, vo.getContent());
			pstmt.setInt(5, vo.getReadcount());
			pstmt.setTimestamp(6, vo.getRegDate());
			pstmt.setString(7, vo.getIp());
			pstmt.setString(8, vo.getFilename());
			pstmt.setInt(9, vo.getReRef());
			pstmt.setInt(10, vo.getReLev());
			pstmt.setInt(11, vo.getReSeq());

			pstmt.executeUpdate();
			System.out.println("insert success!");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	}// insert

	public int getNextNo() {
		int nextNo = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			con = JdbcUtils.getConnection();

			sql = "select ifnull(max(no), 0)+1 as next_no from openboard";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				nextNo = rs.getInt("next_no");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return nextNo;
	}// getNextNum

	public int countAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";
		int count = 0;
		try {
			con = JdbcUtils.getConnection();

			sql = "select count(*) from openboard";
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

	public List<BlogVo> getBlogs(int startRow, int pageSize) {
		List<BlogVo> list = new ArrayList<BlogVo>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			con = JdbcUtils.getConnection();

			// sql = "Select * from openboard order by re_ref desc, re_seq asc limit ?,?";
			// 주글 답글 구현 전 에스큐엘
			sql = "Select * from openboard order by no desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				BlogVo vo = new BlogVo();
				// vo.setNum(rs.getInt("num"));
				vo.setNo(rs.getInt("no"));
				vo.setName(rs.getString("name"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setRegDate(rs.getTimestamp("reg_date"));
				vo.setIp(rs.getString("ip"));
				vo.setFilename(rs.getString("filename"));
				vo.setReRef(rs.getInt("re_ref"));
				vo.setReLev(rs.getInt("re_lev"));
				vo.setReSeq(rs.getInt("re_seq"));

				list.add(vo);

			} // while
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}

		return list;
	}// getBlogs

	public void updateReadcountByNo(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			con = JdbcUtils.getConnection();

			sql = " update openboard\r\n" + " set readcount = readcount + 1\r\n" + " where no=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);

			pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	}// updateReadcountByNo

	public BlogVo getBlogByNo(int no) {
		BlogVo vo = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			con = JdbcUtils.getConnection();

			sql = "select * from openboard where no=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {// ���� �ִ� �Ѱ��� ������ while����� if�� ����
				vo = new BlogVo();

				vo.setNum(rs.getInt("no"));
				vo.setName(rs.getString("name"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setRegDate(rs.getTimestamp("reg_date"));
				vo.setIp(rs.getString("ip"));
				vo.setFilename(rs.getString("filename"));
				vo.setReRef(rs.getInt("re_ref"));
				vo.setReLev(rs.getInt("re_lev"));
				vo.setReSeq(rs.getInt("re_seq"));

			} // if
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}

		return vo;
	}// getBlogByNo

	public boolean isPasswdCorrect(int no, String passwd) {
		boolean isCorrect = false;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			con = JdbcUtils.getConnection();

			sql = "select count(*) from openboard ";
			sql += "where no = ? ";
			sql += "and passwd=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, passwd);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				int count = rs.getInt(1);

				if (count == 1) {
					isCorrect = true;
				} else {// count == 0
					isCorrect = false;
				}
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}

		return isCorrect;
	}// isPasswdCorrect

	public void update(BlogVo vo) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			con = JdbcUtils.getConnection();

			sql = "update openboard set name=?, " + "passwd=?, subject=?, content=?, filename=? where no=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setString(3, vo.getSubject());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getFilename());
			pstmt.setInt(6, vo.getNo());

			pstmt.executeUpdate();// ����

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}

	}// update

	public void deleteByNo(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			con = JdbcUtils.getConnection();

			sql = "delete from openboard where no = ? ";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);

			pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}

	}

	
	public int getSearchCount(String field, String word) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = JdbcUtils.getConnection();
			String sql = "select count(*) from openboard where " + field + " like '%"+word+"%'";
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
	
	public List<BlogVo> searchBlog(String field, String word,int startRow, int pageSize) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BlogVo> list = new ArrayList<>();

		try {
			con = JdbcUtils.getConnection();
			String sql = "select * from openboard where " + field + " like '%"+word+"%' LIMIT ?, ? ";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BlogVo vo = new BlogVo();
				// vo.setNum(rs.getInt("num"));
				vo.setNo(rs.getInt("no"));
				vo.setName(rs.getString("name"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setRegDate(rs.getTimestamp("reg_date"));
				vo.setIp(rs.getString("ip"));
				vo.setFilename(rs.getString("filename"));
				vo.setReRef(rs.getInt("re_ref"));
				vo.setReLev(rs.getInt("re_lev"));
				vo.setReSeq(rs.getInt("re_seq"));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return list;
	}
	

}
