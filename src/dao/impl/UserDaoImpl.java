package dao.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import org.apache.ibatis.session.SqlSession;

import utils.DBUtils;
import dao.UserDao;
import db.DBAccess;
import entity.User;

/**
 * @author lwy
 *	用户的数据库处理操作的实现
 */
public class UserDaoImpl implements UserDao {

	 private SqlSession sqlSession = null;
	 private DBAccess dbAccess  = new DBAccess();
	@Override
	public int addUser(User user) {
		int result = 0;
		try {
			sqlSession = dbAccess.getSqlSession();
			result = sqlSession.insert("User.addUser",user);
			sqlSession.commit();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(sqlSession!=null){sqlSession.close();}
			}
		return result;
	}

	@Override
	public int modifyUser(User user) {
		int result = 0;
		try {
			sqlSession = dbAccess.getSqlSession();
			result = sqlSession.update("User.updateUser",user);
			sqlSession.commit();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		
		return result;
	}

	@Override
	public User queryUser(String uemail) {	
		 User user = null;
		 try {
			sqlSession = dbAccess.getSqlSession();
			user = sqlSession.selectOne("User.queryUser",uemail);
		 } catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(sqlSession!=null){
				sqlSession.close();
				}
			}
		 return user;
	}


	@Override
	public List<User> queryUserList() {
		List<User> userList = new ArrayList<User>();
		try {
			sqlSession =dbAccess.getSqlSession();
			userList = sqlSession.selectList("User.queryUserList");
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(sqlSession!=null){sqlSession.close();}
			}
		
		return userList;
	}

	@Override
	public boolean checkUser(String email, String password) {
		User result = null;
		try {
			sqlSession =dbAccess.getSqlSession();
			User user = new User();
			user.setUemail(email);
			user.setUpassword(password);
			result = sqlSession.selectOne("User.checkUser",user);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		if(result==null){
			return false;
		}else
		return true;
	}

	@Override
	public int modifyPasswordByEmail(String email, String password) {
		int result = 0;
		try {
			sqlSession =dbAccess.getSqlSession();
			User user = new User();
			user.setUemail(email);
			user.setUpassword(password);
			result = sqlSession.update("User.updateUserPasswordByEmail",user);
			sqlSession.commit();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int queryUserIDByName(String uname) {
		int result = 0;
		try {
			sqlSession = dbAccess.getSqlSession();
			result = sqlSession.selectOne("User.queryUserIDByName", uname);
		} catch (IOException e) {
			return result;
		}finally{
			sqlSession.close();
		}
		return result;
	}

	public String queryUserNameById(int uid) {
		String result = null;
		try {
			sqlSession = dbAccess.getSqlSession();
			result = sqlSession.selectOne("User.queryUserNameById", uid);
		} catch (IOException e) {
			return result;
		}finally{
			sqlSession.close();
		}
		return result;
	}
	

}
