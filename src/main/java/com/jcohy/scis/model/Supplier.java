package com.jcohy.scis.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

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
@Table(name = "supplier")
public class Supplier implements Serializable{

    private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

    /**
     * 公司名
     */
	private String gsm;
    /**
     * 主营产品
     */
	private String zycp;
    /**
     * 联系人
     */
	private String lxr;
    /**
     * 联系电话
     */
	private String lxdh;
    /**
     * 网址
     */
	private String wz;
    /**
     * QQ
     */
	private String qq;
    /**
     * 微信
     */
	private String wx;
    /**
     * 地址
     */
	private String dz;



}
