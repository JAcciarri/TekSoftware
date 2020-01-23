package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Pedido;
import logica.PedidoController;

/**
 * Servlet implementation class DeletePedidoServlet
 */
@WebServlet("/DeletePedidoServlet")
public class DeletePedidoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePedidoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PedidoController pc = new PedidoController();
		
		if (request.getParameter("id") != null) {
			int IDPedido = Integer.parseInt(request.getParameter("id"));
			pc.deletePedido(IDPedido);
			request.getRequestDispatcher("perfilUsuario.jsp").forward(request, response);
		}
		// sino es porque el admin lo rechazó
		else {
			int IDPedidoRechazado = Integer.parseInt(request.getParameter("idRechazado"));
			Pedido p = pc.getPedidoByID(IDPedidoRechazado);
			pc.rechazarPedido(p.getIdPedido());
			request.getRequestDispatcher("pedidosAdmin.jsp").forward(request, response);
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
