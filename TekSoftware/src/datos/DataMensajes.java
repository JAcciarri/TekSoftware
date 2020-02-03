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
}
