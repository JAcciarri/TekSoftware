package logica;

import java.util.ArrayList;

import datos.DataMensajes;
import entidades.Mensaje;
import entidades.Pedido;

public class ChatController {

	private DataMensajes dm;
		
	public ChatController() {
			this.dm = new DataMensajes();
	}
		
	public ArrayList<Mensaje> getAllMensajesByPedido(Pedido p) {
		return dm.getAllMensajesByPedido(p);
	}
}
