package entidades;

public class Seleccion {
	
	private int nroCaracteristica;
	private int nroOpcion;
	private Caracteristica caracteristica;
	private Opcion opcion;
	
	public Seleccion(int nCaract, int nOpc) {
		this.nroCaracteristica = nCaract;
		this.nroOpcion = nOpc;
	}
	
	public Seleccion() {
	}

	public int getNroCaracteristica() {
		return nroCaracteristica;
	}
	public void setNroCaracteristica(int nroCaracteristica) {
		this.nroCaracteristica = nroCaracteristica;
	}
	public int getNroOpcion() {
		return nroOpcion;
	}
	public void setNroOpcion(int nroOpcion) {
		this.nroOpcion = nroOpcion;
	}

	public Caracteristica getCaracteristica() {
		return caracteristica;
	}

	public void setCaracteristica(Caracteristica caracteristica) {
		this.caracteristica = caracteristica;
	}

	public Opcion getOpcion() {
		return opcion;
	}

	public void setOpcion(Opcion opcion) {
		this.opcion = opcion;
	}
}
