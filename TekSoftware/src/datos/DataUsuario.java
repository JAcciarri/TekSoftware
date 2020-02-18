package datos;


import java.sql.*;
import java.util.ArrayList;

import entidades.MyResult;
import entidades.Usuario;

public class DataUsuario extends DataMethods{

	
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
						u.setPrivilegio(rs.getBoolean("isAdmin"));
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
	
	public ArrayList<Usuario> getAllAdmins(){
		
		Statement stmt=null;
		ResultSet rs=null;
		ArrayList<Usuario> listaUsuarios= new ArrayList<>();
		
		try {
			stmt= FactoryConnection.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("SELECT * FROM usuarios WHERE isAdmin=1");
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
					u.setPrivilegio(rs.getBoolean("isAdmin"));
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
				u.setIdUsuario(rs.getInt("idUsuario"));
				u.setNombre(rs.getString("nombre"));
				u.setApellido(rs.getString("apellido"));
				u.setEmail(rs.getString("email"));
				u.setTelefono(rs.getString("telefono"));
				u.setUsername(rs.getString("usuario"));
				u.setPassword(rs.getString("password"));
				u.setPrivilegio(rs.getBoolean("isAdmin"));
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
	
	public Usuario getByID(int ID) {
		Usuario u = null;
		PreparedStatement stmt = null;
		ResultSet rs = null; 
		try {
			stmt = FactoryConnection.getInstancia().getConn().prepareStatement(
					"SELECT * FROM usuarios WHERE idUsuario=?"
					);
			stmt.setInt(1, ID);
			
			rs = stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				u = new Usuario();
				u.setNombre(rs.getString("nombre"));
				u.setApellido(rs.getString("apellido"));
				u.setEmail(rs.getString("email"));
				u.setTelefono(rs.getString("telefono"));
				u.setUsername(rs.getString("usuario"));
				u.setPassword(rs.getString("password"));
				u.setPrivilegio(rs.getBoolean("isAdmin"));
				u.setIdUsuario(rs.getInt("idUsuario"));
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

	public ArrayList<Usuario> getUsersByPartialDesc(String desc){
		ArrayList<Usuario> users = new ArrayList<Usuario>();
		PreparedStatement stmt = null;
		ResultSet rs = null; 
		try {
			stmt=FactoryConnection.getInstancia().getConn().prepareStatement(
					"SELECT * FROM usuarios "
					+ "WHERE usuario LIKE ('"+desc+"%') OR email LIKE ('"+desc+"%')");
	//		stmt.setString(1, desc);
	//		stmt.setString(2, desc);
			rs = stmt.executeQuery();
			
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
					u.setPrivilegio(rs.getBoolean("isAdmin"));
					users.add(u);
				}
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
		
		return users;
	}
	
	public int getMAXID() {
		int max = 0;
		PreparedStatement stmt = null;
		ResultSet rs = null; 
		try {
			stmt = FactoryConnection.getInstancia().getConn().prepareStatement(
					"SELECT MAX(idUsuario) FROM usuarios"
					);
		
			rs = stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				max = rs.getInt(1);
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
		return max;
	}
	
	public MyResult add(Usuario u) {
			int admin, resultado;
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
				if (u.isAdmin()) admin=1; else admin=0;
				stmt.setInt(7, admin);
				
			    resultado = stmt.executeUpdate();
				
				keyResultSet = stmt.getGeneratedKeys();
				if(keyResultSet!=null && keyResultSet.next()){
		            u.setIdUsuario(keyResultSet.getInt(1));
		        }
				
			}  catch (SQLException e) {
				return Add(0);
			} finally {
		        try {
		            if(keyResultSet!=null) keyResultSet.close();
		            if(stmt!=null) stmt.close();
		            FactoryConnection.getInstancia().releaseConn();
		        } catch (SQLException e) {
		        	return Add(0);
		        }
			}
			return Add(resultado);
		}
		
	public MyResult update(Usuario u) {
		PreparedStatement stmt = null;
		ResultSet keyResultSet = null;
		int resultado = -1;
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
			"UPDATE usuarios SET nombre=?, apellido=?, email=?, telefono=?, usuario=? WHERE idUsuario='"+u.getIdUsuario()+"'",
							PreparedStatement.RETURN_GENERATED_KEYS
							);
			stmt.setString(1, u.getNombre());
			stmt.setString(2, u.getApellido());
			stmt.setString(3, u.getEmail());
			stmt.setString(4, u.getTelefono());
			stmt.setString(5, u.getUsername());
			resultado = stmt.executeUpdate();
			
			keyResultSet = stmt.getGeneratedKeys();
	       
			if(keyResultSet!=null && keyResultSet.next()){
	            u.setIdUsuario(keyResultSet.getInt(1));
	        }
	
			
		}  catch (SQLException e) {
	        return Update(resultado);
		} finally {
	        try {
	            if(keyResultSet!=null) keyResultSet.close();
	            if(stmt!=null) stmt.close();
	            FactoryConnection.getInstancia().releaseConn();
	        } catch (SQLException e) {
	        	return Update(resultado);
	        }
		}
		return Update(resultado);
	}
	
	public MyResult delete(int ID) {
		int resultado = -1;
		PreparedStatement stmt=null;
		try {
			stmt=FactoryConnection.getInstancia().getConn().prepareStatement(
					"DELETE FROM usuarios WHERE idUsuario=?"
					);
			stmt.setInt(1, ID);
			resultado = stmt.executeUpdate();
		} catch (SQLException e) {
			return Delete(resultado);
		}finally {
			try {
				if(stmt!=null) {stmt.close();}
				FactoryConnection.getInstancia().releaseConn();
			} catch (SQLException e) {
				Delete(resultado);
			}
		}
		return Delete(resultado);
	}
	
	
}
