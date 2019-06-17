package cn.oa.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.oa.dao.IUserDao;
import cn.oa.domain.User;
import cn.oa.service.IUserService;


@Service
@Transactional
public class UserServiceImpl implements IUserService{

	@Resource
	private IUserDao userDao;

	public List<User> findAll() {
		
		return userDao.findAll();
	}

	public void delete(User model) {
		userDao.delete(model.getId());
	}

	public void save(User model) {
		userDao.save(model);
	}

	public User getById(Long id) {
		
		return userDao.getById(id);
	}

	public void update(User user) {
		userDao.update(user);
	}

	public int findByLoginName(String loginName) {
		
		return userDao.findByLoginName(loginName);
	}

	public User login(User model) {
		
		return userDao.login(model);
	}
}
