package logica;

import java.util.ArrayList;
import java.util.LinkedList;

import datos.DataMensajes;
import entidades.Mensaje;
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
	public void addMensaje(Mensaje msj) {
		 dm.addMensaje(msj);
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
