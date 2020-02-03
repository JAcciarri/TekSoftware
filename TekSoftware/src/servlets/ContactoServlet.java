package servlets;

import java.io.IOException;
import java.util.ArrayList;

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
		// como para recuperar los mensajes ya existentes de un pedido por parte de un administrador
		PedidoController pCtrl = new PedidoController();
		ChatController chatCtrl = new ChatController();
		if (request.getParameter("chat") != null) {
			int ID = Integer.parseInt(request.getParameter("chat"));
			Pedido p = pCtrl.getPedidoByID(ID);
			ArrayList<Mensaje> mensajes = chatCtrl.getAllMensajesByPedido(p);
			request.setAttribute("mensajes", mensajes);
			request.getRequestDispatcher("mensajesAdmin.jsp").forward(request, response);
		} 
		else { // y sino es porque el usuario quiere dejar un mensaje
		int idPedido = Integer.parseInt(request.getParameter("idPedido"));
		Pedido p = pCtrl.getPedidoByID(idPedido);
		response.getWriter().println("Queres dejar un mensaje para el pedido " + p.getIdPedido());
		response.getWriter().println("El admin es " + p.getAdmin().getFullName() + " y vos sos " + p.getCliente().getFullName());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
