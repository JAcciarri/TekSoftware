package logica;

import java.util.ArrayList;

import org.apache.commons.codec.digest.DigestUtils;

import datos.DataUsuario;
import entidades.MyResult;
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
	
	public MyResult add(Usuario u) {
		return du.add(u);
	}
	
	public MyResult update(Usuario u) {
		return du.update(u);
	}
	
	public MyResult delete(int ID) {
		return du.delete(ID);
	}
	
	public Usuario getLastUser() {
		int maxID = du.getMAXID();
		return du.getByID(maxID);
	}
}
