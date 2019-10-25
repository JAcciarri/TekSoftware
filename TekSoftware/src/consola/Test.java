package consola;

import java.util.Date;
import java.util.ArrayList;

import datos.DataCaracteristica;
import entidades.Caracteristica;
import entidades.Opcion;

public class Test {

	public static void main(String[] args) {
		DataCaracteristica dc = new DataCaracteristica();
		Caracteristica c = dc.getByID(1);
		ArrayList<Opcion> opciones = dc.getOpcionesByIdCaracteristica(1);
		
		for (Opcion opc: opciones) {
			System.out.println(opc.getIdOpcion() + " " + opc.getDescripcion() );
		}
		
		Date fecha = new Date();
		System.out.println(fecha.toString());
	}

}
