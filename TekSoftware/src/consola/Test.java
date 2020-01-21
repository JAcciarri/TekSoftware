package consola;



import java.util.ArrayList;

import datos.FactoryConnection;
import entidades.Opcion;
import entidades.Pedido;
import entidades.Seleccion;
import logica.CaracteristicaController;
import logica.PedidoController;


public class Test {
	
	
	public static void main(String[] args) {
		
		
		PedidoController pc = new PedidoController();
		ArrayList<Seleccion> selecciones = pc.getSeleccionesByIDPedido(8);
		System.out.println(selecciones.size());
		for(Seleccion s : selecciones) {
			System.out.println(
					s.getCaracteristica().getTitulo() + " "
					+ s.getOpcion().getSubtitulo() + " " 
					+ s.getOpcion().getDescripcion());
		}
		
	} 

}
