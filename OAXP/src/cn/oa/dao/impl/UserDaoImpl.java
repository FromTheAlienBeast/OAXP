package cn.oa.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.oa.base.BaseDaoImpl;
import cn.oa.dao.IUserDao;
import cn.oa.domain.User;
import cn.oa.utils.MD5Utils;


@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements IUserDao{

	/**
	 * 根据登录名统计
	 */
	public int findByLoginName(String loginName) {
		String hql = "SELECT COUNT(id) FROM User u WHERE u.loginName = ?";
		Long count = (Long) this.getSession().createQuery(hql).setParameter(0, loginName).uniqueResult();
		return count.intValue();
	}

	/**
	 * 用户登录
	 */
	public User login(User model) {
		String hql = "FROM User u WHERE u.loginName = ? AND u.password = ?";
		Query query = this.getSession().createQuery(hql);
		query.setParameter(0, model.getLoginName());
		query.setParameter(1, MD5Utils.md5(model.getPassword()));
		List<User> list = query.list();
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

}
