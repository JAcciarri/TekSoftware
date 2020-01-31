package logica;

import java.util.HashMap;

import datos.DataEstadistica;
import entidades.Usuario;

public class EstadisticaController {

	private DataEstadistica de;
	
	public EstadisticaController() {
		this.de = new DataEstadistica();
	}
	
	//Clientes
	public Usuario getClienteMasPedidor() {
		return de.getClienteMasPedidor();
	}
	
	public HashMap<String, Integer> getUsuariosDiferenciados(){
		return de.getUsuariosDiferenciados();
	}
	
	//Pedidos
	public double getMaxMontoTotal() {
		return de.getMaxMontoTotal();
	}
	public int getCountAprobados() {
		return de.getCountPedidosAprobados();
	}
	public int getCountPedidosPendientes() {
		return de.getCountPedidosPendientes();
	}
	//Caracteristicas
}
