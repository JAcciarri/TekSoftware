package consola;



import java.util.ArrayList;

import org.apache.commons.codec.digest.DigestUtils;

import datos.FactoryConnection;
import entidades.Opcion;
import entidades.Pedido;
import entidades.Seleccion;
import entidades.Usuario;
import logica.CaracteristicaController;
import logica.LoginController;
import logica.PedidoController;
import logica.UsuarioController;


public class Test {
	
	
	public static void main(String[] args) {
		
		UsuarioController uc = new UsuarioController();
		Usuario u = uc.getByID(27);
		System.out.println(u.getUsername());
		System.out.println("Capitalized: " + u.capitalizeAnything(u.getUsername()));
		System.out.println("Maybe better? : " + u.capitalizeAnything(u.getApellido()));
		System.out.println(u.capitalizeAnything(u.getNombre()));
	}

}
