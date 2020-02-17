package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.DataEstadistica;
import entidades.Opcion;
import entidades.Pedido;
import entidades.Usuario;
import logica.EstadisticaController;

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
		EstadisticaController ctrl = new EstadisticaController();
		String servicio = request.getParameter("servicio");
		switch(servicio) {
			case "pedidos":{
				ArrayList<Pedido> pedidos = ctrl.getPedidosParaPromedio();
				double[] numeros = ctrl.getPromedioAprobacion();
				double maxMonto = ctrl.getMaxMontoTotal();
				
				request.setAttribute("servicio", "pedidos");
				request.setAttribute("maxMonto", maxMonto);
				request.setAttribute("pedidos", pedidos);
				request.setAttribute("numeros", numeros);
				request.getRequestDispatcher("estadisticaServicio.jsp").forward(request, response);
				break;
			}
			case "clientes":{
				Usuario cliente = ctrl.getClienteMasPedidor();
				Usuario ultimoCliente = ctrl.getLastUser();
				HashMap<String, Integer> map = ctrl.getUsuariosDiferenciados();
				
				request.setAttribute("servicio", "clientes");
				request.setAttribute("clientePedidor", cliente);
				request.setAttribute("map", map);
				request.setAttribute("ultimoCliente", ultimoCliente);
				request.getRequestDispatcher("estadisticaServicio.jsp").forward(request, response);
				break;
			}
			case "caracteristicas":{
				ArrayList<Opcion> opciones = ctrl.getRankingOpciones();
				
				request.setAttribute("servicio", "caracteristicas");
				request.setAttribute("opciones", opciones);
				request.getRequestDispatcher("estadisticaServicio.jsp").forward(request, response);
				break;
			}
			
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
