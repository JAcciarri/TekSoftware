package consola;



import datos.FactoryConnection;
import entidades.Opcion;
import logica.CaracteristicaController;


public class Test {
	
	
	public static void main(String[] args) {
		
		
		CaracteristicaController carCtrl = new CaracteristicaController();
		System.out.println(carCtrl.getMaxIDfromDB());

		java.util.Date now = new java.util.Date();
	    System.out.println(new java.sql.Timestamp(now.getTime()));
		
	} 

}
