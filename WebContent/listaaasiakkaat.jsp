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

poista {
color: tomato;
text-decoration: underline;
}

</style>
</head>
<body>

<form id="etsi">
	<label>Anna hakusana:</label>
	<input id= "hakusana" type="text" name="hakusana" size="15">
	<input id="etsiInput" type="submit" value="Etsi">
</form>

<table id='listaus'>
	<thead>
		<tr>
			<th>Asiakas Id</th>
			<th>Etunimi</th>
			<th>Sukunimi</th>
			<th>Puhelin</th>
			<th>Sähköposti</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<table>
	<thead>
		<tr>
			<th><span id ='uusiAsiakas'>Lisää uusi asiakas</span></th>
		</tr>
	</thead>
</table>
<script>
$(document).ready(function() {
	
	$.ajax({url:"asiakkaat", 
		type:"GET", 
		dataType: "json",
		data: { hakusana : $('#hakusana').val()
		},
		success:function (result){
			$.each(result.asiakkaat, function(i, field){
				
				var htmlStr;
				htmlStr+="<tr>";
				htmlStr+="<td>"+field.asiakas_id+"</td>";
				htmlStr+="<td>"+field.etunimi+"</td>";
				htmlStr+="<td>"+field.sukunimi+"</td>";
				htmlStr+="<td>"+field.puhelin+"</td>";
				htmlStr+="<td>"+field.sposti+"</td>";
				htmlStr+="<td><span class='poista' onclick=poista('"+field.asiakas_id+"')>Poista</span></td>";
				htmlStr+="</tr>";
		$("#listaus tbody").append(htmlStr);
	});	
}});
				
	$("#uusiAsiakas").click(function(){
		document.location="lisaaasiakas.jsp";
	});
	
	$("#hakusana").focus();
	$("#etsi").on('submit', function() {
		//alert("submit kutsutaan");
		event.preventDefault();
		$("#listaus tbody").empty();
		$.ajax({url:"asiakkaat", 
				type:"GET", 
				dataType: "json",
				data: { hakusana : $('#hakusana').val()
				},
				success:function (result){
					$.each(result.asiakkaat, function(i, field){
						
						var htmlStr;
						htmlStr+="<tr>";
						htmlStr+="<td>"+field.asiakas_id+"</td>";
						htmlStr+="<td>"+field.etunimi+"</td>";
						htmlStr+="<td>"+field.sukunimi+"</td>";
						htmlStr+="<td>"+field.puhelin+"</td>";
						htmlStr+="<td>"+field.sposti+"</td>";
						htmlStr+="<td><span class='poista' onclick=poista('"+field.asiakas_id+"')>Poista</span></td>";
						htmlStr+="</tr>";
				$("#listaus tbody").append(htmlStr);
			});	
		}});
	//}});
});
});
//});

function poista(asiakasid){
	asiakas_id = asiakasid.toString();
	if(confirm("Poista asiakas " + asiakasid +"?")){
		$.ajax({url:"/asiakkaat/"+asiakas_id, 
			type:"DELETE", 
			dataType:"json",
			success:function(result) { 
	        if(result.response==0){
	        	alert("Asiakkaan poisto epäonnistui.");
	        }else if(result.response==1){
	        	
	        	alert("Asiakkaan " + asiakas_id +" poisto onnistui.");
				//haeAutot();        	
			}
	    }});
	}
}
</script>
</body>
</html>