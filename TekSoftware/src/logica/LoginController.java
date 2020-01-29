package logica;

import org.apache.commons.codec.digest.DigestUtils;

import datos.DataUsuario;
import entidades.Usuario;

public class LoginController {

	private DataUsuario du;
	
	public LoginController() {
		this.du = new DataUsuario();
	}
	
	public Usuario validar(Usuario u) {
		//Encriptamos la contraseña y la comparamos con la BD
		String passEncrypted = DigestUtils.sha1Hex(u.getPassword());
		u.setPassword(passEncrypted);
		return du.getByUsername(u);
	}
	
}
