package logica;

import java.util.ArrayList;

import org.apache.commons.codec.digest.DigestUtils;

import datos.DataUsuario;
import entidades.Usuario;

public class UsuarioController {

	DataUsuario du;
	
	public UsuarioController() {
		this.du = new DataUsuario();
	}
	
	public ArrayList<Usuario> getAllUsers(){
		return du.getAllUsers();
	}
	public ArrayList<Usuario> getAllAdmins(){
		return du.getAllAdmins();
	}
	
	public ArrayList<Usuario> getUsersByPartialDesc(String desc){
		return du.getUsersByPartialDesc(desc);
	}
	public Usuario getByUsername(Usuario usuario) {
		return du.getByUsername(usuario);
	}
	
	public Usuario getByID(int ID) {
		return du.getByID(ID);
	}
	
	public void add(Usuario u) {
		//Metodo para encriptar la contraseña
		String passEncrypted = DigestUtils.sha1Hex(u.getPassword());
		u.setPassword(passEncrypted);
		du.add(u);
	}
	
	public void update(Usuario u) {
		du.update(u);
	}
	
	public void delete(int ID) {
		du.delete(ID);
	}
}
