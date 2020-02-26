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
	private Boolean isLeido;
	private String fecha_hora_string;
	
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
	
	public String getFechaHoraString() {
		return fecha_hora_string;
	}
	
	public void setFechaHoraString(Date datetime_sql) {
		String base = datetime_sql.toString();
		String year = base.substring(0, 4);
		String month = base.substring(5, 7);
		String day = base.substring(8, 10);
		String hour = base.substring(11, 16);
		switch(month) {
		case "01": {month = "Ene"; break;}
		case "02": {month = "Feb"; break;}
		case "03": {month = "Mar"; break;}
		case "04": {month = "Abr"; break;}
		case "05": {month = "May"; break;}
		case "06": {month = "Jun"; break;}
		case "07": {month = "Jul"; break;}
		case "08": {month = "Ago"; break;}
		case "09": {month = "Sep"; break;}
		case "10": {month = "Oct"; break;}
		case "11": {month = "Nov"; break;}
		case "12": {month = "Dic"; break;}
		}
		// Ejemplo: 03 Mar 2020, 14:30 
		this.fecha_hora_string = new String(day +" "+ month + " " + year +", "+ hour);
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

	public Boolean getIsLeido() {
		return isLeido;
	}

	public void setIsLeido(Boolean isLeido) {
		this.isLeido = isLeido;
	}
}
