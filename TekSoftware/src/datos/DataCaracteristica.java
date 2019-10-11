package datos;


import java.sql.*;
import java.util.ArrayList;

import entidades.Caracteristica;
import entidades.Opcion;
import entidades.Usuario;

public class DataCaracteristica {

	
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
	
	public Caracteristica getByID(int ID) {
		Caracteristica c = null;
		PreparedStatement stmt = null;
		ResultSet rs = null; 
		try {
			stmt = FactoryConnection.getInstancia().getConn().prepareStatement(
					"SELECT * FROM caracteristicas WHERE idCaracteristica=?"
					);
			stmt.setInt(1, ID);
			
			rs = stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				c = new Caracteristica();
				c.setIdCaracteristica(rs.getInt("idCaracteristica"));
				c.setTitulo(rs.getString("titulo"));
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
		
		return c;
	}

	
	public ArrayList<Opcion> getOpcionesByIdCaracteristica(int ID) {
		ArrayList<Opcion> opciones = new ArrayList<Opcion>(3);
		PreparedStatement stmt = null;
		ResultSet rs = null; 
		try {
			stmt = FactoryConnection.getInstancia().getConn().prepareStatement(
					"SELECT op.idOpcion, op.descripcion, op.subtitulo, op.textIcono " + 
					"			FROM opciones op " + 
					"			INNER JOIN caracteristicas car " + 
					"			ON op.idCaracteristica = car.idCaracteristica " + 
					"			WHERE car.idCaracteristica =?; "
					);	
			
			stmt.setInt(1, ID);
			rs = stmt.executeQuery();
			
				if(rs!=null) {
					while(rs.next()) {
						Opcion o = new Opcion();
						o.setIdOpcion(rs.getInt("idOpcion"));
						o.setDescripcion(rs.getString("descripcion"));
						o.setSubtitulo(rs.getString("subtitulo"));
						o.setTextIcono(rs.getString("textIcono"));
						
						opciones.add(o);
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
		
		return opciones;
	}
	

	
	
		public void add(Usuario u) {
			int admin;
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
		
	public void update(Usuario u) {
		PreparedStatement stmt = null;
		ResultSet keyResultSet = null;
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
	
	public void delete(int ID) {
		
		PreparedStatement stmt=null;
		try {
			stmt=FactoryConnection.getInstancia().getConn().prepareStatement(
					"DELETE FROM usuarios WHERE idUsuario=?"
					);
			stmt.setInt(1, ID);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt!=null) {stmt.close();}
				FactoryConnection.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
