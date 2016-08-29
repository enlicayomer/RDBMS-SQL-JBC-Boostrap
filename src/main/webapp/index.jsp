<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>Müşteri Bilgileri</h2>
		<p>Burada müşteri bilgileri tabloya listeleniyor...</p>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>Müşteri No</th>
						<th>Adı</th>
						<th>Soyadı</th>
						<th>Tecrübe</th>

					</tr>
				</thead>
				<tbody>

					<%@ page import="java.util.*"%>
					<%@ page import="java.sql.*"%>

					<%
    Connection baglanti=null;
    Statement bildirim=null;
    ResultSet sonuc=null;
    
    String driver="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/firmaveritabani";
    String kulaniciAdi="root";
    String parola="1234";
    
    try{
    	
    	Class.forName(driver);
    	baglanti=DriverManager.getConnection(url, kulaniciAdi, parola);

    	
    }catch(ClassNotFoundException ex){
    	ex.printStackTrace();
    	
    }
    
    String sqlSorgusu="SELECT * FROM firmaveritabani.personel";
    
    try{
    	
    	bildirim = baglanti.createStatement();
    	sonuc=bildirim.executeQuery(sqlSorgusu);
    	
    	while(sonuc.next())
    	{
    		%>

					<tr>
						<td> <%= sonuc.getInt("id") %></td>
						<td><%= sonuc.getString("adi") %></td>
						<td><%= sonuc.getString("soyadi") %></td>
						<td><%= sonuc.getInt("tecrube") %></td>

					</tr>

					<%
						}

						} catch (Exception ex) {
							ex.printStackTrace();

						}finally{
							if(sonuc!=null) sonuc.close();
							if(bildirim!=null) bildirim.close();
							if(baglanti!=null) baglanti.close();
						}
					%>

				</tbody>
			</table>
		</div>
	</div>

</body>
</html>
