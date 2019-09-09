package datos;
import java.sql.*;


public class FactoryConnection {

		private static FactoryConnection instancia;
		
		private String driver="com.mysql.jdbc.Driver";
		private String host="localhost";
		private String port="3306";
		private String user="sistema";
		private String password="simplesystem";
		private String db="tp_software";
		private int conectados=0;
		private Connection conn=null;
		
		private FactoryConnection() {
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		
		public static FactoryConnection getInstancia() {
			if (instancia == null) {
				instancia = new FactoryConnection();
			}
			return instancia;
		}
		
		public Connection getConn() {
			try {
				if(conn==null || conn.isClosed()) {
					conn=DriverManager.getConnection("jdbc:mysql://"+host+":"+port+"/"+db+"?serverTimezone=UTC", user, password);
					conectados=0;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			conectados++;
			return conn;
		}
		
		public void releaseConn() {
			conectados--;
			try {
				if (conectados<=0) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}