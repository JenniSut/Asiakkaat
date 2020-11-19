<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
th {
background-color: lightgreen;
border-style: solid;
padding: 5px;

}
td {
border-style: double;
padding: 5px;

}
form {
border-style: double;
width: 310px;
padding: 5px;
padding-left:40px;
padding-right:40px;

}

</style>
</head>
<body>
<form id="etsi">
	<label>Anna etunimi:</label>
	<input id= "hakusana" type="text" name="hakusana">
	<input id="etsiInput" type="submit" value="Etsi">
</form>

<table id="listaus">
	<thead>
		<tr>
			<th>Etunimi</th>
			<th>Sukunimi</th>
			<th>Puhelin</th>
			<th>Sähköposti</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>

<script>
$(document).ready(function() {
	$("#etsi").on('submit', function() {
		//alert("submit kutsutaan");
		event.preventDefault();
		$.ajax({url:"asiakkaat", 
				type:"POST", 
				dataType: "json",
				data: { hakusana : $('#hakusana').val()
				},
				success:function (result){
					$.each(result.asiakkaat, function(i, field){
						
						var htmlStr;
						htmlStr+="<tr>";
						//htmlStr+="<td>"+field.asiakas_id+"</td>";
						htmlStr+="<td>"+field.etunimi+"</td>";
						htmlStr+="<td>"+field.sukunimi+"</td>";
						htmlStr+="<td>"+field.puhelin+"</td>";
						htmlStr+="<td>"+field.sposti+"</td>";
						htmlStr+="</tr>";
				$("#listaus tbody").append(htmlStr);
			});	
		}});
	//}});
});
});
//});
</script>
</body>
</html>