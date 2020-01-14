package datos;


import java.sql.*;
import java.util.ArrayList;

import entidades.Caracteristica;
import entidades.Opcion;
import entidades.Usuario;

public class DataCaracteristica {

	
	public ArrayList<Caracteristica> getAllCaracteristicas(){
		
			Statement stmt=null;
			ResultSet rs=null;
			ArrayList<Caracteristica> listaCaracteristicas= new ArrayList<>();
			
			try {
				stmt= FactoryConnection.getInstancia().getConn().createStatement();
				rs = stmt.executeQuery("SELECT * FROM caracteristicas");
				
				if(rs!=null) {
					while(rs.next()) {
						Caracteristica c = new Caracteristica();
						c.setIdCaracteristica(rs.getInt("idCaracteristica"));
						c.setTitulo(rs.getString("titulo"));
						listaCaracteristicas.add(c);
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
			
			return listaCaracteristicas;
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
	

	
	
		public void add(Caracteristica c) {
			
			PreparedStatement stmt = null;
			ResultSet keyResultSet = null;
			try {
				stmt = FactoryConnection.getInstancia().getConn().
						prepareStatement(
								"INSERT INTO caracteristicas (titulo) values(?)",
								PreparedStatement.RETURN_GENERATED_KEYS
								);
				
				stmt.setString(2, c.getTitulo());
				stmt.executeUpdate();
				
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
		
		public void addOpciones(ArrayList<Opcion> opciones, Caracteristica c) {
			
			PreparedStatement stmt = null;
			ResultSet keyResultSet = null;
			try {
				stmt = FactoryConnection.getInstancia().getConn().
						prepareStatement(
								"INSERT INTO opciones (idCaracteristica, idOpcion, subtitulo, descripcion, textIcono) "
								+ "values (?, ?, ?, ?, ?)");
				
				for(int i = 1; i <= opciones.size(); i++) {
					stmt.setInt(1, c.getIdCaracteristica());
					stmt.setInt(2, opciones.get(i-1).getIdOpcion());
					stmt.setString(3, opciones.get(i-1).getSubtitulo());
					stmt.setString(4, opciones.get(i-1).getDescripcion());
					stmt.setString(5, opciones.get(i-1).getTextIcono());
					stmt.executeUpdate();
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
		
		
		public int getMaxID() {
			
			PreparedStatement stmt = null;
			ResultSet rs = null;
			int maxID = -1;
			
			try {
				stmt = FactoryConnection.getInstancia().getConn().
						prepareStatement( "SELECT MAX(idCaracteristica) FROM caracteristicas");
				rs = stmt.executeQuery();
				if (rs != null) {
					maxID = rs.getInt("idCaracteristica");
				}
				
			}  catch (SQLException e) {
		        e.printStackTrace();
			} finally {
		        try {
		            if(stmt!=null) stmt.close();
		            if (rs!=null) rs.close();
		            FactoryConnection.getInstancia().releaseConn();
		        } catch (SQLException e) {
		        	e.printStackTrace();
		        }
			}
			return maxID;
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
