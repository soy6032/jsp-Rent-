package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Hello")// HelloWorld 라고 주소 uri에 표시해주어야 아 서블릿 클래스가 실행됨
public class HelloWorld extends HttpServlet {   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	//일괄처리 즉, doget이던 dopost던 reqPro메소드가 실행됨
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//화면에 helloworld라고 출력 jsp쪽으로 넘겨질 데이터를 설정
		String msg = "Hello World 안녕하세요";
		int data = 12;
		
		//jsp쪽으로 데이터를 request에 부착하여 넘겨줘야함
		request.setAttribute("msg", msg);
		request.setAttribute("data", data);
		
		//서블릿에서 jsp를 호출하면서 데이터를 같이 넘겨주는 객체를 선언
		RequestDispatcher rd = request.getRequestDispatcher("HelloWorld.jsp");//jsp파일명을 기술
		rd.forward(request, response);
	}



}
