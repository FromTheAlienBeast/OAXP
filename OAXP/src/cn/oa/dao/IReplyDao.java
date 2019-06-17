package cn.oa.dao;

import java.util.List;

import cn.oa.base.IBaseDao;
import cn.oa.domain.Reply;
import cn.oa.domain.Topic;




public interface IReplyDao extends IBaseDao<Reply>{

	public List<Reply> getReplyByTopic(Topic model);

}
