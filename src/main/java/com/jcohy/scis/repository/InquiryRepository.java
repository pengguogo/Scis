package com.jcohy.scis.repository;

import com.jcohy.scis.model.Inquiry;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by jiac on 2018/4/2.
 * Description  :
 */
public interface InquiryRepository extends JpaRepository<Inquiry,Integer> {



    @Query(value = "select p.* from inquiry p LEFT JOIN customer c on p.customer = c.id where c.khm =  = ?1 ", nativeQuery = true)
    Inquiry findByKhm(String khm);

    @Query(value = "select p.*,c.khm from inquiry p LEFT JOIN customer c on p.customer = c.id where c.khm like  %?1% or p.cp like %?1%  ", nativeQuery = true)
    List<Inquiry> findByKeywordLike(String keyword);




}
