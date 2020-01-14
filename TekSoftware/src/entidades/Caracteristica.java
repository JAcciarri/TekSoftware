package entidades;

public class Caracteristica {
	private int idCaracteristica;
	private String titulo;
	
	public Caracteristica() {}
	public Caracteristica(String titulo) {
		this.titulo = titulo;
	}
	public Caracteristica(int id, String titulo) {
		this.idCaracteristica = id; 
		this.titulo = titulo;
	}
	public int getIdCaracteristica() {
		return idCaracteristica;
	}
	public void setIdCaracteristica(int idCaracteristica) {
		this.idCaracteristica = idCaracteristica;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

}
