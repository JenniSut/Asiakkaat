<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="scripts/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<style>
th {
background-color: lightgreen;
border-style: solid;
padding: 5px;

}

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
<form id="tiedot">
	<table>
		<thead>	
			<tr>
				<th colspan="5"><span id="takaisin">Takaisin listaukseen</span></th>
			</tr>		
			<tr>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>Sähköposti</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="etunimi" id="etunimi"></td>
				<td><input type="text" name="sukunimi" id="sukunimi"></td>
				<td><input type="text" name="puhelin" id="puhelin"></td>
				<td><input type="text" name="sposti" id="sposti"></td> 
				<td><input type="submit" id="tallenna" value="Lisää"></td>
			</tr>
		</tbody>
	</table>
</form>
</body>
<script>
$(document).ready(function(){
	
	$("#takaisin").click(function(){
			document.location="listaaasiakkaat.jsp";
		});
	$("#tiedot").validate({						
		rules: {
			etunimi:  {
				required: true,
				minlength: 2				
			},	
			sukunimi:  {
				required: true,
				minlength: 2				
			},
			puhelin:  {
				required: true,
				minlength: 7
			},	
			sposti:  {
				required: true,
				minlength: 4,
				
				
			}	
		},
		messages: {
			etunimi: {     
				required: "Puuttuu",
				minlength: "Liian lyhyt"			
			},
			sukunimi: {
				required: "Puuttuu",
				minlength: "Liian lyhyt"
			},
			puhelin: {
				required: "Puuttuu",
			minlength: "Liian lyhyt"
			},
			sposti: {
				required: "Puuttuu",
			
			}
		},			
		submitHandler: function(form) {	
			lisaaTiedot();
		}		
	}); 	
//});
		
	function lisaaTiedot(){	
		alert("lisaatiedot");
		var formJsonStr = formDataJsonStr($("#tiedot").serializeArray()); 
		$.ajax({	url:"asiakkaat", 
					data:formJsonStr, 
					type:"POST", 
					dataType:"json", 
					success:function(result) { 
				if(result.response==0){
	      			alert("Asiakkaan lisääminen epäonnistui.");
	     		}else if(result.response==1){		
	      			alert("Asiakkan lisääminen onnistui.");
	      			$("#etunimi", "#sukunimi", "#puhelin", "#sposti").val("");
	  	}}
	})};	
});
</script>

</html>