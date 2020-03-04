package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Caracteristica;
import entidades.MyResult;
import entidades.Pedido;
import entidades.Seleccion;
import entidades.Usuario;
import entidades.MyResult.results;
import logica.CaracteristicaController;
import logica.PedidoController;

/**
 * Servlet implementation class PedidoServlet
 */
@WebServlet("/PedidoServlet")
public class PedidoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PedidoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("idPedido") != null) {
			PedidoController pController = new PedidoController();
			Pedido p = pController.getPedidoByID(Integer.parseInt(request.getParameter("idPedido")));
			Usuario actualUser = (Usuario)request.getSession().getAttribute("usuario");
				
			// reutilizamos tanto para admin como para usuario comun
				if (actualUser.isAdmin()) {
					// si es admin lo redirigimos para que edite el pedido
					request.setAttribute("pedido", p);
					request.getRequestDispatcher("editarPedido.jsp").forward(request, response);
				}  
				// si no es admin entonces es un usuario comun que quiere ver su pedido
				else {
					request.setAttribute("pedido", p);
					request.getRequestDispatcher("pedidoUsuario.jsp").forward(request, response);
				}
		}
		
		
		else {
		ArrayList<Caracteristica> cars = (ArrayList<Caracteristica>)request.getSession().getAttribute("caracteristicas");	
		
		// recuperamos el numero de paso, este se corresponde con el indice del arraylist que apunta a la caracteristica
		// que estamos tratando de recuperar, pero restando uno ya que comienza desde 0. Luego podremos saber la caracteristica
		// y asi agregar esta Seleccion (caract + opcion) al atributo selecciones guardado en la sesion
		int nPaso = (int)request.getSession().getAttribute("numeroPaso");
		int idCaracteristica = cars.get(nPaso - 1).getIdCaracteristica();
		
		// y el id opcion es la opcion elegida por el usuario entre las 3 posibles
		int idOpcion = Integer.parseInt(request.getParameter("idOpcion"));
		
		ArrayList<Seleccion> selecciones = (ArrayList<Seleccion>)request.getSession().getAttribute("selecciones");
		selecciones.add(new Seleccion(idCaracteristica, idOpcion));
		// actualizamos las selecciones elegidas (y que se guardan en la sesion)
		request.getSession().setAttribute("selecciones", selecciones);
		//aumentamos el paso en 1
		request.getSession().setAttribute("numeroPaso", nPaso + 1);
		
		CaracteristicaController carCtrl = new CaracteristicaController();
		int count = carCtrl.getCountCaracteristicas();
		if (nPaso == count) {  
			// significa que llegamos al final, a la cantidad total de caracteristicas de nuestra base de datos
			PedidoController pCtrl = new PedidoController();
			Usuario usu = (Usuario)request.getSession().getAttribute("usuario");
			Pedido p = new Pedido();
			p = pCtrl.registrarPedido(selecciones, usu);
			if (p == null) {
				MyResult res = new MyResult();
				res.setErr_message("No se ha podido crear el pedido. Por favor reintentar");
				res.setResult(results.Err);
				request.setAttribute("result", res);
			} else { 
				// estuvo todo OK , seteamos el pedido
				request.setAttribute("pedido", p); 
			  }
			
			request.setAttribute("pedidoJustCreated", true);
		} 
		
		request.getRequestDispatcher("pedido.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PedidoController pController = new PedidoController();
		
		if (request.getParameter("see")!=null && request.getParameter("see").equals("pendientes")) {
			request.setAttribute("pedidosPendientes", pController.getAllPendientes());
			request.getRequestDispatcher("pedidosAdmin.jsp").forward(request, response);
		}
		
		//sino quiso buscar un cliente en el buscador
		String datosParciales = request.getParameter("datosParciales");
		ArrayList<Pedido> pedidosDelCliente = pController.getPedidosByPartialClient(datosParciales);
		request.setAttribute("pedidosDelCliente", pedidosDelCliente);
		request.getRequestDispatcher("pedidosAdmin.jsp").forward(request, response);
	}

}
