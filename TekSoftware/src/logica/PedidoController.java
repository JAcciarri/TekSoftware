package logica;

import java.util.Date;

import datos.DataPedido;

import java.util.ArrayList;
import entidades.*;

public class PedidoController {

	public void registrarPedido(ArrayList<Seleccion> selecciones, Usuario cliente) {
		Pedido p = new Pedido();
		DataPedido dp = new DataPedido();
		
		p.setCliente(cliente);
		p.setEstado("Pendiente");
		p.setFechaPedido(new Date());
		dp.add(p);
		dp.addOpciones(selecciones, p);
		
	}
}
