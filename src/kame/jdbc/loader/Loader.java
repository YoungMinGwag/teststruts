package kame.jdbc.loader;

import java.util.StringTokenizer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class Loader extends HttpServlet {

		public void init(ServletConfig config) throws ServletException{
			//������ �ʱ�ȭ�ɶ� ȣ��Ǵ� init �޼��� 
			try {
				String drivers=config.getInitParameter("jdbcdriver");
				//jdbcdriver �ʱ�ȭ �Ķ���� �� �о��
				StringTokenizer st= new StringTokenizer(drivers,",");
				//�ʱ�ȭ �Ķ������ ���� �ڸ��� �и�
				while(st.hasMoreTokens()) {
					//�޸��� �и��� �� ���ڿ��� jdbc ����̹� Ŭ������ �̸����� ����ؼ� jdbc ����̹��� �ε� 
					String jdbcDriver=st.nextToken();
					Class.forName(jdbcDriver);
				}
			}catch(Exception ex) {
				//���� �߻� 
				throw new ServletException(ex);
			}
		}
}
