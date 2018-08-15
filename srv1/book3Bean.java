package srv1;

import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

/**
 * Servlet implementation class boo3Bean
 */
public class book3Bean {

	public String getAllEmp(){

		StringBuffer respBuf = new StringBuffer("");
		String resp ;
		String CATALINA_HOME= "c:\\1_data";
		String filePath="\\emp.xml";


		try{

			DocumentBuilderFactory dbdactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = dbdactory.newDocumentBuilder();
			//Document doc = builder.parse(new File(CATALINA_HOME + filePath));
			Document doc = builder.parse(new File("c:\\1_data\\emp.xml"));

			Element root = doc.getDocumentElement();
			NodeList emps= root.getElementsByTagName("employee");

			for(int i=0; i<emps.getLength();i++){

				Element elm =(Element)emps.item(i);
				String emp_no = elm.getAttribute("id");

				NodeList emp_name_list = elm.getElementsByTagName("emp_name");
				Element emp_name_tag = (Element)emp_name_list.item(0);
				String emp_name = emp_name_tag.getFirstChild().getNodeValue();

				NodeList emp_dept_list = elm.getElementsByTagName("emp_dept");
				Element emp_dept_tag = (Element)emp_dept_list.item(0);
				String emp_dept = emp_dept_tag.getFirstChild().getNodeValue();

				respBuf.append(emp_no + "<i>" + emp_name + "<i>" + emp_dept + "<r>");

			}



		}catch(Exception e){

			e.printStackTrace();

		};

		respBuf.setLength(respBuf.length()-3);
		resp = respBuf.toString();
		return resp;


	}

}
