package cn.oa.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.oa.base.BaseAction;
import cn.oa.domain.Book;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;



@Controller
@Scope("prototype")
public class BookAction extends BaseAction<Book>{
	public String execute() throws Exception {
		System.out.println(model);
		
		bookService.save(model);
		return NONE;
	}
}
