package cn.oa.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.oa.dao.IApproveInfoDao;
import cn.oa.domain.ApproveInfo;
import cn.oa.service.IApproveInfoService;

/**
 * 审批操作
 * @author zhaoqx
 *
 */
@Service
@Transactional
public class ApproveInfoServiceImpl implements IApproveInfoService{
	@Resource
	private IApproveInfoDao approveInfoDao;

	/**根据申请id查询对应的审批集合
	 * 
	 */
	public List<ApproveInfo> findApproveInfoListByApplicationId(
			Long applicationId) {
		return approveInfoDao.findApproveInfoListByApplicationId(applicationId);
	}
}
