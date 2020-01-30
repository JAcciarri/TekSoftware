package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Caracteristica;
import entidades.Opcion;
import logica.CaracteristicaController;

/**
 * Servlet implementation class EditPrecioServlet
 */
@WebServlet("/EditPrecioServlet")
public class EditPrecioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPrecioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//aca estamos agregando SOLO los precios de una caracteristica (de sus opciones)
		CaracteristicaController cc = new CaracteristicaController();
		int idCaract = Integer.parseInt(request.getParameter("idCaracteristica"));
		Caracteristica cara = cc.getByID(idCaract);
		ArrayList<Opcion> opciones = cc.getOpcionesByIdCaracteristica(idCaract);
		opciones.get(0).setValorActual(Integer.parseInt(request.getParameter("precio1")));
		opciones.get(1).setValorActual(Integer.parseInt(request.getParameter("precio2")));
		opciones.get(2).setValorActual(Integer.parseInt(request.getParameter("precio3")));
		cc.addValores(opciones, cara);
		
		
		request.setAttribute("listaCaracteristicas", cc.getAllCaracteristicas());
		request.getRequestDispatcher("abmCaracteristicas.jsp").forward(request, response);
		
	}

}
