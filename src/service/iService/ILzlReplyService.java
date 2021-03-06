package service.iService;

import java.util.List;
import java.util.Map;

import entity.LzlReply;

public interface ILzlReplyService {
	
	/**
	 * 删除
	 * @param lid
	 * @return
	 */
	boolean deleteLzlReply(String lid);

	/**
	 * 查询所有
	 * @return
	 */
	List<LzlReply> queryAllLzlReply();

	/**
	 * 插入
	 * @param lzlReply
	 * @return
	 */
	LzlReply insertLzlReply(String rid,String uid,String content);
	
	/**
	 * 通过lrid查询该reply的所有楼中楼回复
	 * 多了一个uname
	 * @param lrid
	 * @return
	 */
	List<Map<String,Object>> queryLzlReplyByLrid(String lrid);

	/**
	 * 通过lid查询该reply的所有楼中楼回复
	 * @param lid
	 * @return
	 */
	List<Map<String, Object>> queryLzlReplyByLid(String lid);

	/**
	 * 删除一条记录
	 * @param lid
	 * @return
	 */
	boolean deleteCommentByLid(String lid);

}
