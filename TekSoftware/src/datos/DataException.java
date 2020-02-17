package datos;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import entidades.MyException;

public class DataException {

	
	public void add(MyException myExc) {
		
		PreparedStatement stmt = null;
		try {
			stmt = FactoryConnection.getInstancia().getConn().prepareStatement(
					"INSERT INTO log_errores(statusCode, servletName, error) "
					+ "values(?,?,?)"
					);
			stmt.setInt(1, myExc.getStatusCode());
			stmt.setString(2, myExc.getServletName());
			stmt.setString(3, myExc.getErr_exception());
			stmt.executeUpdate();
			
			
		}  catch (SQLException e) {
	        e.printStackTrace();
		} finally {
	        try {
	            if(stmt!=null) stmt.close();
	            FactoryConnection.getInstancia().releaseConn();
	        } catch (SQLException e) {
	        	e.printStackTrace();
	        }
		}
	}
}
