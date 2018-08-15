package srv1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class hello
 */
public class book3Svlt extends HttpServlet {

    /**
     * @see HttpServlet#HttpServlet()
     */
    public book3Svlt() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String resp="";

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=utf-8");

		PrintWriter out;
		out=res.getWriter();
		String mode = req.getParameter("mode");

		book3Bean book3 = new book3Bean();

//		if(mode.equals("allemp")){
//			resp=book3.getAllEmp();
//		}else if(mode.equals("uniqueemp")){
//			String emp_no = req.getParameter("emp_no");
//			res = book3.getuniqEmp(emp_no);
//
//		}

		resp=book3.getAllEmp();

		out.println(res);

		out.close();
	}





	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
