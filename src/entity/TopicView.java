package entity;

import java.util.List;

/**
 * @author lwy
 *	要显示在topic界面的东西
  * @param topic //当前topic的全部信息
	 * @param sessionName // topic对应的session名
	 * @param userName	//对应的user名
	 * @param lastReplyUserName //最后一个回复的用户名
	 * @param sameTopic  // 相同topic
	 * @param allReply //该帖子的所有回帖
 */
public class TopicView {
	public TopicView(Topic topic, String sessionName, String userName,
			String lastReplyUserName, List<Topic> sameTopic,
			List<Reply> allReply) {
		super();
		this.topic = topic;
		this.sessionName = sessionName;
		this.userName = userName;
		this.lastReplyUserName = lastReplyUserName;
		this.sameTopic = sameTopic;
		this.allReply = allReply;
	}
	public TopicView() {
		super();
		
	}
	private Topic topic;
	private String sessionName;
	private String userName;
	private String lastReplyUserName;
	private List<Topic> sameTopic;
	private List<Reply> allReply;
	public Topic getTopic() {
		return topic;
	}
	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	public String getSessionName() {
		return sessionName;
	}
	public void setSessionName(String sessionName) {
		this.sessionName = sessionName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLastReplyUserName() {
		return lastReplyUserName;
	}
	public void setLastReplyUserName(String lastReplyUserName) {
		this.lastReplyUserName = lastReplyUserName;
	}
	public List<Topic> getSameTopic() {
		return sameTopic;
	}
	public void setSameTopic(List<Topic> sameTopic) {
		this.sameTopic = sameTopic;
	}
	
	public List<Reply> getAllReply() {
		return allReply;
	}
	public void setAllReply(List<Reply> allReply) {
		this.allReply = allReply;
	}
	@Override
	public String toString() {
		return "TopicView [topic=" + topic + ", sessionName=" + sessionName
				+ ", userName=" + userName + ", lastReplyUserName="
				+ lastReplyUserName + ", sameTopic=" + sameTopic
				+ ", allReply=" + allReply + "]";
	}
}
