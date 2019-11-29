package com.jcohy.scis.repository;

import com.jcohy.scis.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by jiac on 2018/4/2.
 * Description  :
 */
public interface CustomerRepository extends JpaRepository<Customer,Integer> {



    @Query(value = "select * from customer p where p.khm = ?1 ", nativeQuery = true)
    Customer findByKhm(String khm);

    @Query(value = "select * from customer p where p.khm like %?1%  ", nativeQuery = true)
    List<Customer> findByKeywordLike(String keyword);


}
