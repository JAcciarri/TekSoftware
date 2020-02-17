package logica;

import datos.DataException;
import entidades.MyException;

public class ExceptionController {
	private DataException de;
	
	public ExceptionController() {
		this.de = new DataException();
	}
	
	public void add(MyException myExc) {
		de.add(myExc);
	}
}
