package datos;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import entidades.MyException;
import entidades.MyResult;

public class DataException extends DataMethods{

	
	public MyResult add(MyException myExc) {
		int resultado = -1;
		PreparedStatement stmt = null;
		try {
			stmt = FactoryConnection.getInstancia().getConn().prepareStatement(
					"INSERT INTO log_errores(statusCode, servletName, error) "
					+ "values(?,?,?)"
					);
			stmt.setInt(1, myExc.getStatusCode());
			stmt.setString(2, myExc.getServletName());
			stmt.setString(3, myExc.getErr_exception());
			resultado = stmt.executeUpdate();
			if (resultado != 1) {
				return Add(0);
			}
			
		}  catch (SQLException e) {
			return Add(0);
		} finally {
	        try {
	            if(stmt!=null) stmt.close();
	            FactoryConnection.getInstancia().releaseConn();
	        } catch (SQLException e) {
	        	return Add(0);
	        }
		}
		return Add(1);
	}
}
