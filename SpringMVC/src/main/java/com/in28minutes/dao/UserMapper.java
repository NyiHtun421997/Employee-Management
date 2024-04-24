package com.in28minutes.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.in28minutes.bean.User;
import com.in28minutes.util.MyBatisUtil;

@Repository
public class UserMapper {

	public List<User> getAllUsers() {
		SqlSession session = MyBatisUtil.getSessionFactory().openSession();
		List<User> allUsers = session.selectList("getAllUsers");
		session.commit();
		session.close();
		return allUsers;
	}
}
