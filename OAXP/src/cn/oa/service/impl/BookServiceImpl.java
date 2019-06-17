package cn.oa.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.oa.dao.IBookDao;
import cn.oa.domain.Book;
import cn.oa.service.IBookService;


@Service
@Transactional
public class BookServiceImpl implements IBookService {
	
	@Resource
	private IBookDao bookDao;

	
	public void delete(Long id) {
		// TODO Auto-generated method stub
		bookDao.delete(id);
	}

	
	public List<Book> findAll() {
		// TODO Auto-generated method stub
		return bookDao.findAll();
	}

	
	public Book getById(Long id) {
		// TODO Auto-generated method stub
		return bookDao.getById(id);
	}

	
	public List<Book> getByIds(Long[] ids) {
		// TODO Auto-generated method stub
		return bookDao.getByIds(ids);
	}

	
	public void save(Book book) {
		// TODO Auto-generated method stub
		bookDao.save(book);
	}

	
	public void update(Book book) {
		// TODO Auto-generated method stub
		bookDao.update(book);
	}


}
