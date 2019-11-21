package entidades;

public class Opcion {
	private int idOpcion;
	private String subtitulo;
	private String textIcono;
	private String descripcion;
	
	public Opcion() {}
	public Opcion(int id, String subtitulo, String text, String desc) {
		this.idOpcion = id;
		this.descripcion = desc;
		this.textIcono = text;
		this.subtitulo = subtitulo;
	}
	
	public int getIdOpcion() {
		return idOpcion;
	}
	public void setIdOpcion(int idOpcion) {
		this.idOpcion = idOpcion;
	}
	public String getSubtitulo() {
		return subtitulo;
	}
	public void setSubtitulo(String subtitulo) {
		this.subtitulo = subtitulo;
	}
	public String getTextIcono() {
		return textIcono;
	}
	public void setTextIcono(String textIcono) {
		this.textIcono = textIcono;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
}
