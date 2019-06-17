package cn.oa.service;

import java.io.InputStream;

import cn.oa.domain.Application;
import cn.oa.domain.PageBean;
import cn.oa.utils.HQLHelper;

public interface IApplicationservice {

	public PageBean getPageBean(HQLHelper hh, int currentPage);

	public InputStream getInputStreamById(Long applicationId);

	public Application getById(Long applicationId);

}
