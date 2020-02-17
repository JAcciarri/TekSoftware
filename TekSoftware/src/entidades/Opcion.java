package entidades;

public class Opcion {
	private int idOpcion;
	private String subtitulo;
	private String textIcono;
	private String descripcion;
	private float valorActual;
	private Caracteristica caractPerteneciente;
	private int vecesElegida;
	
	public Opcion() {}
	public Opcion(int id, String subtitulo, String text, String desc) {
		this.idOpcion = id;
		this.descripcion = desc;
		this.textIcono = text;
		this.subtitulo = subtitulo;
	}
	
	public Opcion(int id, String subtitulo, String text, String desc, float valor) {
		this.idOpcion = id;
		this.descripcion = desc;
		this.textIcono = text;
		this.subtitulo = subtitulo;
		this.valorActual = valor;
	}
	
	public float getValorActual() {
		return valorActual;
	}
	
	//metodo que devuelve el valor en substring, quita el punto y el decimal
	public String getValorButString() {
		//ademas si el valor es cero devolvemos string vacio para asegurarnos que defina un precio
		String s = "";
		if (this.valorActual == 0) {
			return s;
		} else {
			s += this.valorActual;
		return s.substring(0, s.length()-2);
		}
	}
	public void setValorActual(float valorActual) {
		this.valorActual = valorActual;
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
	public Caracteristica getCaractPerteneciente() {
		return caractPerteneciente;
	}
	public void setCaractPerteneciente(Caracteristica caractPerteneciente) {
		this.caractPerteneciente = caractPerteneciente;
	}
	public int getVecesElegida() {
		return vecesElegida;
	}
	public void setVecesElegida(int vecesElegida) {
		this.vecesElegida = vecesElegida;
	}
}
