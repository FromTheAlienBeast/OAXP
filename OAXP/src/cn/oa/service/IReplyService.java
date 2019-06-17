package cn.oa.service;

import java.util.List;

import cn.oa.domain.PageBean;
import cn.oa.domain.Reply;
import cn.oa.domain.Topic;
import cn.oa.utils.HQLHelper;



public interface IReplyService {

	public void save(Reply model);

	public List<Reply> getReplyByTopic(Topic model);

	public PageBean getPageBean(HQLHelper hh, int currentPage);

}
