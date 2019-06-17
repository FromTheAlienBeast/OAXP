package cn.oa.dao;

import java.util.List;

import cn.oa.base.IBaseDao;
import cn.oa.domain.Forum;
import cn.oa.domain.Topic;



public interface ITopicDao extends IBaseDao<Topic>{

	public List<Topic> findTopicByForum(Forum model);

}
