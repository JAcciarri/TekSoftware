package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.Pedido;

public class DataPedido {

	
	public void add(Pedido p) {
	
		PreparedStatement stmt = null;
		ResultSet keyResultSet = null;
		try {
			stmt = FactoryConnection.getInstancia().getConn().
					prepareStatement(
							"INSERT INTO pedidos (idCliente, estado) values(?,?)",
							PreparedStatement.RETURN_GENERATED_KEYS
							);
			stmt.setInt(1, p.getCliente().getIdUsuario());
			stmt.setString(2, p.getEstado());
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
	
	public void agregarPedidoOpcion(int nroCaract, int nroOpc) {
		
	}
	
}
