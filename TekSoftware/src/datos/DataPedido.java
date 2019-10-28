package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Pedido;
import entidades.Seleccion;

public class DataPedido {

	
	public void add(Pedido p) {
	
		PreparedStatement stmt = null;
		ResultSet keyResultSet = null;
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
							"INSERT INTO pedidos (idCliente, fechaPedido, estado) values(?,?,?)",
							PreparedStatement.RETURN_GENERATED_KEYS
							);
			stmt.setInt(1, p.getCliente().getIdUsuario());
			stmt.setTimestamp(2, new java.sql.Timestamp(p.getFechaPedido().getTime()));
			stmt.setString(3, p.getEstado());
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
	
}
