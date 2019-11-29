package com.jcohy.scis.service.impl;


import com.jcohy.scis.exception.ServiceException;
import com.jcohy.scis.model.Dept;
import com.jcohy.scis.model.Expert;
import com.jcohy.scis.model.MgProductInfo;
import com.jcohy.scis.repository.ProductRepository;
import com.jcohy.scis.service.IMgProductInfoService;
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
public class MgProductInfoServiceImpl implements IMgProductInfoService {

        @Autowired
        private ProductRepository productRepository;




        @Override
        public MgProductInfo save(MgProductInfo productInfo) throws Exception {
            return productRepository.save(productInfo);
    }


    @Override
    public Page<MgProductInfo> findAll(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    @Override
    public List<MgProductInfo> findAll() {
        return productRepository.findAll();
    }

    @Override
    public MgProductInfo findById(Integer id) {
        return productRepository.findById(id).get();
    }

    @Override
    public void delete(Integer id) {
        productRepository.deleteById(id);
    }

    @Override
    public  List<MgProductInfo> findByName(String name) {
        return productRepository.findByProductName(name);
    }

    @Override
    public  MgProductInfo findBySku(String sku) {
        return productRepository.findBySku(sku);
    }
    @Override
    public   List<MgProductInfo> findByKeywordLike(String keyword) {
        return productRepository.findByKeywordLike(keyword);
    }


    @Override
    public   List<MgProductInfo> findByKeyword(String keyword) {
        return productRepository.findByKeyword(keyword);
    }

}
