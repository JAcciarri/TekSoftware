package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.DataUsuario;
import entidades.Usuario;
import logica.UsuarioController;

/**
 * Servlet implementation class AbmUsuariosServlet
 */
@WebServlet("/AbmUsuariosServlet")
public class AbmUsuariosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AbmUsuariosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsuarioController userControl = new UsuarioController();
		request.setAttribute("listaUsuarios", userControl.getAllUsers());
		request.getRequestDispatcher("abmUsuarios.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsuarioController uCtrl = new UsuarioController();
		String datosParciales = request.getParameter("datosParciales");
		ArrayList<Usuario> users = uCtrl.getUsersByPartialDesc(datosParciales);
		request.setAttribute("listaParcial", users);
		request.getRequestDispatcher("abmUsuarios.jsp").forward(request, response);
		
	}

}
