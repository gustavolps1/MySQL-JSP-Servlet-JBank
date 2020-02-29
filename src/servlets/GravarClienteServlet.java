package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ClienteBean;
import dao.ClienteDao;

@WebServlet("/GravarClienteServlet")
public class GravarClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ClienteDao clienteDao = new ClienteDao();

	public GravarClienteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			ClienteBean clienteBean = new ClienteBean();
			clienteBean.setNome(request.getParameter("nome"));
			clienteBean.setEmail(request.getParameter("email"));
			clienteBean.setCpf(request.getParameter("cpf"));
			clienteBean.setSenha(request.getParameter("senha"));

			if (clienteDao.insert(clienteBean)) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("app.jsp");
				request.setAttribute("userInfo", clienteBean);
				dispatcher.forward(request, response);

			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("notfound-account.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
