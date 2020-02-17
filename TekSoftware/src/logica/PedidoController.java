package logica;

import java.util.Date;

import datos.DataPedido;

import java.util.ArrayList;
import entidades.*;

public class PedidoController {

	DataPedido dp;
	
	public PedidoController() {
		this.dp = new DataPedido();
	}
	
	public ArrayList<Pedido> getAllPedidos(){
		return dp.getAllPedidos();
	}
	
	public Pedido registrarPedido(ArrayList<Seleccion> selecciones, Usuario cliente) {
		Pedido p = new Pedido();
		
		p.setCliente(cliente);
		p.setEstado("Pendiente");
		p.setFechaPedido(new Date());
		this.calcularMontoTotal(p, selecciones);
		dp.add(p);
		dp.addOpciones(selecciones, p);
		
		return p;
	}
	
	
	//separamos la logica de calcular el monto total porque el dia de mañana
	// puede variar la forma en que calculamos el mismo
	public void calcularMontoTotal(Pedido p, ArrayList<Seleccion> selects) {
		double total = dp.getValoresActuales(selects);
		p.setMontoTotal(total);
	}
	
	public ArrayList<Pedido> getPedidosByCliente(int IDCliente){
		return dp.getPedidosByCliente(IDCliente);
	}
	public ArrayList<Pedido> getPedidosByAdmin(Usuario admin){
		return dp.getPedidosByAdmin(admin);
	}
	
	public Pedido getPedidoPendienteByCliente(int IDCliente) {
		return dp.getPedidoPendienteByCliente(IDCliente);
	}
	
	public ArrayList<Pedido> getPedidosByPartialClient(String datosParciales){
		return dp.getPedidosByPartialClient(datosParciales);
	}
	
	public Pedido getPedidoByID(int IDPedido) {
		return dp.getPedidoByID(IDPedido);
	}
	
	public ArrayList<Seleccion> getSeleccionesByIDPedido(int IDPedido){
		return dp.getSeleccionesByIDPedido(IDPedido);
	}
	
	public int getCountPedidosPendientes() {
		return dp.getCountPedidosPendientes();
	}
	
	public void deletePedido(int IDPedido) {
		// lo borramos solo si es que existe
		if (dp.getPedidoByID(IDPedido) != null) {
		 dp.deletePedido(IDPedido);
		}
	}
	
	public void rechazarPedido(Pedido pedido) {
		dp.rechazarPedido(pedido);
	}
	
	public void aprobarPedido(Pedido pedido) {
		dp.aprobarPedido(pedido);
	}
}
