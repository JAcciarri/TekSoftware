package consola;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.concurrent.TimeUnit;

import com.mysql.cj.util.TimeUtil;

import datos.FactoryConnection;
import entidades.Caracteristica;
import entidades.Mensaje;
import entidades.Pedido;
import entidades.Usuario;
import logica.ChatController;
import logica.EstadisticaController;
import logica.PedidoController;

public class Test {
	

    
	public static void main(String[] args) throws SQLException {
	
		ChatController chat = new ChatController();
		Usuario admin = new Usuario();
		admin.setIdUsuario(27);
		System.out.println("Tiene mensajes no leidos: " + chat.hasMensajesNoLeidosByAdmin(admin));
		
		
	}

}
