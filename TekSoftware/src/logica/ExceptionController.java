package logica;

import datos.DataException;
import entidades.MyException;
import entidades.MyResult;

public class ExceptionController {
	private DataException de;
	
	public ExceptionController() {
		this.de = new DataException();
	}
	
	public MyResult add(MyException myExc) {
		return de.add(myExc);
	}
}
