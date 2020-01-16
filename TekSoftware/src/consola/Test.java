package consola;



import java.util.ArrayList;

import datos.FactoryConnection;
import entidades.Opcion;
import entidades.Pedido;
import logica.CaracteristicaController;
import logica.PedidoController;


public class Test {
	
	
	public static void main(String[] args) {
		
		
		PedidoController pc = new PedidoController();
		ArrayList<Pedido> pedidos = pc.getPedidosAprobadosByCliente(10);
		for (Pedido p : pedidos) {
		System.out.println(p.getEstado() + " " + p.getMontoTotal());
		}
		
	} 

}
