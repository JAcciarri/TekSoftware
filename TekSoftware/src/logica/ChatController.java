package logica;

import java.util.ArrayList;
import java.util.LinkedList;

import datos.DataMensajes;
import entidades.Mensaje;
import entidades.MyResult;
import entidades.MyResult.results;
import entidades.Pedido;
import entidades.Usuario;

public class ChatController {

	private DataMensajes dm;
		
	public ChatController() {
			this.dm = new DataMensajes();
	}
		
	public ArrayList<Mensaje> getAllMensajesByPedido(Pedido p) {
		return dm.getAllMensajesByPedido(p);
	}
	
	public ArrayList<Mensaje> getAllMensajesByAdmin(Usuario admin){
		return dm.getAllMensajesByAdmin(admin);
	}
	
	public LinkedList<Pedido> getIDsPedidosForChat(Usuario admin){
		return dm.getIDsPedidosForChat(admin);
	}
	public MyResult addMensaje(Mensaje msj) {
		MyResult res = dm.addMensaje(msj);
		// sobreescribimos el mensaje para devolver a la vista
		if (res.getResult().equals(results.OK)) {
			res.setErr_message("Mensaje enviado con exito");
		} else {
			res.setErr_message("No se pudo enviar el mensaje. Por favor reintentar");
		}
		return res;
	}
	
	public Boolean hasMensajesNoLeidosByAdmin(Usuario admin) {
		return dm.hasMensajesNoLeidosByAdmin(admin);
	}
	public Boolean hasMensajesNoLeidosByPedido(Pedido p) {
		return dm.hasMensajesNoLeidosByPedido(p);
	}
	public void setMensajesLeidos(Pedido p) {
		dm.setMensajesLeidos(p);
	}
	
}
