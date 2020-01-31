package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;


import entidades.Usuario;

public class DataEstadistica {

	private DataCaracteristica datac;
	private DataPedido datap;
	private DataUsuario datau;
	
	public DataEstadistica() {
		this.datac = new DataCaracteristica();
		this.datap = new DataPedido();
		this.datau = new DataUsuario();
	}
	
	//Clientes
	public Usuario getClienteMasPedidor() {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Usuario u = null;
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
							"SELECT COUNT(idCliente), idCliente " + 
							"FROM pedidos " + 
							"GROUP BY idCliente " + 
							"ORDER BY COUNT(idCliente) DESC"
							);
			
			rs = stmt.executeQuery();
			if (rs!=null && rs.next()) {
				u = new Usuario();
				int idCliente = rs.getInt(2);
				u = datau.getByID(idCliente);
				u.setPedidosHechos(rs.getInt(1));
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
		return u;
	}
	
	public HashMap<String, Integer> getUsuariosDiferenciados(){
		HashMap<String, Integer> dict = new HashMap<String, Integer>();
		int totalUsers = datau.getAllUsers().size();
		int totalAdmins = datau.getAllAdmins().size();
		dict.put("total", totalUsers);
		dict.put("admins", totalAdmins);
		dict.put("users", totalUsers - totalAdmins);
		return dict;
	}
	
	//Pedidos
	public double getMaxMontoTotal() {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int max = 0;
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
							"SELECT MAX(montoTotal) FROM pedidos");
			
			rs = stmt.executeQuery();
			if (rs!=null && rs.next()) {
				return rs.getDouble(1);
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
		return max;
	}
	
	public int getCountPedidosAprobados() {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement( "SELECT COUNT(idPedido) FROM pedidos WHERE estado=?");
			stmt.setString(1, "Aprobado");
			rs = stmt.executeQuery();
			if (rs != null && rs.next()) {
				count = rs.getInt(1);
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
		return count;
	}
	
	public int getCountPedidosPendientes() {
		return datap.getCountPedidosPendientes();
	}
	//Caracteristicas
	
}
