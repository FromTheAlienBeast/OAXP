package cn.oa.dao.impl;

import org.springframework.stereotype.Repository;

import cn.oa.base.BaseDaoImpl;
import cn.oa.dao.IBookDao;
import cn.oa.domain.Book;

/**
 * BookDao，继承BaseDaoImpl
 * @author zhaoqx
 *
 */
@Repository
public class BookDaoImpl extends BaseDaoImpl<Book> implements IBookDao {

}
