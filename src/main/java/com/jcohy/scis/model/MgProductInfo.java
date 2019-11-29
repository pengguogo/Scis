package com.jcohy.scis.model;


import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * <p>
 * 产品列表
 * </p>
 *
 * @author pengguo
 * @since 2019-08-27
 */
@Data
@Entity
@Table(name = "mg_product_info")
public class MgProductInfo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private static final long serialVersionUID = 1L;

    /**
     * 产品名称
     */
    private String productName;

    /**
     * 产品名称英文
     */
    private String productNameEn;

    /**
     * SKU
     */
    private String sku;

    /**
     * OE
     */
    private String oe;

    /**
     * 重量
     */
    private String zl;

    /**
     * 尺寸
     */
    private String cc;

    /**
     * 车品牌
     */
    private String cpp;

    /**
     * 适配型号
     */
    private String spxh;

    /**
     * 供应商A
     */
    private String gysa;

    /**
     * 采购价A
     */
    private String cgja;

    /**
     * 供应商B
     */
    private String gysb;

    /**
     * 采购价B
     */
    private String cgjb;

    /**
     * 备注
     */
    private String bz;

    /**
     * 询盘情况（关联）
     */
    private String xp;

    /**
     * 订单情况（关联）
     */
    private String dd;

    /**
     * 价格
     */
    private String jg;

    /**
     * 满箱数
     */
    private String mxs;

    /**
     * 满箱外箱尺寸
     */
    private String mxwxcc;

}
