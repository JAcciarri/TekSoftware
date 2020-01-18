package logica;

import java.util.Date;

import datos.DataPedido;
import datos.DataUsuario;

import java.util.ArrayList;
import entidades.*;

public class PedidoController {

	DataPedido dp;
	
	public PedidoController() {
		this.dp = new DataPedido();
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
		DataPedido dp = new DataPedido();
		double total = dp.getValoresActuales(selects);
		p.setMontoTotal(total);
	}
	
	public ArrayList<Pedido> getPedidosAprobadosByCliente(int IDCliente){
		return dp.getPedidosAprobadosByCliente(IDCliente);
	}
	
	public Pedido getPedidoPendienteByCliente(int IDCliente) {
		return dp.getPedidoPendienteByCliente(IDCliente);
	}
	
	public ArrayList<Pedido> getPedidosByPartialClient(String datosParciales){
		return dp.getPedidosByPartialClient(datosParciales);
	}
}
