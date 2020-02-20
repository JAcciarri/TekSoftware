package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import entidades.Caracteristica;
import entidades.Opcion;
import entidades.Pedido;
import entidades.Usuario;
import logica.UsuarioController;

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
	
	public Usuario getLastUser() {
		int max = datau.getMAXID();
		return datau.getByID(max);
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

	public ArrayList<Pedido> getPedidosParaPromedios(){
		PreparedStatement stmt=null;
		ResultSet rs=null;
		ArrayList<Pedido> listaPedidos= new ArrayList<>();
		
		try {
			stmt = FactoryConnection.getInstancia().getConn().prepareStatement(
					"SELECT idPedido, fechaPedido, fechaAprobacion, datediff(fechaAprobacion, fechaPedido) as Diferencia " + 
					"FROM pedidos " + 
					"WHERE fechaAprobacion IS NOT NULL"
					);
			
			rs = stmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					Pedido p = new Pedido();
					p.setIdPedido(rs.getInt("idPedido"));
					p.setFechaPedido(rs.getTimestamp("fechaPedido"));
					p.setFechaAprobacion(rs.getTimestamp("fechaAprobacion"));
					p.setDiferenciaDias(rs.getInt("Diferencia"));
					listaPedidos.add(p);
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
		
		return listaPedidos;
	}
	
	
	public double[] getPromedioAprobacion() {
		double[] nums = new double[2];
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt = FactoryConnection.getInstancia().getConn().prepareStatement(
					"SELECT SUM(datediff(fechaAprobacion, fechaPedido)) as Total, AVG(datediff(fechaAprobacion, fechaPedido)) as Promedio " + 
					"FROM pedidos " + 
					"WHERE fechaAprobacion IS NOT NULL"
					);
			
			rs = stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				nums[0] = rs.getInt("Total");
				nums[1] = rs.getDouble("Promedio");
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
		
		return nums;
		
	}
	
	
	
	//Caracteristicas
	

	public ArrayList<Opcion> getRankingOpciones(){
		PreparedStatement stmt=null;
		ResultSet rs=null;
		ArrayList<Opcion> opciones = new ArrayList<>();
		
		try {
			stmt = FactoryConnection.getInstancia().getConn().prepareStatement(
					"CALL tt_for_ranking"
					);
			
			rs = stmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					Opcion op = new Opcion();
					op.setCaractPerteneciente(new Caracteristica(rs.getString("car.titulo")));
					op.setSubtitulo(rs.getString("op.subtitulo"));
					op.setDescripcion(rs.getString("op.descripcion"));
					op.setVecesElegida(rs.getInt("t2.maxi"));
					opciones.add(op);
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
		
		return opciones;
		
		
	}
	
}
