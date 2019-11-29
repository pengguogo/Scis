package com.jcohy.scis.service;

import com.jcohy.scis.model.Supplier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * <p>
 * 供应商列表 服务类
 * </p>
 *
 * @author lqh
 * @since 2019-10-18
 */
public interface ISupplierService {

        /**
         * 分页查询
         * @param pageable
         * @return
         */
        Page<Supplier> findAll(Pageable pageable);

        List<Supplier> findAll();

        Supplier findById(Integer id);


        Supplier save(Supplier dept) throws Exception;

        void delete(Integer id);


        Supplier findByGsm(String sku);

        List<Supplier> findByKeywordLike(String keyword);



}
