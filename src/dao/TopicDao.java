package dao;

import java.util.List;

import entity.PageMode;
import entity.PageParam;
import entity.Topic;
import entity.viewEntity.TopicView;
/**
 * 
 * @author lwy
 *
 */
public interface TopicDao {
	
	/**
	 * 查询用户发表过的所有topic
	 * @param page
	 * @return
	 */
	PageMode<Topic> queryUserAllTopic(PageParam page);
	
	/**
	 * 查找回帖数最多，最热门的topic
	 * @return
	 */
	List<Topic> queryHotsTopicList();
	/**
	 * 模糊查询题目和内容
	 * @param text
	 * @return
	 */
	List<Topic> searchTopicAndContents(String text);
	/**
	 * 查询单个topic view
	 * @param tid
	 * @return
	 */
	TopicView getTopicViewOne(int tid);
	/**
	 * 分页视图
	 * @param page
	 * @return
	 */
	PageMode<TopicView> splitPage(PageParam page);
	/**
	 * 一共有多少条记录
	 * @param session id
	 * @return
	 */
	int rowCount(int sid);
	/**
	 * 点击次数加一
	 * @param tid
	 * @return
	 */
	int updateClickCount(int tid);
	/**
	 * 新增帖子
	 * @param 
	 * @return 
	 */
	int addTopic(Topic topic);
	
	/**
	 * 查询相同的topic，在同一个session中
	 * @return 
	 */
	List<Topic> querySameTopicListByTSID(int tsid);
	/**
	 * 查询单个Topic
	 * @param 
	 * @return
	 */
	Topic queryTopicOneByTopic(int tid);
	
	/**
	 * 回帖数加一
	 * @param tid
	 * @return
	 */
	int updateReplyCountAdd(Topic topic);

	/**
	 * 用户发表的帖子数
	 * @param id
	 * @return
	 */
	int rowUserTopicNum(int id);
}
