package com.jcohy.scis.service;


import com.jcohy.scis.model.MgProductInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * <p>
 * 产品列表 服务类
 * </p>
 *
 * @author pengguo
 * @since 2019-08-27
 */
public interface IMgProductInfoService  {

    /**
     * 分页查询
     * @param pageable
     * @return
     */
    Page<MgProductInfo> findAll(Pageable pageable);

    List<MgProductInfo> findAll();

    MgProductInfo findById(Integer id);


    MgProductInfo save(MgProductInfo dept) throws Exception;

    void delete(Integer id);

    List<MgProductInfo> findByName(String name);

    MgProductInfo findBySku(String sku);

    List<MgProductInfo> findByKeywordLike(String keyword);

    List<MgProductInfo> findByKeyword(String keyword);


}
