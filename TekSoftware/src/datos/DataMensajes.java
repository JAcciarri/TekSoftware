package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;

import entidades.Mensaje;
import entidades.Pedido;
import entidades.Usuario;


public class DataMensajes {


	public ArrayList<Mensaje> getAllMensajesByPedido(Pedido p){
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Mensaje> mensajes = null;
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
							"SELECT c.idPedido, u.nombre, u.apellido, c.mensaje, c.fechaHoraMensaje, c.idCliente, c.idAdmin, c.isFromUser "
							+ "FROM chat c "
							+ "INNER JOIN usuarios u "
							+ "	 ON u.idUsuario = c.idCliente "
							+ " WHERE c.idPedido = ? "
							);
			stmt.setInt(1, p.getIdPedido());
			rs = stmt.executeQuery();
			
			if (rs!=null) {
				mensajes = new ArrayList<Mensaje>();
				while (rs.next()) {
					Mensaje m = new Mensaje();
					Usuario user = new Usuario();
					Usuario admin = new Usuario();
					user.setNombre(rs.getString("u.nombre"));
					user.setApellido(rs.getString("u.apellido"));
					user.setIdUsuario(rs.getInt("c.idCliente"));
					admin.setIdUsuario(rs.getInt("c.idAdmin"));
					Boolean isfromuser = rs.getBoolean("c.isFromUser");
					if (isfromuser) 
						m.setIsFromUser(true); else m.setIsFromUser(false);
					m.setUser(user);
					m.setAdmin(admin);
					m.setMensaje(rs.getString("c.mensaje"));
					m.setFecha_hora(rs.getTimestamp("c.fechaHoraMensaje"));
					m.setPedido(p);
					mensajes.add(m);
				}
			} 
			}  catch (SQLException e) {
	        e.printStackTrace();
		} finally {
	        try {
	            if(rs!=null) rs.close();
	            if(stmt!=null) stmt.close();
	            FactoryConnection.getInstancia().releaseConn();
	        } catch (SQLException e) {
	        	e.printStackTrace();
	        }
		}
		
		return mensajes;
	}

	public ArrayList<Mensaje> getAllMensajesByAdmin(Usuario admin){
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Mensaje> mensajes = null;
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
							"SELECT c.idPedido, c.idCliente, c.idAdmin, c.mensaje, c.fechaHoraMensaje, u.nombre, u.apellido "
							+ "FROM chat c " 
							+ "INNER JOIN usuarios u "
							+  "ON u.idUsuario = c.idCliente "
							+  "WHERE idAdmin = ? "
							+  "GROUP BY 1,2,3,4,5,6,7 "
							);
			stmt.setInt(1, admin.getIdUsuario());
			rs = stmt.executeQuery();
			
			if (rs!=null) {
				mensajes = new ArrayList<Mensaje>();
				while (rs.next()) {
					Mensaje m = new Mensaje();
					
					Pedido p = new Pedido();
					p.setIdPedido(rs.getInt("c.idPedido"));
					m.setPedido(p);
					Usuario cliente = new Usuario();
					Usuario administrador = new Usuario();
						cliente.setIdUsuario(rs.getInt("c.idCliente"));
						cliente.setNombre(rs.getString("u.nombre"));
						cliente.setApellido(rs.getString("u.apellido"));
					m.setCliente(cliente);
						administrador.setIdUsuario(rs.getInt("c.idAdmin"));
					m.setAdmin(administrador);
					m.setMensaje(rs.getString("c.mensaje"));
					m.setFecha_hora(rs.getTimestamp("fechaHoraMensaje"));
					mensajes.add(m);
				}
			} 
			}  catch (SQLException e) {
	        e.printStackTrace();
		} finally {
	        try {
	            if(rs!=null) rs.close();
	            if(stmt!=null) stmt.close();
	            FactoryConnection.getInstancia().releaseConn();
	        } catch (SQLException e) {
	        	e.printStackTrace();
	        }
		}
		return mensajes;
	}
	
	public LinkedList<Pedido> getIDsPedidosForChat(Usuario admin){
		LinkedList<Pedido> listaIDS = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
							"SELECT c.idPedido, u.nombre, u.apellido " +
							"FROM chat c " +
							"INNER JOIN usuarios u " +
								"ON c.idCliente = u.idUsuario " +
							"WHERE idAdmin = ? " +
							"GROUP BY 1, 2, 3 "
							);
			stmt.setInt(1, admin.getIdUsuario());
			rs = stmt.executeQuery();
			
			if (rs!=null) {
				listaIDS = new LinkedList<Pedido>();
				while (rs.next()) {
					int ID = rs.getInt("idPedido");
					String nombre = rs.getString("u.nombre");
					String apellido = rs.getString("u.apellido");
					Pedido pedido = new Pedido();
					Usuario u = new Usuario(); u.setNombre(nombre); u.setApellido(apellido);
					pedido.setCliente(u);
					pedido.setIdPedido(ID);
					listaIDS.add(pedido);
				}
			} 
			}  catch (SQLException e) {
	        e.printStackTrace();
		} finally {
	        try {
	            if(rs!=null) rs.close();
	            if(stmt!=null) stmt.close();
	            FactoryConnection.getInstancia().releaseConn();
	        } catch (SQLException e) {
	        	e.printStackTrace();
	        }
		}
		return listaIDS;
	}
	
	public void addMensaje(Mensaje msj) {
		PreparedStatement stmt = null;
		
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
							" INSERT INTO chat (idPedido, idCliente, idAdmin, mensaje, isFromUser, leidoPorAdmin) "
							+ " VALUES(?,?,?,?,?,?) "
							);
			stmt.setInt(1, msj.getPedido().getIdPedido());
			stmt.setInt(2, msj.getCliente().getIdUsuario());
			stmt.setInt(3, msj.getAdmin().getIdUsuario());
			stmt.setString(4, msj.getMensaje());
			stmt.setBoolean(5, msj.getIsFromUser());
			if (!msj.getIsFromUser()) {
				stmt.setBoolean(6, true);
			} else stmt.setBoolean(6, false);
			
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

	public Boolean hasMensajesNoLeidosByAdmin(Usuario admin) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Boolean flag = false;
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
							"SELECT COUNT(*) "
							+ "FROM chat "
							+ "WHERE idAdmin=? AND leidoPorAdmin=?"
							);
			
			stmt.setInt(1, admin.getIdUsuario());
			stmt.setInt(2, new Integer(0));
			rs = stmt.executeQuery();
			
			if (rs!=null && rs.next()) {
				
				if (rs.getInt("COUNT(*)") > 0) {
					flag = true;
				}
			} 
			}  catch (SQLException e) {
	        e.printStackTrace();
		} finally {
	        try {
	            if(rs!=null) rs.close();
	            if(stmt!=null) stmt.close();
	            FactoryConnection.getInstancia().releaseConn();
	        } catch (SQLException e) {
	        	e.printStackTrace();
	        }
		}
		
		return flag;
	}

	public Boolean hasMensajesNoLeidosByPedido(Pedido p) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Boolean flag = false;
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
							"SELECT COUNT(*) "
							+ "FROM chat "
							+ "WHERE idPedido=? AND leidoPorAdmin=?"
							);
			
			stmt.setInt(1, p.getIdPedido());
			stmt.setInt(2, new Integer(0));
			rs = stmt.executeQuery();
			
			if (rs!=null && rs.next()) {
				
				if (rs.getInt("COUNT(*)") > 0) {
					flag = true;
				}
			} 
			}  catch (SQLException e) {
	        e.printStackTrace();
		} finally {
	        try {
	            if(rs!=null) rs.close();
	            if(stmt!=null) stmt.close();
	            FactoryConnection.getInstancia().releaseConn();
	        } catch (SQLException e) {
	        	e.printStackTrace();
	        }
		}
		
		return flag;
	}
	
	public void setMensajesLeidos(Pedido p) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
							"UPDATE chat " 
							+ "SET leidoPorAdmin = 1 " 
							+ "WHERE idAdmin = ? AND idPedido = ? "
							);
			
			stmt.setInt(1, p.getAdmin().getIdUsuario());
			stmt.setInt(2, p.getIdPedido());
			stmt.executeUpdate();
			
			}  catch (SQLException e) {
	        e.printStackTrace();
		} finally {
	        try {
	            if(rs!=null) rs.close();
	            if(stmt!=null) stmt.close();
	            FactoryConnection.getInstancia().releaseConn();
	        } catch (SQLException e) {
	        	e.printStackTrace();
	        }
		}
		
	}

}
