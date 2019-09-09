package datos;


import java.sql.*;

import entidades.Usuario;

public class DataUsuario {

	
	private static String driver="com.mysql.jdbc.Driver";
	private static String url="jdbc:mysql://localhost:3306/tp_software?serverTimezone=UTC";
	private static String user="sistema";
	private static String pass="simplesystem";
	
	public Usuario getByUsername(Usuario usuario) {
		
		Usuario u = null;
		PreparedStatement stmt = null;
		ResultSet rs = null; 
		try {
			stmt=FactoryConnection.getInstancia().getConn().prepareStatement(
					"SELECT * FROM usuarios WHERE usuario=? AND password=?"
					);
			stmt.setString(1, usuario.getUsername());
			stmt.setString(2, usuario.getPassword());
			rs = stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				u = new Usuario();
				u.setNombre(rs.getString("nombre"));
				u.setApellido(rs.getString("apellido"));
				u.setEmail(rs.getString("email"));
				u.setTelefono(rs.getString("telefono"));
				u.setUsername(rs.getString("usuario"));
				u.setPassword(rs.getString("password"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				FactoryConnection.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return u;
	}
	
	
	public static void addUsuario(Usuario usuario) {
		
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
		Class.forName(driver);
		
		Connection conexion = DriverManager.getConnection(url, user, pass);
		st = conexion.prepareStatement(
				"INSERT INTO usuarios(nombre, apellido, email, telefono, usuario, password) VALUES(?, ?, ?, ?, ?, ?)");
		st.setString(1, usuario.getNombre());
		st.setString(2, usuario.getApellido());
		st.setString(3, usuario.getEmail());
		st.setString(4, usuario.getTelefono());
		st.setString(5, usuario.getUsername());
		st.setString(6, usuario.getPassword());
		st.executeUpdate();
			
		rs = st.executeQuery();
		if (rs!=null && rs.next())
		{

		}
			if (rs!=null) {rs.close();}
			if (st!=null) {st.close();}
			conexion.close();
				}
			catch (Exception e)
		{
				e.printStackTrace();
		} 
	}
	
	public void add(Usuario u) {
		PreparedStatement stmt = null;
		ResultSet keyResultSet = null;
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
							"INSERT INTO usuarios (nombre, apellido, email, telefono, usuario, password, isAdmin) values(?,?,?,?,?,?,?)",
							PreparedStatement.RETURN_GENERATED_KEYS
							);
			stmt.setString(1, u.getNombre());
			stmt.setString(2, u.getApellido());
			stmt.setString(3, u.getEmail());
			stmt.setString(4, u.getTelefono());
			stmt.setString(5, u.getUsername());
			stmt.setString(6, u.getPassword());
			stmt.setBoolean(7, false);
			stmt.executeUpdate();
			
			keyResultSet = stmt.getGeneratedKeys();
           
			if(keyResultSet!=null && keyResultSet.next()){
                u.setIdUsuario(keyResultSet.getInt(1));
            }

			
		}  catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if(keyResultSet!=null) keyResultSet.close();
                if(stmt!=null) stmt.close();
                FactoryConnection.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
    }
}
