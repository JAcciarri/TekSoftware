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
import entidades.Usuario;
import logica.CaracteristicaController;
import logica.UsuarioController;

/**
 * Servlet implementation class EditCaracteristicaServlet
 */
@WebServlet("/EditCaracteristicaServlet")
public class EditCaracteristicaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCaracteristicaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		CaracteristicaController carCtrl = new CaracteristicaController();
		int ID = Integer.parseInt(request.getParameter("id"));
		Caracteristica c = carCtrl.getByID(ID);
		request.setAttribute("caracteristicaAEditar", c);
		request.getRequestDispatcher("editarCaracteristica.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CaracteristicaController cc = new CaracteristicaController();
		
		int id = Integer.parseInt(request.getParameter("id"));
		String titulo = request.getParameter("titulo");
		Caracteristica car = new Caracteristica(id, titulo);
		
		String subtitulo1 = request.getParameter("subtitulo-1");
		String texticono1 = request.getParameter("icono-1");
		String descripcion1 = request.getParameter("descripcion-1");	
		String subtitulo2 = request.getParameter("subtitulo-2");
		String texticono2 = request.getParameter("icono-2");
		String descripcion2 = request.getParameter("descripcion-2");	
		String subtitulo3 = request.getParameter("subtitulo-3");
		String texticono3 = request.getParameter("icono-3");
		String descripcion3 = request.getParameter("descripcion-3");
		float precio1 = Float.parseFloat(request.getParameter("precio-1"));
		float precio2 = Float.parseFloat(request.getParameter("precio-2"));
		float precio3 = Float.parseFloat(request.getParameter("precio-3"));
		
		ArrayList<Opcion> opciones = new ArrayList<Opcion>();
		opciones.add(new Opcion(1, subtitulo1, texticono1, descripcion1, precio1));
		opciones.add(new Opcion(2, subtitulo2, texticono2, descripcion2, precio2));
		opciones.add(new Opcion(3, subtitulo3, texticono3, descripcion3, precio3));
		
		try {
			cc.updateCaracteristica(car);
			cc.updateOpciones(car, opciones);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ArrayList<Caracteristica> caracteristicas = cc.getAllCaracteristicas();
		request.setAttribute("listaCaracteristicas", caracteristicas);
		request.getRequestDispatcher("abmCaracteristicas.jsp").forward(request, response);
		
	}

}
