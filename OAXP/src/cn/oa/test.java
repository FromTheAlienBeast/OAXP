package cn.oa;

import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.junit.Test;

import cn.oa.domain.Department;
import cn.oa.service.impl.DepartmentServiceImpl;

public class test {

	@Test
	public void test(){
		DepartmentServiceImpl depService=new DepartmentServiceImpl();
		//查询所有
		List<Department> list = depService.findAll();
		for(Department dep:list){
			System.out.println(dep.getName());
			Set<Department> children = dep.getChildren();
			showTree(children);
		}
	}
	public void showTree(Collection<Department> list){
		for(Department dep:list){
			System.out.println(dep.getName());
			Set<Department> children = dep.getChildren();
			showTree(children);
		}
	}
}
