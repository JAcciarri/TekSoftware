package consola;

import java.util.ArrayList;
import java.util.Date;
import java.util.function.Consumer;

import datos.FactoryConnection;
import entidades.*;
import logica.*;

public class Test {
	

    
	public static void main(String[] args) {
	
		EstadisticaController cc = new EstadisticaController();
		System.out.println(cc.getRankingOpciones().size());
		
		
	}

}
