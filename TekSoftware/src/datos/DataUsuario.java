package datos;


import java.sql.*;
import java.util.ArrayList;

import entidades.Usuario;

public class DataUsuario {

	
	public ArrayList<Usuario> getAllUsers(){
		
			Statement stmt=null;
			ResultSet rs=null;
			ArrayList<Usuario> listaUsuarios= new ArrayList<>();
			
			try {
				stmt= FactoryConnection.getInstancia().getConn().createStatement();
				rs= stmt.executeQuery("SELECT * FROM usuarios");
				if(rs!=null) {
					while(rs.next()) {
						Usuario u = new Usuario();
						u.setIdUsuario(rs.getInt("idUsuario"));
						u.setNombre(rs.getString("nombre"));
						u.setApellido(rs.getString("apellido"));
						u.setEmail(rs.getString("email"));
						u.setTelefono(rs.getString("telefono"));
						u.setUsername(rs.getString("usuario"));
						u.setPassword(rs.getString("password"));
						listaUsuarios.add(u);
					}
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
				
			} finally {
				try {
					if(rs!=null) {rs.close();}
					if(stmt!=null) {stmt.close();}
					FactoryConnection.getInstancia().releaseConn();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			return listaUsuarios;
		}
	
	
	
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
