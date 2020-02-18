package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.MyResult;
import entidades.Pedido;
import entidades.Usuario;
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
		// Si la llamda es por GET es porque el usuario quiere cancelar su pedido. Lo eliminamos
		PedidoController pc = new PedidoController();
			int IDPedido = Integer.parseInt(request.getParameter("id"));
			MyResult res = pc.deletePedido(IDPedido);
			request.setAttribute("result", res);
			request.getRequestDispatcher("perfilUsuario.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Si es por POST es porque el admin quiere rechazar el pedido
		PedidoController pc = new PedidoController();
		int IDPedidoRechazado = Integer.parseInt(request.getParameter("idRechazado"));
		Usuario administrador = (Usuario)request.getSession().getAttribute("usuario");
		String motivoRechazo = request.getParameter("motivoRechazo");
		
		Pedido ped = pc.getPedidoByID(IDPedidoRechazado);
		ped.setAdmin(administrador);
		ped.setMotivoRechazo(motivoRechazo);
		MyResult res = pc.rechazarPedido(ped);
		request.setAttribute("result", res);
		request.getRequestDispatcher("pedidosAdmin.jsp").forward(request, response);
	}

}
