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
		Pedido p = pc.getPedidoPendienteByCliente(11);
		if (p!=null) System.out.println(p.getEstado() + " " + p.getMontoTotal());
		else System.out.println("0 pedidos pendientes");
		
	} 

}
