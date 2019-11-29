package com.jcohy.scis.service;

import com.jcohy.scis.model.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * <p>
 * 客户列表 服务类
 * </p>
 *
 * @author lqh
 * @since 2019-10-18
 */
public interface ICustomerService {

        /**
         * 分页查询
         * @param pageable
         * @return
         */
        Page<Customer> findAll(Pageable pageable);

        List<Customer> findAll();

        Customer findById(Integer id);


        Customer save(Customer dept) throws Exception;

        void delete(Integer id);


        Customer findByKhm(String sku);

        List<Customer> findByKeywordLike(String keyword);



}
