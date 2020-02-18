package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import datos.DataUsuario;
import entidades.MyResult;
import entidades.Usuario;
import logica.UsuarioController;

/**
 * Servlet implementation class SigninServlet
 */
@WebServlet("/SigninServlet")
public class SigninServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SigninServlet() {
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
		String usuario = request.getParameter("usuario");
		String password = request.getParameter("password");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String telefono = request.getParameter("telefono");
		String email = request.getParameter("email");
		//Algunas validaciones
		
		
		
		//Metodo para encriptar la contraseña
		password = DigestUtils.sha1Hex(password);
		Usuario user = new Usuario(nombre, apellido, usuario, password, email, telefono);
		UsuarioController usControl = new UsuarioController();
		MyResult res = usControl.add(user);
		if (res.getResult().equals(MyResult.results.OK)){
			res.setErr_message("Cuenta registrada con exito");
		} else {
			res.setErr_message("No se pudo registrar la cuenta correctamente. Intente de nuevo");
		}
		request.setAttribute("result", res);
		request.getRequestDispatcher("login.jsp").forward(request, response);
		
	}

}
