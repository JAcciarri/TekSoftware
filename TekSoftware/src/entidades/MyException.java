package entidades;

public class MyException extends Exception {
	
	private static final long serialVersionUID = 1L;
	private Integer statusCode;
	private String servletName; 
	private Throwable err_exception;
	
	public MyException() {}
	public MyException(int status_code, String servlet_name, Throwable err_exception) {
		this.statusCode = status_code;
		this.servletName = servlet_name;
		this.err_exception = err_exception;
	}
	
	public Integer getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(Integer statusCode) {
		this.statusCode = statusCode;
	}
	public String getServletName() {
		return servletName;
	}
	public void setServletName(String servletName) {
		this.servletName = servletName;
	}
	public String getErr_exception() {
		return err_exception.toString();
	}
	public void setErr_exception(Throwable err_exception) {
		this.err_exception = err_exception;
	}
	
}
