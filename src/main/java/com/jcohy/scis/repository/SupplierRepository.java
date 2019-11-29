package com.jcohy.scis.repository;

import com.jcohy.scis.model.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by jiac on 2018/4/2.
 * Description  :
 */
public interface SupplierRepository extends JpaRepository<Supplier,Integer> {



    @Query(value = "select * from supplier p where p.gsm = ?1 ", nativeQuery = true)
    Supplier findByGsm(String gsm);

    @Query(value = "select * from supplier p where p.gsm like %?1% or p.zycp like %?1%  ", nativeQuery = true)
    List<Supplier> findByKeywordLike(String keyword);


}
