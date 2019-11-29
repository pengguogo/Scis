package com.jcohy.scis.repository;

import com.jcohy.scis.model.MgProductInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by jiac on 2018/4/2.
 * Description  :
 */
public interface ProductRepository extends JpaRepository<MgProductInfo,Integer> {


    List<MgProductInfo> findByProductName(String productName);

    @Query(value = "select * from mg_product_info p where p.sku = ?1 ", nativeQuery = true)
    MgProductInfo findBySku(String sku);

    @Query(value = "select * from mg_product_info p where p.product_name like %?1% or p.sku like %?1%  or p.oe like %?1%   or p.cpp like %?1%  or p.spxh like %?1% ", nativeQuery = true)
    List<MgProductInfo> findByKeywordLike(String keyword);

    @Query(value = "select * from mg_product_info p where p.product_name = ?1 or p.sku = ?1 or p.oe = ?1   or p.cpp = ?1  or p.spxh = ?1 ", nativeQuery = true)
    List<MgProductInfo> findByKeyword(String keyword);

}
