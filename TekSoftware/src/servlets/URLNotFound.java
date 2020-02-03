package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Usuario;


@WebServlet("/URLNotFound")
public class URLNotFound extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public URLNotFound() {
        super();
       
    }
    		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getSession().getAttribute("usuario") != null ) {
			Usuario u = (Usuario)request.getSession().getAttribute("usuario");
			if (u.isAdmin()) {
				request.setAttribute("url", "indexAdmin.jsp");
			} else request.setAttribute("url", "index.jsp");
		} 
		// si no hay nadie loggeado ...
		else request.setAttribute("url", "index.jsp");
		request.getRequestDispatcher("404-page/error404.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
