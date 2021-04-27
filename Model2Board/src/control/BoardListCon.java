package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardBean;
import model.BoardDAO;

@WebServlet("/BoardListCon.do")
public class BoardListCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//화면에 보여질 게시글의 개수를 저장
		int pageSize = 10;
		//현재 보여지고 있는 페이지의 넘버값을 읽어드림
		String pageNum = request.getParameter("pageNum");
		//null처리
		if(pageNum == null) {
			pageNum = "1";
		}
		//전체 게시글의 갯수
		int count = 0;
		//jsp페이지 내에서 보여질 넘버링 숫자값을 저장하는 변수
		int number = 0;
		
		//현재보여지고잇는 페이지 문자를 숫자로 변환
		int currentPage = Integer.parseInt(pageNum);
		//전체게시글의 갯수를 가져와야 하기에 데이터베이스 객체 생서
		BoardDAO bdao = new BoardDAO();
		count = bdao.getAllCount();
		
		//현재 보여질 페이지 시작번호를 설정
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		//최신글 10개를 기준으로 게시글을 리턴받아주는 메소드 호출
		ArrayList<BoardBean> arr = bdao.getAllBoard(startRow, endRow);
		number = count - (currentPage - 1) * pageSize;
		
		request.setAttribute("arr", arr);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
	}

}
