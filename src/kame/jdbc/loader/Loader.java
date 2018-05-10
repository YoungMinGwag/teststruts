package kame.jdbc.loader;

import java.util.StringTokenizer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class Loader extends HttpServlet {

		public void init(ServletConfig config) throws ServletException{
			//서블릿이 초기화될때 호출되는 init 메서드 
			try {
				String drivers=config.getInitParameter("jdbcdriver");
				//jdbcdriver 초기화 파라미터 값 읽어옴
				StringTokenizer st= new StringTokenizer(drivers,",");
				//초기화 파라미터의 값을 코마로 분리
				while(st.hasMoreTokens()) {
					//콤마로 분리된 각 문자열을 jdbc 드라이버 클래스의 이름으로 사용해서 jdbc 드라이버를 로딩 
					String jdbcDriver=st.nextToken();
					Class.forName(jdbcDriver);
				}
			}catch(Exception ex) {
				//예외 발생 
				throw new ServletException(ex);
			}
		}
}
