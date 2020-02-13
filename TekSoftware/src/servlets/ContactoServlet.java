package servlets;


import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Mensaje;
import entidades.Pedido;
import entidades.Usuario;
import logica.ChatController;
import logica.PedidoController;
import logica.UsuarioController;

/**
 * Servlet implementation class ContactoServlet
 */
@WebServlet("/ContactoServlet")
public class ContactoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // Este servlet funciona tanto para dejar un mensaje o contactar un admin 
		// como para recuperar los mensajes ya existentes de un pedido (chat)
		
		if (request.getParameter("idPedido")!=null) {
			// entonces el usuario quiere dejar un mensaje 
			
			ChatController chat = new ChatController();
			PedidoController pCtrl = new PedidoController();
			Pedido p = new Pedido();
			p.setIdPedido(Integer.parseInt(request.getParameter("idPedido")));
			p = pCtrl.getPedidoByID(p.getIdPedido());
			ArrayList<Mensaje> mensajes = new ArrayList<Mensaje>();
			mensajes = chat.getAllMensajesByPedido(p);
					if (mensajes.isEmpty()) { // es porque no se encontro ningun mensaje
						// enviamos solo un mensaje para poder recuperar los IDS de pedido, admin y cliente
						Mensaje msj = new Mensaje();
						msj.setPedido(p);
						request.setAttribute("msj", msj);
						
						// y sino enviamos todos los mensajes encontrados
					} else request.setAttribute("mensajes", mensajes);
			request.getRequestDispatcher("contactosimple.jsp").forward(request, response);
		
		} else {
		// sino el admin es quien quiere ver los mensajes que le dejaron
		
		if (request.getParameter("chat") != null) {
			ChatController chat = new ChatController();
			PedidoController pCtrl = new PedidoController();
			Pedido p = new Pedido();
			p.setIdPedido(Integer.parseInt(request.getParameter("chat")));
			p = pCtrl.getPedidoByID(p.getIdPedido());
			ArrayList<Mensaje> mensajes = chat.getAllMensajesByPedido(p);
			request.setAttribute("mensajes", mensajes);
			request.getRequestDispatcher("misMensajes.jsp").forward(request, response);
		}	
			else {
			Usuario admin = (Usuario)request.getSession().getAttribute("usuario");
			ChatController chat = new ChatController();
			LinkedList<Pedido> ids = chat.getIDsPedidosByAdmin(admin);
			
			request.setAttribute("ids", ids);
			request.getRequestDispatcher("misMensajes.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Sirve tanto para dejar un mensaje del lado del usuario como del admin
		
		//Esta parte es igual para ambos
		ChatController chatCtrl = new ChatController();
		PedidoController pCtrl = new PedidoController();
		int idPedido = Integer.parseInt(request.getParameter("idPedido"));
		int idAdmin = Integer.parseInt(request.getParameter("idAdmin"));
		int idCliente = Integer.parseInt(request.getParameter("idCliente"));
		
		//Luego
		if (request.getParameter("mensajeAdmin") != null ) {
			
			 // Entonces estamos recuperando un mensaje del admin
			String msj = request.getParameter("mensajeAdmin");
			Mensaje mensaje = new Mensaje(idCliente, idAdmin, idPedido, msj, false);
			chatCtrl.addMensaje(mensaje);
			LinkedList<Pedido> ids = chatCtrl.getIDsPedidosByAdmin((Usuario)request.getSession().getAttribute("usuario"));
			request.setAttribute("ids", ids);
			request.setAttribute("exito", ("Mensaje enviado con exito"));
			request.getRequestDispatcher("misMensajes.jsp").forward(request, response);
		}
		else {
			
			// Y sino el usuario quiere dejar un mensaje suyo
			String msj = request.getParameter("mensajeUserComun");
			Mensaje m = new Mensaje(idCliente, idAdmin, idPedido, msj, true);
			chatCtrl.addMensaje(m);
			Pedido p = pCtrl.getPedidoByID(idPedido);
			request.setAttribute("pedido", p);
			request.setAttribute("exito", ("Mensaje enviado con exito"));
			request.getRequestDispatcher("pedidoUsuario.jsp").forward(request, response);
		}
	}

}
