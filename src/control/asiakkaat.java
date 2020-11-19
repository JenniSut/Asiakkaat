package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.Asiakas;
import model.dao.Dao;


@WebServlet("/asiakkaat")
public class asiakkaat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public asiakkaat() {
        super();
        System.out.println("asiakkaat.asiakkaat()");
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("asiakkaat.doGet()");
		//Dao dao = new Dao();
		//ArrayList<Asiakas> asiakkaat = dao.listaaKaikki();
		//System.out.println(asiakkaat);
		//String strJSON = new JSONObject().put("asiakkaat", asiakkaat).toString();
		//response.setContentType("application/json");
		//PrintWriter out = response.getWriter();
		//out.println(strJSON);
		//request.getRequestDispatcher("listaaasiakkaat.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("asiakkaat.doPost()");
		Dao dao = new Dao();
		String hakusanastr = request.getParameter("hakusana");
		String hakusana = hakusanastr.substring(0, 1).toUpperCase() + hakusanastr.substring(1);
		
		System.out.println(hakusana);
		ArrayList<Asiakas> asiakkaat = dao.etsi(hakusana);
		System.out.println(asiakkaat);
		String strJSON = new JSONObject().put("asiakkaat", asiakkaat).toString();
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.println(strJSON);
		//request.getRequestDispatcher("listaaasiakkaat.jsp").forward(request, response);
	}

	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("asiakkaat.doPut()");
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("asiakkaat.doDelete()");
	}

}
