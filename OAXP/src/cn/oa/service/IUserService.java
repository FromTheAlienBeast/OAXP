package cn.oa.service;

import java.util.List;

import cn.oa.domain.User;

public interface IUserService {

	List<User> findAll();

	void delete(User model);

	void save(User model);

	User getById(Long id);

	void update(User user);

	int findByLoginName(String loginName);

	User login(User model);

}
