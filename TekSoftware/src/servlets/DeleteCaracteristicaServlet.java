package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logica.CaracteristicaController;

/**
 * Servlet implementation class DeleteCaracteristicaServlet
 */
@WebServlet("/DeleteCaracteristicaServlet")
public class DeleteCaracteristicaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCaracteristicaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CaracteristicaController cc = new CaracteristicaController();
		int ID = Integer.parseInt(request.getParameter("id"));
		cc.deleteCaracteristica(ID);
		
		request.setAttribute("listaCaracteristicas", cc.getAllCaracteristicas());
		request.getRequestDispatcher("abmCaracteristicas.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
