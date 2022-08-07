package com.bskms.model;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.bskms.bean.BaseBean;
import lombok.Data;


@Data
@TableName("qingjia")
public class QingjiaEntity extends BaseBean implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 
	 */
	private String parentName;
	/**
	 * 
	 */
	private String childName;
	/**
	 * 
	 */
	private Boolean type;
	/**
	 * 
	 */
	private Date applyDate; //记录创建日期
	/**
	 * 
	 */
	private String applyStartDate; // 申假开始日
	
	private String applyEndDate; // 申假结束日
	
	private String detail;
	/**
	 * 
	 */
	private Boolean status;

}
