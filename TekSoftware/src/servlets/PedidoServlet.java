package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Pedido;
import entidades.Seleccion;
import entidades.Usuario;
import logica.PedidoController;

/**
 * Servlet implementation class PedidoServlet
 */
@WebServlet("/PedidoServlet")
public class PedidoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PedidoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nPaso = (int)request.getSession().getAttribute("numeroPaso");
		int idOpcion = Integer.parseInt(request.getParameter("idOpcion"));
		@SuppressWarnings("unchecked")
		//agregamos la opcion que eligio, el numero de paso se corresponde con el numero de caracteristica
		// y el id opcion es la opcion elegida por el usuario entre las 3 posibles
		ArrayList<Seleccion> selecciones = (ArrayList<Seleccion>)request.getSession().getAttribute("selecciones");
		selecciones.add(new Seleccion(nPaso, idOpcion));
		request.getSession().setAttribute("selecciones", selecciones);
		//aumentamos el paso en 1
		request.getSession().setAttribute("numeroPaso", 1+ (int)request.getSession().getAttribute("numeroPaso"));
		
		if (nPaso + 1 == 4) {  
			PedidoController pCtrl = new PedidoController();
			Usuario usu = (Usuario)request.getSession().getAttribute("usuario");
			Pedido p = new Pedido();
			p = pCtrl.registrarPedido(selecciones, usu);
			request.setAttribute("pedido", p);
			
		} 
		
		request.getRequestDispatcher("pedido.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
