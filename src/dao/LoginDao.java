package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.ClienteBean;
import beans.LoginBean;
import connection.SingleConnection;

public class LoginDao {

	private Connection connection;

	public LoginDao() {
		connection = SingleConnection.getConnection();
	}

	public boolean select(LoginBean loginBean) {
		try {
			String query = "SELECT CPF, Senha from Clientes WHERE CPF = '" + loginBean.getCpf() + "' AND Senha = '"
					+ loginBean.getSenha() + "'";
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public ClienteBean userInfo(LoginBean loginBean) {
		try {
			String query = "SELECT * FROM Clientes WHERE CPF = '" + loginBean.getCpf() + "'";
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();

			if (resultSet.next()) {
				ClienteBean clienteBean = new ClienteBean();
				clienteBean.setCpf(resultSet.getString("CPF"));
				clienteBean.setEmail(resultSet.getString("Email"));
				clienteBean.setNome(resultSet.getString("Nome"));
				return clienteBean;
			}

		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();

			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return null;

	}

}
