package datos;


import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import entidades.Caracteristica;
import entidades.Opcion;
import entidades.Seleccion;
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
				
				if (stmt!=null) stmt.close();
				stmt = FactoryConnection.getInstancia().getConn().prepareStatement(		
						"SELECT v.valor " +
						"FROM valores v " +
						"INNER JOIN maximas_fechas mf " +
						"ON v.idCaracteristica = mf.idCaracteristica AND v.idOpcion = mf.idOpcion AND v.fecha_desde = mf.maxFecha " +
						"WHERE v.idCaracteristica=? AND v.idOpcion=?; "
						);
				
				for(Opcion op : opciones) {
					stmt.setInt(1, ID);
					stmt.setInt(2, op.getIdOpcion());
					rs = stmt.executeQuery();
					
					if(rs!=null && rs.next()) {
						op.setValorActual(rs.getFloat("v.valor"));
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
						PreparedStatement.RETURN_GENERATED_KEYS);
				
				stmt.setString(1, c.getTitulo());
				stmt.executeUpdate();
				
				keyResultSet = stmt.getGeneratedKeys();
			       
				if(keyResultSet!=null && keyResultSet.next()){
		            c.setIdCaracteristica(keyResultSet.getInt(1));
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
				if (rs != null && rs.next()) {
					maxID = rs.getInt(1);
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
		
		
	public void updateCaracteristica(Caracteristica c) {
		PreparedStatement stmt = null;
		
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
			"UPDATE caracteristicas SET titulo=? WHERE idCaracteristica=?");
			stmt.setString(1, c.getTitulo());
			stmt.setInt(2, c.getIdCaracteristica());
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
	
	public void updateOpciones(Caracteristica c, ArrayList<Opcion> opciones) {
		PreparedStatement stmt = null;
		
		// PRIMERO ACTUALIZAMOS LAS OPCIONES
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
			"UPDATE opciones SET subtitulo=?, descripcion=?, textIcono=? "
			+ "WHERE idCaracteristica=? AND idOpcion=?");
			
			for (Opcion op : opciones) {
				stmt.setString(1, op.getSubtitulo());
				stmt.setString(2, op.getDescripcion());
				stmt.setString(3, op.getTextIcono());
				stmt.setInt(4, c.getIdCaracteristica());
				stmt.setInt(5, op.getIdOpcion());
				stmt.executeUpdate();	
			}
			
			 //para obtener la hora y convertirla a sql date
				java.util.Date now = new java.util.Date();
			    
			    // AHORA ACTUALIZAMOS LOS VALORES DE ESAS OPCIONES        
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
				"INSERT INTO valores(idCaracteristica, idOpcion, fecha_desde, valor) VALUES (?,?,?,?)");
			
			for (Opcion op : opciones) {
				stmt.setInt(1, c.getIdCaracteristica());
				stmt.setInt(2, op.getIdOpcion());
				stmt.setTimestamp(3, new java.sql.Timestamp(now.getTime()));
				stmt.setFloat(4, op.getValorActual());
				stmt.executeUpdate();	
			}
			
			
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
	
	public void deleteCaracteristica(int ID) {
		
		PreparedStatement stmt=null;
		try {
			stmt=FactoryConnection.getInstancia().getConn().prepareStatement(
					"DELETE FROM valores WHERE idCaracteristica=?"
					);
			stmt.setInt(1, ID);
			stmt.executeUpdate();
			stmt.close();
			
			
			stmt=FactoryConnection.getInstancia().getConn().prepareStatement(
					"DELETE FROM opciones WHERE idCaracteristica=?"
					);
			stmt.setInt(1, ID);
			stmt.executeUpdate();
			stmt.close();
			
			
			stmt=FactoryConnection.getInstancia().getConn().prepareStatement(
					"DELETE FROM caracteristicas WHERE idCaracteristica=?"
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
