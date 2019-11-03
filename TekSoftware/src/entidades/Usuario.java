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
	
	// FULL USUARIO
	public Usuario(String nombre, String apellido, String usuario, String password , String email, String telefono, Boolean isAdmin) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.username = usuario;
		this.password = password;
		this.email = email;
		this.telefono = telefono;
		this.privilegio = isAdmin;
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
	
	public String getFullName() {
		return nombre + " " + apellido;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getNombre() {
		String name = Character.toUpperCase(this.nombre.charAt(0)) + this.nombre.substring(1,this.nombre.length());
		return name;
	}
	public void setNombre(String nombre) {
		String name = Character.toUpperCase(nombre.charAt(0)) + nombre.substring(1, nombre.length());
		this.nombre = name;
	}
	public String getApellido() {
		String apellido = Character.toUpperCase(this.apellido.charAt(0)) + this.apellido.substring(1,this.apellido.length());
		return apellido;
	}
	public void setApellido(String apellido) {
		String ape = Character.toUpperCase(apellido.charAt(0)) + apellido.substring(1, apellido.length());
		this.apellido = ape;
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