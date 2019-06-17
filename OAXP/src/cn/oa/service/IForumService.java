package cn.oa.service;

import java.util.List;

import cn.oa.domain.Forum;



public interface IForumService {

	public List<Forum> findAll();

	public Forum getById(Long id);

}
