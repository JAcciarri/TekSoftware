package consola;

import java.util.ArrayList;
import java.util.Date;
import java.util.function.Consumer;

import datos.FactoryConnection;
import entidades.*;
import logica.*;

public class Test {
	

    
	public static void main(String[] args) {
	
		ChatController cc = new ChatController();
		Usuario admin = new Usuario();
		admin.setIdUsuario(27);
		ArrayList<Mensaje> mensajes = cc.getAllMensajesByAdmin(admin);
		System.out.println(mensajes.get(0).getFecha_hora());
		System.out.println(mensajes.get(0).getFecha_hora().toString().substring(0, 4));
		System.out.println(mensajes.get(0).getFechaHoraString());
		
	}

}
