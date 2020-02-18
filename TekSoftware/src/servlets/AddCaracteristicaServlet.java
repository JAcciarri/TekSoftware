package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Caracteristica;
import entidades.MyResult;
import entidades.Opcion;
import logica.CaracteristicaController;

/**
 * Servlet implementation class AddCaracteristicaServlet
 */
@WebServlet("/AddCaracteristicaServlet")
public class AddCaracteristicaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCaracteristicaServlet() {
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
		
		CaracteristicaController cc = new CaracteristicaController();
		
		String titulo = request.getParameter("titulo");
		String subtitulo1 = request.getParameter("subtitulo-1");
		String texticono1 = request.getParameter("icono-1");
		String descripcion1 = request.getParameter("descripcion-1");	
		String subtitulo2 = request.getParameter("subtitulo-2");
		String texticono2 = request.getParameter("icono-2");
		String descripcion2 = request.getParameter("descripcion-2");	
		String subtitulo3 = request.getParameter("subtitulo-3");
		String texticono3 = request.getParameter("icono-3");
		String descripcion3 = request.getParameter("descripcion-3");	
		ArrayList<Opcion> opciones = new ArrayList<Opcion>();
		opciones.add(new Opcion(1, subtitulo1, texticono1, descripcion1));
		opciones.add(new Opcion(2, subtitulo2, texticono2, descripcion2));
		opciones.add(new Opcion(3, subtitulo3, texticono3, descripcion3));
	
		//LA AGREGAMOS A LA BD
		MyResult res = cc.addCaracteristica(new Caracteristica(titulo) , opciones);
		if (res.getResult().equals(MyResult.results.Err)) {
			request.setAttribute("result", res);
			request.setAttribute("listaCaracteristicas", cc.getAllCaracteristicas());
			request.getRequestDispatcher("abmCaracteristicas.jsp").forward(request, response);
		}
		// UNA VEZ INSERTADA EN LA BD CORRECTAMENTE LA RECUPERAMOS Y REDIRIGIMOS A LA PAGINA EDITAR
		// PARA ASI PONERLE EL PRECIO, EL ID ES AUTOINCREMENTAL.
		int IDGenerated = cc.getMaxIDfromDB();
		Caracteristica car = cc.getByID(IDGenerated);
		request.setAttribute("caracteristicaAEditar", car);
		request.getRequestDispatcher("precioCaracteristica.jsp").forward(request, response);
		
		}

}