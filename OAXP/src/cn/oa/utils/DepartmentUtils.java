package cn.oa.utils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import cn.oa.domain.Department;


/**
 * 将部门列表处理成树形结构的工具类
 * @author zhaoqx
 *
 */
public class DepartmentUtils {

	/**
	 * @param topList  顶级部门列表
	 * @param removeId 删除部门的id 因为 修改的时候 不需要将他自身显示出来  所以移除掉他自身的id并且将其子部门也移除
	 * @return
	 */
	public static List<Department> getTreeList(List<Department> topList,Long removeId) {
		List<Department> treeList = new ArrayList<Department>();
		
		walkTree(topList,treeList,"┣",removeId);
		
		return treeList;
	}
	
	/**
	 * 组织树形部门数据
	 */
	
	public static void walkTree(Collection<Department> topList,List<Department> treeList ,String prefix,Long removeId){
		for(Department d : topList){
				if(removeId != null && d.getId().equals(removeId)){
					continue;      //如果是移除的id 就继承  改节点不会加入
				}
				 //new对象的原因是toplist是持久对象，只要session不关闭，
				//toplist就一直存在，这样导致修改toplist 数据的时候，数据库中的数据也一起改变了，所以新建一个对象
				Department copy = new Department();
				copy.setId(d.getId());
				copy.setName(prefix + d.getName());
				
				//顶点
				treeList.add(copy);
				//子树
				Set<Department> children = d.getChildren();
				walkTree(children,treeList,"　" + prefix,removeId);  //使用全角空格 html才不会忽略
		}
		
		
		
	}
}
