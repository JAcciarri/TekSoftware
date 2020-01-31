package servlets;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.DataEstadistica;

/**
 * Servlet implementation class EstadisticasServlet
 */
@WebServlet("/EstadisticasServlet")
public class EstadisticasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EstadisticasServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// se podria hacer un case y segun el servicio mostrar las estadisticas solicitadas
		
		response.getWriter().println("Queries para el servicio: " + request.getParameter("servicio") + "\n");
		
		if (request.getParameter("servicio").equals("clientes")) {
			DataEstadistica de = new DataEstadistica();
			HashMap<String, Integer> hashmap = de.getUsuariosDiferenciados();
			response.getWriter().println("==============================================");
			response.getWriter().println("Total de usuarios: " + hashmap.get("total"));
			response.getWriter().println("---Cantidad de clientes: " +hashmap.get("users"));
			response.getWriter().println("---Cantidad de administradores: " +hashmap.get("admins"));
			response.getWriter().println("==============================================");
		}
		if (request.getParameter("servicio").equals("pedidos")) {
			DataEstadistica de = new DataEstadistica();
			response.getWriter().println("===========================================");
			response.getWriter().println("El pedido más caro fue de: $" + de.getMaxMontoTotal());
			response.getWriter().println("===========================================");
			response.getWriter().println("Al dia de hoy, hay " + de.getCountPedidosAprobados() + " pedidos Aprobados");
			response.getWriter().println("Al dia de hoy, hay " + de.getCountPedidosPendientes() + " pedidos Pendientes");
			response.getWriter().println("===========================================");
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
