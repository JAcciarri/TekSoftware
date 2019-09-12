package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.DataUsuario;
import entidades.Usuario;
import logica.UsuarioController;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
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
		Boolean admin;
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String email = request.getParameter("email");
		String telefono = request.getParameter("telefono");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		String[] values = request.getParameterValues("checkAdmin");
		if (values!=null) admin = true; else admin = false;
		
		Usuario u = new Usuario(nombre, apellido, username, password, email, telefono, admin);
		UsuarioController userControl = new UsuarioController();
		userControl.add(u);
		request.setAttribute("listaUsuarios", userControl.getAllUsers());
		request.getRequestDispatcher("abmUsuarios.jsp").forward(request, response); 
	}

}
