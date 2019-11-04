package consola;

import java.util.ArrayList;

import datos.DataPedido;
import entidades.Seleccion;
import entidades.Usuario;
import logica.UsuarioController;

public class Test {
	
	
	public static void main(String[] args) {
		DataPedido dp = new DataPedido();
		ArrayList<Seleccion> selects = new ArrayList<Seleccion>();
		selects.add(new Seleccion(1, 2));
		selects.add(new Seleccion(2, 2));
		selects.add(new Seleccion(3, 1));
		double monto = dp.getValoresActuales(selects);
		System.out.println(monto);
		
		UsuarioController uCtrl = new UsuarioController();
		ArrayList<Usuario> users = uCtrl.getUsersByPartialDesc("j");
		System.out.println(users.size());
		for (Usuario u : users) {
			System.out.println(u.getFullName());
		}
		
	} 

}
