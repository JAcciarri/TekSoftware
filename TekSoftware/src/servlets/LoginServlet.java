package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Usuario;
import logica.Login;

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
		request.getSession().invalidate();
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Login controlador = new Login();
		Usuario u = new Usuario();
		u.setUsername(request.getParameter("usuario"));
		u.setPassword(request.getParameter("password"));
		
		u = controlador.validar(u);
		if (u!=null) {
			request.getSession().setAttribute("usuario", u);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else {
			String error = ("Usuario o contraseña incorrectos");
			request.setAttribute("error", error);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
