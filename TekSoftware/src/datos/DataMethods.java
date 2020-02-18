package datos;

import entidades.MyResult;

public class DataMethods {
     
	 private MyResult result;
	 public DataMethods() {
		 this.result = new MyResult();
	 }
	 
	 MyResult Add(int res) {
		 if(res == 1) {
			 result.setResult(MyResult.results.OK);
			 result.setErr_message("Recurso creado correctamente");
		 }
		 else {
			 result.setResult(MyResult.results.Err);
			 result.setErr_message("Ha ocurrido un error al añadir el recurso. Por favor reintentar");
		 }
		 return result;
	 }
	 
	 MyResult Update(int res) {
		 if(res == 1) {
			 result.setResult(MyResult.results.OK);
			 result.setErr_message("Recurso actualizado correctamente");
		 }
		 else {
			 result.setResult(MyResult.results.Err);
			 result.setErr_message("Ha ocurrido un error al actualizar el recurso. Por favor reintentar");
		 }
		 return result;
	 }
	 
	 MyResult Delete(int res) {
		 if(res == 1) {
			 result.setResult(MyResult.results.OK);
			 result.setErr_message("Recurso eliminado correctamente");
		 }
		 else {
			 result.setResult(MyResult.results.Err);
			 result.setErr_message("Ha ocurrido un error al eliminar el recurso. Por favor reintentar");
		 }
		 return result;
	 }
	 
}
