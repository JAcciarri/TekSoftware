package logica;

import java.util.ArrayList;
import java.util.HashMap;

import datos.DataEstadistica;
import entidades.Opcion;
import entidades.Pedido;
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
	public Usuario getLastUser() {
		return de.getLastUser();
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
	
	public double[] getPromedioAprobacion() {
		return de.getPromedioAprobacion();
	}
	public ArrayList<Pedido> getPedidosParaPromedio(){
		return de.getPedidosParaPromedios();
	}
	
	//Caracteristicas
	public ArrayList<Opcion> getRankingOpciones(){
		return de.getRankingOpciones();
	}
	
}
