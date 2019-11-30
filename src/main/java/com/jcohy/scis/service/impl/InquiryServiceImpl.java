package com.jcohy.scis.service.impl;

import com.jcohy.scis.model.Inquiry;
import com.jcohy.scis.repository.InquiryRepository;
import com.jcohy.scis.service.IInquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 询盘列表 服务实现类
 * </p>
 *
 * @author jobob
 * @since 2019-11-30
 */
@Service
public class InquiryServiceImpl implements IInquiryService {


    @Autowired
    private InquiryRepository productRepository;




    @Override
    public Inquiry save(Inquiry productInfo) throws Exception {
        return productRepository.save(productInfo);
    }


    @Override
    public Page<Inquiry> findAll(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    @Override
    public List<Inquiry> findAll() {
        return productRepository.findAll();
    }

    @Override
    public Inquiry findById(Integer id) {
        return productRepository.findById(id).get();
    }

    @Override
    public void delete(Integer id) {
        productRepository.deleteById(id);
    }


    @Override
    public  Inquiry findByKhm(String sku) {
        return productRepository.findByKhm(sku);
    }
    @Override
    public   List<Inquiry> findByKeywordLike(String keyword) {
        return productRepository.findByKeywordLike(keyword);
    }



}
