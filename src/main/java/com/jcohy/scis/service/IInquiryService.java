package com.jcohy.scis.service;


import com.jcohy.scis.model.Inquiry;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * <p>
 * 询盘列表 服务类
 * </p>
 *
 * @author pg
 * @since 2019-11-30
 */
public interface IInquiryService{
    /**
     * 分页查询
     * @param pageable
     * @return
     */
    Page<Inquiry> findAll(Pageable pageable);

    List<Inquiry> findAll();

    Inquiry findById(Integer id);


    Inquiry save(Inquiry dept) throws Exception;

    void delete(Integer id);


    Inquiry findByKhm(String sku);

    List<Inquiry> findByKeywordLike(String keyword);
}
