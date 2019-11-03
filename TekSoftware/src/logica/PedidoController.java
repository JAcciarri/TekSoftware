package logica;

import java.util.Date;

import datos.DataPedido;

import java.util.ArrayList;
import entidades.*;

public class PedidoController {

	public Pedido registrarPedido(ArrayList<Seleccion> selecciones, Usuario cliente) {
		Pedido p = new Pedido();
		DataPedido dp = new DataPedido();
		
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
	
}
