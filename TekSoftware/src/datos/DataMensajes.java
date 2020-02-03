package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
							"SELECT c.idPedido, u.nombre, u.apellido, c.mensaje, c.fechaHoraMensaje, c.idAdmin "
							+ "FROM chat c "
							+ "INNER JOIN usuarios u "
							+ "	 ON u.idUsuario = c.idCliente OR u.idUsuario = c.idAdmin "
							+ " WHERE c.idPedido = ? "
							);
			stmt.setInt(1, p.getIdPedido());
			rs = stmt.executeQuery();
			
			if (rs!=null) {
				mensajes = new ArrayList<Mensaje>();
				while (rs.next()) {
					Mensaje m = new Mensaje();
					Usuario user = new Usuario();
					user.setNombre(rs.getString("nombre"));
					user.setApellido(rs.getString("apellido"));
					Boolean isadmin = rs.getBoolean("c.idAdmin");
					if (isadmin) user.setPrivilegio(true);
					m.setUser(user);
					m.setMensaje(rs.getString("mensaje"));
					m.setFecha_hora(rs.getTimestamp("fechaHoraMensaje"));
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
							+  "GROUP BY idPedido, idCliente, fechaHoraMensaje "
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
	
	public void addMensaje(Mensaje msj) {
		PreparedStatement stmt = null;
		
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
							" INSERT INTO chat (idPedido, idCliente, idAdmin, mensaje) "
							+ " VALUES(?,?,?,?) "
							);
			stmt.setInt(1, msj.getPedido().getIdPedido());
			stmt.setInt(2, msj.getCliente().getIdUsuario());
			stmt.setInt(3, msj.getAdmin().getIdUsuario());
			stmt.setString(4, msj.getMensaje());
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
