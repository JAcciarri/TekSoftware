package consola;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;

import entidades.Mensaje;
import entidades.Pedido;
import entidades.Usuario;
import logica.ChatController;
import logica.EstadisticaController;
import logica.PedidoController;

public class Test {
	
	
	public static void main(String[] args) {
	
					
		ChatController chat = new ChatController();
		PedidoController pCtrl = new PedidoController();
		Pedido p = new Pedido();
		p.setIdPedido(62);
		p = pCtrl.getPedidoByID(p.getIdPedido());
		System.out.println();
		ArrayList<Mensaje> mensajes = chat.getAllMensajesByPedido(p);
		System.out.println(mensajes.isEmpty());
		System.out.println(mensajes.size());
		System.out.println(mensajes == null);
		
	}

}
