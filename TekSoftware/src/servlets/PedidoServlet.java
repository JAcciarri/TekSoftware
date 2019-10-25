package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Seleccion;

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
		// TODO Auto-generated method stub
		int idOpcion = Integer.parseInt(request.getParameter("idOpcion"));
		int nPaso = (int)request.getSession().getAttribute("numeroPaso");
		@SuppressWarnings("unchecked")
		
		//agregamos la opcion que eligio, el numero de paso se corresponde con el numero de caracteristica
		// y el id opcion es la opcion elegida por el usuario entre las 3 posibles
		ArrayList<Seleccion> selecciones = (ArrayList<Seleccion>)request.getSession().getAttribute("selecciones");
		selecciones.add(new Seleccion(nPaso, idOpcion));
		request.getSession().setAttribute("selecciones", selecciones);
		
		//aumentamos el paso en 1
		request.getSession().setAttribute("numeroPaso", 1+ (int)request.getSession().getAttribute("numeroPaso"));
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
