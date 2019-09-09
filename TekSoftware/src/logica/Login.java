package logica;

import datos.DataUsuario;
import entidades.Usuario;

public class Login {

	private DataUsuario du;
	
	public Usuario validar(Usuario u) {
		du = new DataUsuario();
		return du.getByUsername(u);
	}
	
}
