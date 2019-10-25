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
		dp.add(p);
	    // p.setFechaPedido(new Date());
		
		for (Seleccion sel : selecciones) {
			dp.agregarPedidoOpcion(sel.getNroCaracteristica(), sel.getNroOpcion());
		}
		
		System.out.println("Pedido registrado");
		System.out.println("En el dia: " + p.getFechaPedido());
		System.out.println("Cliente del pedido: " + cliente.getNombre() + cliente.getApellido());
		System.out.println("Las opciones elegidas fueron:");
		for (Seleccion s : selecciones) {
			System.out.println(
			   "Caract: " + s.getNroCaracteristica() + " Opc: " + s.getNroOpcion());
		}
	}
}
