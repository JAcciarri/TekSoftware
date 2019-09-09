package entidades;

import java.util.Date;

public class Usuario {
	
	private int idUsuario;
	private String nombre;
	private String apellido;
	private String telefono;
	private String email;
	private Date fechaNacimiento;
	private String username;
	private String password;
	private boolean privilegio;
	
	public Usuario(){}

	public Usuario(String nombre, String apellido, String usuario, String password , String email, String telefono) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.username = usuario;
		this.password = password;
		this.email = email;
		this.telefono = telefono;
	}
	
	public Usuario(String nombre, String apellido) {
		this.nombre = nombre;
		this.apellido = apellido;
	}
	
	public Usuario(String username) {
		this.username = username;
	}
	
	public void setPrivilegio(Boolean bool) {
		this.privilegio = bool;
	}
	
	public Boolean isAdmin() {
		return this.privilegio;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}
	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}


}