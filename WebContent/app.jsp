<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBank</title>
</head>
<body>
	<h1>
		JBank App ! <a href="/JBank/login.jsp">Sair<a />
	</h1>

	<table border="1">
		<th>CPF</th>
		<th>Nome</th>
		<th>Email</th>
		<tr>
			<td>${user.cpf}</td>
			<td>${user.nome}</td>
			<td>${user.email}</td>
		</tr>
	</table>
</body>
</html>