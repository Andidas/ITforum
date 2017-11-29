package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.Session;
import entity.viewEntity.SessionView;
/**
 * 版块的数据库处理操作的接口
 * @author lwy
 *
 */
public interface SessionDao {
	/**
	 * 查询所有的session分类profile
	 * @return
	 */
	@Select("select DISTINCT sprofile from session")
	List <String>queryAllProfile();
	/**
	 * 查找session的id
	 * @param sname
	 * @return
	 */
	@Select("select sid from session where sname=#{_parameter}")
	int querySessionID(String sname);
	/**
	 * 增加一个session
	 * @param session
	 * @return
	 */
	@Insert("insert into session values(null,#{sname},#{smasterid},#{sprofile},#{sstatement},#{stopiccount},#{sclickcount},#{spicture})")
	int insertSession(Session session);
	/**
	 * 查询session view
	 * @param sid
	 * @return
	 */
	@Select("select s.*,u.uname from `session` s,`user` u where s.smasterid = u.uid and sid = #{_parameter}")
	SessionView querySessionView(int sid);
	/**
	 * 帖子数加1
	 * @param sid
	 * @return 大于0成功
	 */
	@Update("UPDATE `session` set stopiccount = stopiccount+1 where sid= #{_parameter}")
	int addSessionStopiccount(int sid);
	/**
	 * 帖子数减1
	 * @param sname
	 * @return 大于0成功
	 */
	@Update("UPDATE `session` set stopiccount = stopiccount-1 where sname= #{_parameter}")
	int subSessionStopiccount(String sname);
	/**
	 * 查询帖子数
	 * @param sname
	 * @return 返回帖子的数目
	 */
	@Select("select stopiccount from `session` where sname=#{_parameter}")
	int querySessionStopicCount(String sname);
	
	/**
	 * 点击次数加1
	 * @param sname
	 * @return 大于0成功
	 */
	@Update("UPDATE `session` set sclickcount = sclickcount+1 where sid= #{_parameter}")
	int updateSessionClickCount(int sid);

	
	/**
	 * 查询单个版块
	 * @param sid 要查询的版块sid
	 * @return 查询到得一个版块Session(all)
	 */
	@Select("select * from session where sname like CONCAT(CONCAT('%', #{_parameter}), '%')")
	Session searchSessionBySid(int sid);
	/**
	 * 查询符合的相似版块组，条件sprofile 和sid
	 * 不包括传进来的session本身
	 * @return 版块组
	 */
	@Select("select sid,sname,sstatement from `session` where sprofile=#{sprofile} and sid <> #{sid} order by sclickcount DESC limit 0,5")
	List<Session> querySameSession(Session session);
	
	/**
	 * 查询属于同一类的session
	 * @param sprofile
	 * @return
	 */
	@Select("select sid,sname from `session` where sprofile =#{_parameter}")
	List<Session> queryAllSessionByProfile(String sprofile);
	/**
	 * 通过搜索栏查找session
	 * @param searchText
	 * @return
	 */
	@Select("select * from session where sname like CONCAT(CONCAT('%', #{_parameter}), '%')")
	List<Session> searchSession(String searchText);
	

	
	
}
