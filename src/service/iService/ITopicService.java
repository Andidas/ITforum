package service.iService;

import java.util.List;

import entity.Topic;

/**
 * @author 刘伟艺
 * 帖子接口
 */
public interface ITopicService {
	/**
	 * 添加帖子
	 * @param sname session的名
	 * @param uname 用户的名
	 * @param ttopic 题目
	 * @param tcontents 内容
	 * @return 添加成功返回true
	 */
	public boolean addTopic(String sname,String uname,String ttopic,String tcontents);
	
	/**
	 * 对上传过来的新帖子内容重新排版，将显示在session的内容之中
	 * 把内容重新排版：
	 * <p>文字内容</p>
	 * <img/><img/><img/>(ps : 最多显示三张图片)
	 * 
	 * @param uname 作者
	 * @param ttopic 帖子题目
	 * @param tcontents 帖子内容
	 * @return 新的排版
	 */
	public String neatenSessionContent(String uname,String ttopic,String tcontents);
	public List<Topic> queryTopicListByTSID(int tsid);
}
