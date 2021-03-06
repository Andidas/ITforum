package servlet;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import service.FollowService;
import service.JsonService;
import service.SessionService;
import service.TopicService;
import service.TopicViewService;
import utils.ConstantsData;
import entity.PageMode;
import entity.Session;
import entity.Topic;
import entity.User;
import entity.viewEntity.FollowView;
import entity.viewEntity.TopicView;

public class WelcomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TopicService topicService = new TopicService();
	private TopicViewService topicviewService = new TopicViewService();
	private SessionService sessionService = new SessionService();
	private JsonService jsonService = new JsonService();
	private FollowService followService = new FollowService();
    public WelcomeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");

		if(op==null||op.equals("")){
			main(request,response);
		}else if(op.equals("getSnameAndSid")){
			getSnameAndSid(request,response);
		}else if(op.equals("findTopicByPage")){
			findTopicByPage(request,response);
		}
	}

	private void main(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<String> profiles = sessionService.queryAllProfile();
		List<Topic> topics = topicService.queryHotsTopicList();
		User user = (User)session.getAttribute("NowLoginUser");
		if(user!=null){
			List<FollowView> follows= followService.queryFollowList(user.getUid()+"");
			request.setAttribute("userFollowSession", follows);
		}
		request.setAttribute("HotsTopics", topics);
		request.setAttribute("welcomeProfiles", profiles);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

	private void getSnameAndSid(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String profile = request.getParameter("profile");
		List<Session> sessions = sessionService.queryAllSessionByProfile(profile);
		if(sessions==null){
			out.print("false");
		}else{
			JSONArray ja = new JSONArray();
			for (Session session : sessions) {
				JSONObject jo = JSONObject.fromObject(session);
				ja.add(jo);
			}
			out.print(ja);
		}
			
	}
	private void findTopicByPage(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException  {
		String type = request.getParameter("type");
		PrintWriter out = response.getWriter();
		int pageno=ConstantsData.PAGENO; 
		PageMode<TopicView> pm = null;
		String pagenoStr = request.getParameter("pageno");
		
		if(pagenoStr!=null&&!"".equals(pagenoStr))
			pageno = Integer.parseInt(pagenoStr);
		
		if(type.equals("hot"))
			pm = topicviewService.splitPageByReplyCount(pageno, ConstantsData.PAGESIZE_10);			
		else
			pm = topicviewService.TopicSplitPage(pageno, ConstantsData.PAGESIZE_10);
		
		if(pm.getData().size()==0)
			out.print("false");
		else
			out.print(jsonService.toJSONArray(pm.getData()));
				
	}
}


