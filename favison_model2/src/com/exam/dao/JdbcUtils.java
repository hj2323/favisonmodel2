package com.exam.dao;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JdbcUtils {
	public static Connection getConnection() throws Exception {
		Connection con = null;

//		String url = "jdbc:mysql://localhost:3306/myjspdb?useUnicode=true&characterEncoding=utf8&allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=Asia/Seoul";
//		String user = "myjspid"; //
//		String password = "myjsppass";
//
//		Class.forName("com.mysql.jdbc.Driver");
//
//		con = DriverManager.getConnection(url, user, password);

		// 커넥션 풀(DBCP)방식으로 DataSource로부터 커넥션
		// datasource객체를 가져오기 위해서 먼저 context를 선언
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/jspdb");// datasource타입으로 리턴되야하므로 형변환 <lookup은
																				// object타입으로 리턴됨
		// java:comp/env/:key값 앞에 붙는 수식어, 여기서 env는environment
		con = ds.getConnection(); // 커넥션 한개 빌려오기
		
		return con;
	}// getCounnection

	public static void close(Connection con, PreparedStatement pstmt) {
		close(con, pstmt, null);
	}// close

	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}// close
}
