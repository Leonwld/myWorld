package dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbHelper {

	private Connection con;

	public void init() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		if (this.con == null || this.con.isClosed()) {
			this.con = DriverManager
					.getConnection("jdbc:mysql://127.0.0.1:3306/mybooksshop",
							"root", "123456");
		}
	}

	public ResultSet doQuery(String sql) throws SQLException {
		this.init();
		if (this.con != null && !this.con.isClosed()) {


			return this.con.createStatement().executeQuery(sql);
		} else {
			return null;
		}
	}

	public Integer doUpdate(String sql) throws SQLException {
		this.init();
		if (this.con != null && !this.con.isClosed()) {


			return this.con.createStatement().executeUpdate(sql);
		} else {
			return null;
		}
	}

	public void close() throws SQLException {
		if (this.con != null && !this.con.isClosed()) {
			this.con.close();
			this.con = null;
		}
	}
}
