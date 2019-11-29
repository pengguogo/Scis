package com.jcohy.scis.service.impl;


import com.jcohy.scis.model.Customer;
import com.jcohy.scis.repository.CustomerRepository;
import com.jcohy.scis.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 产品列表 服务实现类
 * </p>
 *
 * @author pengguo
 * @since 2019-08-27
 */
@Service
public class CustomerServiceImpl implements ICustomerService {

        @Autowired
        private CustomerRepository productRepository;




        @Override
        public Customer save(Customer productInfo) throws Exception {
            return productRepository.save(productInfo);
    }


    @Override
    public Page<Customer> findAll(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    @Override
    public List<Customer> findAll() {
        return productRepository.findAll();
    }

    @Override
    public Customer findById(Integer id) {
        return productRepository.findById(id).get();
    }

    @Override
    public void delete(Integer id) {
        productRepository.deleteById(id);
    }


    @Override
    public  Customer findByKhm(String sku) {
        return productRepository.findByKhm(sku);
    }
    @Override
    public   List<Customer> findByKeywordLike(String keyword) {
        return productRepository.findByKeywordLike(keyword);
    }



}
