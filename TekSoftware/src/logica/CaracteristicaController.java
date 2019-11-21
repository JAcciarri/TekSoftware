package logica;

import java.util.ArrayList;

import datos.DataCaracteristica;
import entidades.Caracteristica;
import entidades.Opcion;

public class CaracteristicaController {

	DataCaracteristica dc;
	
	public CaracteristicaController() {
		this.dc = new DataCaracteristica();
	}
	
	public ArrayList<Caracteristica> getAllCaracteristicas() {
		return dc.getAllCaracteristicas();
	}
	
	public void addCaracteristica(Caracteristica c, ArrayList<Opcion> opciones) {
		dc.add(c);
		dc.addOpciones(opciones, c);
	}
	
	public Caracteristica getByID(int ID) {
		return dc.getByID(ID);
	}
	
	public ArrayList<Opcion> getOpcionesByIdCaracteristica(int ID){
		return dc.getOpcionesByIdCaracteristica(ID);
	}
}
