package com.hdt.auction.interceptor;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	//�����غ�׺ ͨ�������ļ�����
	private List<String> excludeMappingUrl;
	
	
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("afterCompletion:����֮��ִ��");
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView modelAndView)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("afterCompletion:����֮ǰ��ִ��");
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("postHandle:����֮ǰ��ִ�С�");
		String url = request.getRequestURI();//��ȡ�����URL
//      System.out.println(url);
        String postFix = null;       //ǰ׺
        // �鿴�Ƿ��Ǿ�̬�ļ�������Ǿ�̬�ļ�������
        if(!StringUtils.isEmpty(url)){
            int index = url.lastIndexOf(".");//��ȡ.���������ֵ�λ�õ��±�
            if(index > -1){//˵��������λ�ÿ����ԡ�.����ͷ
                postFix = url.substring(index);//�õ���URL�ĺ�׺
                if(!StringUtils.isEmpty(postFix)&&excludeMappingUrl.contains(postFix)){
                    //��̬�ļ���Ĭ�ϴ���
                    return true;
                }
            }else if(!url.contains("/vaild")&&!url.contains("/toLogin")){
                //�ж�session�Ƿ����
                HttpSession session = request.getSession();
                if(session.getAttribute("USER_INFO")==null){
                    //˵��session�в������û��ĵ�¼��Ϣ
                    //��������д����ת���Ĳ���.�����ڵ������ת������¼ҳ����ȥ
//                  String basePath = request.getContextPath();//������·�����⣬�൱��վ��ĸ�·����
//                  PrintWriter out = response.getWriter();//ͨ��PrintWrite��������ʽ���html�����ظ��ͻ��ˣ�������ҳ����
//                  out.println("<html>");
//                  out.println("<script>");
//                  out.println("window.open('"+basePath+"/toLogin')");  
//                  out.println("</script>");  
//                  out.println("</html>");
//                  out.flush(); 
                     request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response); 
                    return false;
                }
                return true;//������������URL�ǿ�ʼ�ͽ����ҳ�����
            }
        }
        return true;

        //���ǵ�¼���󣬲��Ǿ�̬�ļ����ж�session�Ƿ����
        //����������׼���¼��������ת����¼����
	}
	 public List<String> getExcludeMappingUrl() {
	        return excludeMappingUrl;
	    }

	    public void setExcludeMappingUrl(List<String> excludeMappingUrl) {
	        this.excludeMappingUrl = excludeMappingUrl;
	    }


}
