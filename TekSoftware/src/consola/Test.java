package consola;

import java.util.ArrayList;
import java.util.Date;

import datos.DataPedido;
import entidades.Caracteristica;
import entidades.Seleccion;
import entidades.Usuario;
import logica.CaracteristicaController;
import logica.UsuarioController;

public class Test {
	
	
	public static void main(String[] args) {
		
		
		CaracteristicaController carCtrl = new CaracteristicaController();
		ArrayList<Caracteristica> cars = carCtrl.getAllCaracteristicas();
		
		for (Caracteristica c : cars) {
			System.out.println(c.getIdCaracteristica() + " " + c.getTitulo());
		}

		
	} 

}
