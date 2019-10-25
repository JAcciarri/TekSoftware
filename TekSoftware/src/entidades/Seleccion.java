package entidades;

public class Seleccion {
	
	private int nroCaracteristica;
	private int nroOpcion;
	
	public Seleccion(int nCaract, int nOpc) {
		this.nroCaracteristica = nCaract;
		this.nroOpcion = nOpc;
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
}
