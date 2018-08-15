package srv1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class hello
 */
public class hello2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public hello2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {


        //パラメータ取得
        String param1 = req.getParameter("param1");
        String param2 = req.getParameter("param2");

        //処理（DB呼び出し等）
        String response1 = "";
        String response2 = "";

        //出力(レスポンスをmapに格納してJSON化)

        //JSONマップ
        Map<String, String> mapMsg = new HashMap<String, String>();

        //追加
        mapMsg.put("response1", response1);
        mapMsg.put("response2", response2);

        //マッパ(JSON <-> Map, List)
        //ObjectMapper mapper = new ObjectMapper();

        //json文字列
        String jsonStr = mapper.writeValueAsString(mapMsg);  //list, map

        //ヘッダ設定
        res.setContentType("application/json;charset=UTF-8");   //JSON形式, UTF-8

        //pwオブジェクト
        PrintWriter pw = res.getWriter();

        //出力
        pw.print(jsonStr);

        //クローズ
        pw.close();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
