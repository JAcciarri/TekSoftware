package logica;

import java.util.ArrayList;

import datos.DataCaracteristica;
import entidades.Caracteristica;
import entidades.MyResult;
import entidades.Opcion;

public class CaracteristicaController {

	DataCaracteristica dc;
	
	public CaracteristicaController() {
		this.dc = new DataCaracteristica();
	}
	
	public MyResult addCaracteristica(Caracteristica c, ArrayList<Opcion> opciones) {
		MyResult res = new MyResult();
		res = dc.add(c);
		if (res.getResult().equals(MyResult.results.OK)) {
		res = dc.addOpciones(opciones, c);
		}
		return res;
	}
	
	public MyResult deleteCaracteristica(int ID) {
		return dc.deleteCaracteristica(ID);
	}
	
	public MyResult updateCaracteristica(Caracteristica c) {
		return dc.updateCaracteristica(c);
	}
	
	public MyResult updateOpciones(Caracteristica c, ArrayList<Opcion> opciones) {
		return dc.updateOpciones(c, opciones);
	}
	
	public MyResult addValores(ArrayList<Opcion> opciones, Caracteristica c) {
		return dc.addValores(opciones, c);
	}
	
	public ArrayList<Caracteristica> getAllCaracteristicas() {
		return dc.getAllCaracteristicas();
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

	public int getCountCaracteristicas() {
		return dc.getCountCaracteristicas();
	}
	
}
