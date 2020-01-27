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
 * Servlet implementation class EditPedidoServlet
 */
@WebServlet("/EditPedidoServlet")
public class EditPedidoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPedidoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Clase pensada para aprobar el pedido, por ahora
		PedidoController pCtrl = new PedidoController();
		int IDPedido = Integer.parseInt(request.getParameter("idPedido"));
		Pedido p = pCtrl.getPedidoByID(IDPedido);
		pCtrl.aprobarPedido(p);
		request.getRequestDispatcher("pedidosAdmin.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
