package entidades;

import java.util.Date;

public class Mensaje {

	private Usuario cliente;
	private Usuario Admin;
	private Usuario user;
	private Pedido pedido;
	private String mensaje;
	private Date fecha_hora;
	

	public Usuario getCliente() {
		return cliente;
	}
	public void setCliente(Usuario cliente) {
		this.cliente = cliente;
	}
	public Usuario getAdmin() {
		return Admin;
	}
	public void setAdmin(Usuario admin) {
		Admin = admin;
	}
	public Pedido getPedido() {
		return pedido;
	}
	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}
	public String getMensaje() {
		return mensaje;
	}
	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
	public Date getFecha_hora() {
		return fecha_hora;
	}
	public void setFecha_hora(Date fecha_hora) {
		this.fecha_hora = fecha_hora;
	}
	public Usuario getUser() {
		return user;
	}
	public void setUser(Usuario user) {
		this.user = user;
	}
}
