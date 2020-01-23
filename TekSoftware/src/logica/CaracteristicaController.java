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
	
	public int getMaxIDfromDB() {
		return dc.getMaxID();
	}
	
	public void updateCaracteristica(Caracteristica c) {
		dc.updateCaracteristica(c);
	}
	
	public void updateOpciones(Caracteristica c, ArrayList<Opcion> opciones) {
		dc.updateOpciones(c, opciones);
	}
	
	public void deleteCaracteristica(int ID) {
		dc.deleteCaracteristica(ID);
	}
	
	public int getCountCaracteristicas() {
		return dc.getCountCaracteristicas();
	}
}
