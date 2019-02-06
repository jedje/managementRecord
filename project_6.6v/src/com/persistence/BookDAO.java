package com.persistence;

import java.util.*;
 
import com.domain.*;
 
public interface BookDAO {
 
    // ���
    public List<Book> list() ;
 
    // �Է�
    public int addBook(Book b) ;
    
    // ����
    public int updateBook(Book b) ;
 
    // ����
    public int delBook(String book_id);
    
}