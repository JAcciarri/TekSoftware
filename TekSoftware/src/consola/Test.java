package consola;

import entidades.Pedido;
import logica.ChatController;
import logica.EstadisticaController;
import logica.PedidoController;

public class Test {
	
	
	public static void main(String[] args) {
	
					PedidoController pCtrl = new PedidoController();
					ChatController chat = new ChatController();
					int idPedido = 61;
					Pedido p = pCtrl.getPedidoByID(idPedido);
					
					if (chat.getAllMensajesByPedido(p).size()>0) {
						System.out.println("ya dejaste un mensaje");
					} else {
					System.out.println("todavia no hay mensajes");
					}
	}

}
