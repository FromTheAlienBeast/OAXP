package cn.oa.service;

import java.util.List;

import cn.oa.domain.Forum;
import cn.oa.domain.Topic;



public interface ITopicService {

	List<Topic> findTopicByForum(Forum model);

	public void save(Topic model);

	public Topic getById(Long id);

}
