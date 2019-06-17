package cn.oa.dao;

import java.util.List;

import cn.oa.base.IBaseDao;
import cn.oa.domain.Privilege;



public interface IPrivilegeDao extends IBaseDao<Privilege> {

	public List<Privilege> findTopList();

	public List<String> findAllUrl();

}
