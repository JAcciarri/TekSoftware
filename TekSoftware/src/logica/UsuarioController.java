package logica;

import java.util.ArrayList;

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
	
	public Usuario getByUsername(Usuario usuario) {
		return du.getByUsername(usuario);
	}
	
	public Usuario getByID(int ID) {
		return du.getByID(ID);
	}
	
	public void add(Usuario u) {
		du.add(u);
	}
	
	public void update(Usuario u) {
		du.update(u);
	}
	
	public void delete(int ID) {
		du.delete(ID);
	}
}