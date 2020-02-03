package consola;

import entidades.Pedido;
import logica.ChatController;
import logica.EstadisticaController;

public class Test {
	
	
	public static void main(String[] args) {
		
		ChatController chat = new ChatController();
		Pedido p = new Pedido();
		p.setIdPedido(55);
		System.out.println(chat.getAllMensajesByPedido(p));
	}

}
