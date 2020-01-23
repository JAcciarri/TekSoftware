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
		System.out.println(pc.getSeleccionesByIDPedido(31).size());
		
	} 

}
