package cn.oa.dao;

import cn.oa.base.IBaseDao;
import cn.oa.domain.Forum;



public interface IForumManageDao extends IBaseDao<Forum>{

	public void  moveUp(Long id);

	public void moveDown(Long id);

}
