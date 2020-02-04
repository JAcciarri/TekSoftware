package entidades;

import java.util.Date;

public class Mensaje {

	private Usuario cliente;
	private Usuario Admin;
	private Usuario user;
	private Pedido pedido;
	private String mensaje;
	private Date fecha_hora;
	private Boolean isFromUser;
	
	public Mensaje(){}
	
	public Mensaje(int idCliente, int idAdmin, int idPedido, String msj, Boolean isFromUser) {
		Usuario cli = new Usuario(); cli.setIdUsuario(idCliente);
		Usuario adm = new Usuario(); adm.setIdUsuario(idAdmin);
		Pedido p = new Pedido(); p.setIdPedido(idPedido);
		this.cliente = cli;
		this.Admin = adm;
		this.pedido = p;
		this.mensaje = msj;
		this.isFromUser = isFromUser;
	}
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

	public Boolean getIsFromUser() {
		return isFromUser;
	}

	public void setIsFromUser(Boolean isFromUser) {
		this.isFromUser = isFromUser;
	}
}
