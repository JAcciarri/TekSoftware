package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Caracteristica;
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
