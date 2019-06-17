package cn.oa.dao;

import cn.oa.base.IBaseDao;
import cn.oa.domain.User;

public interface IUserDao extends IBaseDao<User> {

	int findByLoginName(String loginName);

	User login(User model);

}
