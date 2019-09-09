package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.DataUsuario;
import entidades.Usuario;

/**
 * Servlet implementation class AbmUserServlet
 */
@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ID = Integer.parseInt(request.getParameter("id"));
		response.getWriter().print(ID);
		DataUsuario du = new DataUsuario();
		Usuario u = du.getByID(ID);
		request.setAttribute("usuario", u);
		request.getRequestDispatcher("perfilUsuario.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataUsuario dtu = new DataUsuario();
		Usuario u = new Usuario();
		u.setIdUsuario(Integer.parseInt(request.getParameter("id")));
		u.setNombre(request.getParameter("nombre"));
		u.setApellido(request.getParameter("apellido"));
		u.setEmail(request.getParameter("email"));
		u.setTelefono(request.getParameter("telefono"));
		u.setUsername(request.getParameter("username"));
		dtu.update(u);
		request.setAttribute("listaUsuarios", dtu.getAllUsers());
		request.getRequestDispatcher("tablaUsuarios.jsp").forward(request, response);
	}

}
