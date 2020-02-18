package logica;

import java.util.Date;

import datos.DataPedido;

import java.util.ArrayList;
import entidades.*;
import entidades.MyResult.results;

public class PedidoController {

	DataPedido dp;
	
	public PedidoController() {
		this.dp = new DataPedido();
	}
	
	public ArrayList<Pedido> getAllPedidos(){
		return dp.getAllPedidos();
	}
	public ArrayList<Pedido> getAllPendientes(){
		return dp.getAllPendientes();
	}
	
	public Pedido registrarPedido(ArrayList<Seleccion> selecciones, Usuario cliente) {
		Pedido p = new Pedido();
		
		p.setCliente(cliente);
		p.setEstado("Pendiente");
		p.setFechaPedido(new Date());
		p.setMontoTotal(this.calcularMontoTotal(selecciones));
		MyResult res = dp.add(p);
		if (res.getResult().equals(results.OK)) {
			res = dp.addOpciones(selecciones, p);
			if (res.getResult().equals(results.OK)) {
				// entonces esta todo OK y retornamos el pedido
				return p;
			} else return null;
		} else return null;
	}
	
	
	//separamos la logica de calcular el monto total porque el dia de mañana
	// puede variar la forma en que calculamos el mismo
	public double calcularMontoTotal(ArrayList<Seleccion> selects) {
		return dp.getValoresActuales(selects);
	}
	
	public ArrayList<Pedido> getPedidosByCliente(int IDCliente){
		return dp.getPedidosByCliente(IDCliente);
	}
	public ArrayList<Pedido> getPedidosByAdmin(Usuario admin){
		return dp.getPedidosByAdmin(admin);
	}
	
	public Pedido getPedidoPendienteByCliente(int IDCliente) {
		return dp.getPedidoPendienteByCliente(IDCliente);
	}
	
	public ArrayList<Pedido> getPedidosByPartialClient(String datosParciales){
		return dp.getPedidosByPartialClient(datosParciales);
	}
	
	public Pedido getPedidoByID(int IDPedido) {
		return dp.getPedidoByID(IDPedido);
	}
	
	public ArrayList<Seleccion> getSeleccionesByIDPedido(int IDPedido){
		return dp.getSeleccionesByIDPedido(IDPedido);
	}
	
	public int getCountPedidosPendientes() {
		return dp.getCountPedidosPendientes();
	}
	
	public MyResult deletePedido(int IDPedido) {
		MyResult res = dp.deletePedido(IDPedido);
		if (res.getResult().equals(results.Err)) {
			res.setErr_message("No se pudo eliminar el pedido. Por favor reintentar");
		} else res.setErr_message("Pedido eliminado correctamente");
		return res;
	}
	
	public MyResult rechazarPedido(Pedido pedido) {
		MyResult res = dp.rechazarPedido(pedido);
		if (res.getResult().equals(results.Err)) {
			res.setErr_message("No se pudo rechazar el pedido. Por favor reintentar");
		} else res.setErr_message("Pedido rechazado satisfactoriamente");
		return res;
	}
	
	public MyResult aprobarPedido(Pedido pedido) {
		MyResult res = dp.aprobarPedido(pedido);
		if (res.getResult().equals(results.Err)) {
		res.setErr_message("No se pudo aprobar el pedido. Por favor reintentar");
		} else res.setErr_message("Pedido aprobado satisfactoriamente");
		return res;
	}
}
