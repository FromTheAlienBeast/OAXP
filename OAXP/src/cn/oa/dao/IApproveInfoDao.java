package cn.oa.dao;

import java.util.List;

import cn.oa.base.IBaseDao;
import cn.oa.domain.ApproveInfo;

public interface IApproveInfoDao extends IBaseDao<ApproveInfo>{

	public List<ApproveInfo> findApproveInfoListByApplicationId(Long applicationId);

}
