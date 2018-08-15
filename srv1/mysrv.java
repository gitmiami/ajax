package srv1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class mysrv
 */
public class mysrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public mysrv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("Shift_JIS");
        response.setContentType("text/html;charset=Shift_JIS");

        String str = request.getParameter("text1");
        str = this.getSanitizedString(str);
        str = "[JSP-to-SERVLET:\"" + str + "\"]";

        request.setAttribute("msg", str);

        // リダイレクト
        ServletContext context = this.getServletContext();

        RequestDispatcher dispatcher = context.getRequestDispatcher("/page.jsp");

        dispatcher.forward(request, response);


	}



    // サニタイズ処理
    public String getSanitizedString(String s){
        String str = s;
        str = str.replace("<","&lt;");
        str = str.replace(">","&gt;");
        str = str.replace("\"","&quot;");
        str = str.replace(" ","&ensp;");
        return str;
    }


}
