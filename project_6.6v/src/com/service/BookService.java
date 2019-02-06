package com.service;

import java.util.List;

import com.domain.Book;

public interface BookService {

    // ���
    public List<Book> list() ;
 
    // �Է�
    public int addBook(Book b) ;
    
    // ����
    public int updateBook(Book b) ;
 
    // ����
    public int delBook(String book_id);
}
