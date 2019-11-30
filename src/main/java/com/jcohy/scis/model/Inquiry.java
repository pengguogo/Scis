package com.jcohy.scis.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * <p>
 * 询盘列表
 * </p>
 *
 * @author jobob
 * @since 2019-11-30
 */
@Data
@Entity
@Table(name = "inquiry")
public class Inquiry implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 产品
     */
    private String cp;

    /**
     * 销售时间
     */
    private String xssj;

    /**
     * 产品金额
     */
    private String cpje;

    /**
     * 订单总金额
     */
    private String ddzje;

    /**
     * 运费
     */
    private String yf;

    /**
     * 供应商
     */
    private String gys;

    /**
     * 采购价
     */
    private String cgj;

    /**
     * 客户id
     */
    private Integer customer;


    /**
     * 客户名
     */
    @Transient
    private String khm;

    






}
