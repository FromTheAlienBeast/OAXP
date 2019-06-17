package cn.oa.service;

import java.util.List;

import cn.oa.domain.Application;
import cn.oa.domain.ApproveInfo;
import cn.oa.domain.TaskView;
import cn.oa.domain.User;

public interface IFlowService {

	public void submit(Application app);

	public List<TaskView> findTaskList(User currentUser);

	public void approve(ApproveInfo ai, String taskId);

}
