package cn.oa.dao;

import java.util.List;

import cn.oa.base.IBaseDao;
import cn.oa.domain.Department;


public interface IDepartmentDao extends IBaseDao<Department>{

	public List<Department> findTopList();

	public List<Department> findChildren(Long parentId);

}
