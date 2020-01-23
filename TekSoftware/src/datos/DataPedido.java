package datos;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import entidades.Caracteristica;
import entidades.Opcion;
import entidades.Pedido;
import entidades.Seleccion;
import entidades.Usuario;
import logica.UsuarioController;
import oracle.jrockit.jfr.tools.ConCatRepository;


public class DataPedido {

	
	public void add(Pedido p) {
	
		PreparedStatement stmt = null;
		ResultSet keyResultSet = null;
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
							"INSERT INTO pedidos (idCliente, fechaPedido, estado, montoTotal) values(?,?,?,?)",
							PreparedStatement.RETURN_GENERATED_KEYS
							);
			stmt.setInt(1, p.getCliente().getIdUsuario());
			stmt.setTimestamp(2, new java.sql.Timestamp(p.getFechaPedido().getTime()));
			stmt.setString(3, p.getEstado());
			stmt.setDouble(4, p.getMontoTotal());
			stmt.executeUpdate();
			
			keyResultSet = stmt.getGeneratedKeys();
	       
			if(keyResultSet!=null && keyResultSet.next()){
	            p.setIdPedido(keyResultSet.getInt(1));
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
	
	public void addOpciones(ArrayList<Seleccion> selecciones, Pedido p) {
		PreparedStatement stmt = null;
		// ResultSet rs = null;
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
					"INSERT INTO pedido_caracteristicas (idPedido, idCaracteristica, idOpcion) values(?,?,?)");
			
			for(Seleccion sel : selecciones) 
			{
				stmt.setInt(1, p.getIdPedido());
				stmt.setInt(2, sel.getNroCaracteristica());
				stmt.setInt(3, sel.getNroOpcion());
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
	
	public double getValoresActuales(ArrayList<Seleccion> selects) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		double total = 0;
		try {
		
			stmt = FactoryConnection.getInstancia().getConn().prepareStatement(		
					"SELECT v.valor " +
					"FROM valores v " +
					"INNER JOIN maximas_fechas mf " +
					"ON v.idCaracteristica = mf.idCaracteristica AND v.idOpcion = mf.idOpcion AND v.fecha_desde = mf.maxFecha " +
					"WHERE v.idCaracteristica=? AND v.idOpcion=?; "
					);
			
			for(Seleccion s : selects) {
				stmt.setInt(1, s.getNroCaracteristica());
				stmt.setInt(2, s.getNroOpcion());
				rs = stmt.executeQuery();
				
				if(rs!=null && rs.next()) {
					total += rs.getDouble("v.valor");
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
		
		return total;
	}
	
	public ArrayList<Pedido> getAllPedidos(){
		
			PreparedStatement stmt=null;
			ResultSet rs=null;
			ArrayList<Pedido> listaPedidos= new ArrayList<>();
			DataUsuario du = new DataUsuario();
			
			try {
				stmt = FactoryConnection.getInstancia().getConn().prepareStatement(
						"SELECT * FROM pedidos");
				
				rs = stmt.executeQuery();
				
				if(rs!=null) {
					while(rs.next()) {
						Pedido p = new Pedido();
						p.setIdPedido(rs.getInt("idPedido"));
						p.setFechaPedido(rs.getTimestamp("fechaPedido"));
						Usuario u = du.getByID(rs.getInt("idCliente"));
						p.setCliente(u);
						p.setEstado(rs.getString("estado"));
						p.setMontoTotal(rs.getDouble("montoTotal"));
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
	
	public ArrayList<Pedido> getPedidosAprobadosByCliente(int IDCliente){
		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		ArrayList<Pedido> pedidos = new ArrayList<Pedido>();
		DataUsuario du = new DataUsuario();
		
		try {
			
			stmt= FactoryConnection.getInstancia().getConn().prepareStatement(
					"SELECT * FROM pedidos WHERE idCliente=? AND estado='Aprobado' OR estado='Rechazado'");
			stmt.setInt(1, IDCliente);
			rs = stmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					Pedido p = new Pedido();
					p.setIdPedido(rs.getInt("idPedido"));
					p.setFechaPedido(rs.getTimestamp("fechaPedido"));
					Usuario user = du.getByID(IDCliente);
					p.setCliente(user);
					p.setEstado(rs.getString("estado"));
					p.setMontoTotal(rs.getDouble("montoTotal"));
					pedidos.add(p);
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
		
		return pedidos;
	}
	
	public Pedido getPedidoPendienteByCliente(int IDCliente){
		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Pedido pedido = null;
		DataUsuario du = new DataUsuario();
		
		try {
			
			stmt= FactoryConnection.getInstancia().getConn().prepareStatement(
					"SELECT * FROM pedidos WHERE idCliente=? AND estado='Pendiente'");
			stmt.setInt(1, IDCliente);
			rs = stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
					pedido = new Pedido();
					pedido.setIdPedido(rs.getInt("idPedido"));
					pedido.setFechaPedido(rs.getTimestamp("fechaPedido"));
					Usuario user = du.getByID(IDCliente);
					pedido.setCliente(user);
					pedido.setEstado(rs.getString("estado"));
					pedido.setMontoTotal(rs.getDouble("montoTotal"));
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
		return pedido;
	}
	
	public ArrayList<Pedido> getPedidosByPartialClient(String datosParciales){
		    DataUsuario du = new DataUsuario();
			ArrayList<Pedido> pedidosDelCliente = new ArrayList<Pedido>();
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			try {
				String sql = ("SELECT * FROM pedidos p "
						+ "INNER JOIN usuarios u ON p.idCliente = u.idUsuario "
						+ "WHERE u.usuario LIKE '" + datosParciales + "%'");
				
				stmt=FactoryConnection.getInstancia().getConn().prepareStatement(sql);
				rs = stmt.executeQuery();
				
				if(rs!=null) {
					while(rs.next()) {
						Pedido p = new Pedido();
						p.setIdPedido(rs.getInt("idPedido"));
						p.setFechaPedido(rs.getTimestamp("fechaPedido"));
						Usuario user = du.getByID(rs.getInt("idCliente"));
						p.setCliente(user);
						p.setEstado(rs.getString("estado"));
						p.setMontoTotal(rs.getDouble("montoTotal"));
						pedidosDelCliente.add(p);
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
			return pedidosDelCliente;
	}
	
	public Pedido getPedidoByID(int IDPedido) {
		UsuarioController uController = new UsuarioController();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Pedido p = null;
		
		try {
			stmt= FactoryConnection.getInstancia().getConn().prepareStatement(
					"SELECT * FROM pedidos WHERE idPedido = ?");
			stmt.setInt(1, IDPedido);
			rs = stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
					p = new Pedido();
					p.setIdPedido(rs.getInt("idPedido"));
					p.setFechaPedido(rs.getTimestamp("fechaPedido"));
					Usuario user = uController.getByID((rs.getInt("idCliente")));
					p.setCliente(user);
					p.setEstado(rs.getString("estado"));
					p.setMontoTotal(rs.getDouble("montoTotal"));
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
		return p;
	}

	public ArrayList<Seleccion> getSeleccionesByIDPedido(int IDPedido){
		PreparedStatement stmt=null;
		ResultSet rs=null;
		ArrayList<Seleccion> selecciones = new ArrayList<Seleccion>();
		
		try {
			
			stmt= FactoryConnection.getInstancia().getConn().prepareStatement(
					"SELECT c.titulo, o.subtitulo, o.descripcion "
					+ "FROM pedido_caracteristicas pc "
					+ "INNER JOIN caracteristicas c ON pc.idCaracteristica = c.idCaracteristica "
					+ "INNER JOIN opciones o ON pc.idOpcion = o.idOpcion AND pc.idCaracteristica = o.idCaracteristica "
					+ "WHERE idPedido = ?");
			stmt.setInt(1, IDPedido);
			rs = stmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					Seleccion sel = new Seleccion();
					Caracteristica c = new Caracteristica();
					c.setTitulo(rs.getString("c.titulo"));
					sel.setCaracteristica(c);
					Opcion o = new Opcion();
					o.setSubtitulo(rs.getString("o.subtitulo"));
					o.setDescripcion(rs.getString("o.descripcion"));
					sel.setOpcion(o);
					
					selecciones.add(sel);
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
		
		return selecciones;
	}
	
	public void deletePedido(int IDPedido) {
		
		PreparedStatement stmt=null;
		try {
			stmt=FactoryConnection.getInstancia().getConn().prepareStatement(
					"DELETE FROM pedido_caracteristicas WHERE idPedido=?"
					);
			stmt.setInt(1, IDPedido);
			stmt.executeUpdate();
			stmt.close();
			
			stmt=FactoryConnection.getInstancia().getConn().prepareStatement(
					"DELETE FROM pedidos WHERE idPedido=?"
					);
			stmt.setInt(1, IDPedido);
			stmt.executeUpdate();
			stmt.close();
			
			
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
	
	public void updatePedido(int IDPedido) {
		PreparedStatement stmt = null;
		
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
			"UPDATE pedidos SET fechaRechazo=?, estado = ? "
			+ "WHERE idPedido=?");
			
			stmt.setTimestamp(1, new java.sql.Timestamp(new Date().getTime()));
			stmt.setString(2, "Rechazado");
			stmt.setInt(3, IDPedido);
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
	
