package com.jcohy.scis.service.impl;


import com.jcohy.scis.model.Supplier;
import com.jcohy.scis.repository.SupplierRepository;
import com.jcohy.scis.service.ISupplierService;
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
public class SupplierServiceImpl implements ISupplierService {

        @Autowired
        private SupplierRepository productRepository;




        @Override
        public Supplier save(Supplier productInfo) throws Exception {
            return productRepository.save(productInfo);
    }


    @Override
    public Page<Supplier> findAll(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    @Override
    public List<Supplier> findAll() {
        return productRepository.findAll();
    }

    @Override
    public Supplier findById(Integer id) {
        return productRepository.findById(id).get();
    }

    @Override
    public void delete(Integer id) {
        productRepository.deleteById(id);
    }


    @Override
    public  Supplier findByGsm(String sku) {
        return productRepository.findByGsm(sku);
    }
    @Override
    public   List<Supplier> findByKeywordLike(String keyword) {
        return productRepository.findByKeywordLike(keyword);
    }



}
