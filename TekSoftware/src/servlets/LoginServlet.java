package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.DataUsuario;
import entidades.Usuario;
import logica.LoginController;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//CIERRE DE SESION
		request.getSession().invalidate();
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginController controlador = new LoginController();
		Usuario user = new Usuario();
		user.setUsername(request.getParameter("usuario"));
		user.setPassword(request.getParameter("password"));
		user = controlador.validar(user);
		// Cuando el controlador valida puede encontrar el usuario y devolverlo, 
		// de lo contrario devuelve NULL
		if (user == null) {
			String error = ("Usuario o contraseña incorrectos");
			request.setAttribute("error", error);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}  else {
			// Si lo encontro lo guardamos en la sesion y preguntamos si es Admin o Usuario comun
			request.getSession().setAttribute("usuario", user);
			
			if (user.isAdmin()) { 
				request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);
			}
				else { // entonces es usuario comun
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
		}
	}

}
