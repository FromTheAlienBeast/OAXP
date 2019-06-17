package cn.oa.service;

import java.util.List;

import cn.oa.domain.ApproveInfo;

public interface IApproveInfoService {

	public List<ApproveInfo> findApproveInfoListByApplicationId(Long applicationId);

}
