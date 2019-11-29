package com.jcohy.scis.model;

import lombok.Data;

import javax.persistence.*;

/**
 * <p>
 * 供应商列表
 * </p>
 *
 * @author lqh
 * @since 2019-10-18
 */
@Data
@Entity
@Table(name = "customer")
public class Customer {

    private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
     * 客户名
     */
	private String khm;
	/**
	 * 客户地址
	 */
	private String khdz;
    /**
     * 国家
     */
	private String gj;
    /**
     * 联系方式
     */
	private String lxfs;
    /**
     * 客户分类
     */
	private String khfl;
    /**
     * 感兴趣产品
     */
	private String gxqcp;
    /**
     * 数量
     */
	private String sl;
    /**
     * 车型
     */
	private String cx;
    /**
     * OE号
     */
	private String oe;
    /**
     * 报价
     */
	private String bj;
    /**
     * 邮箱
     */
	private String yx;
    /**
     * sku
     */
	private String sku;

}
