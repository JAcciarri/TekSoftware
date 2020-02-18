package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.MyException;
import entidades.Usuario;
import logica.ExceptionController;

/**
 * Servlet implementation class ExceptionHandler
 */
// clase para manejar las excepciones ocurridas

@WebServlet("/ExceptionHandler")
public class ExceptionHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ExceptionHandler() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ExceptionController controller = new ExceptionController();
		Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
		String servletName = (String) request.getAttribute("javax.servlet.error.servlet_name");
		Throwable err_exception = (Throwable) request.getAttribute("javax.servlet.error.exception");
		MyException ex = new MyException(statusCode, servletName, err_exception);
		// agregamos la excepcion al log_errores en la base de datos
		controller.add(ex);
		//seteamos el status_code para recuperarlo en la pagina de error
		request.setAttribute("status_code", statusCode);
		// seteamos la url que le corresponde a cada usuario
				if (request.getSession().getAttribute("usuario") != null ) {
					Usuario u = (Usuario)request.getSession().getAttribute("usuario");
					if (u.isAdmin()) {
						request.setAttribute("url", "indexAdmin.jsp");
					} else request.setAttribute("url", "index.jsp");
				} 
				// si no hay nadie loggeado ...
				else request.setAttribute("url", "index.jsp");
		request.getRequestDispatcher("error-handler/error.jsp").forward(request, response);
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
