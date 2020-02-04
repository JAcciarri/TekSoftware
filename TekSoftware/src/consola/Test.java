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
	
					PedidoController pCtrl = new PedidoController();
					ChatController chat = new ChatController();
					Usuario admin = new Usuario();
					admin.setIdUsuario(27);
					Pedido p = new Pedido();
					p.setIdPedido(55);
					ArrayList<Mensaje> mensajes = chat.getAllMensajesByPedido(p);
					
					for (Mensaje msj : mensajes) {
						if (msj.getIsFromUser()){
							System.out.println("el mensaje : " + msj.getMensaje() + " viene de un usuario");
						}
						else {
							System.out.println("el mensaje : " + msj.getMensaje() + " viene de un admin");
						}
					}
					System.out.println(mensajes.get(0).getPedido());
					
	}

}
