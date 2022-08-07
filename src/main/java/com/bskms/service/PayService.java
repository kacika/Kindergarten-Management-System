/**
 * 
 */
package com.bskms.service;

import com.bskms.bean.ClaTea;
import com.bskms.bean.Pay;

/**

 *
 */
public interface PayService {

	Pay selectByPrimaryKey(Integer id);

	void addPayTea(Pay pay);

	String updateTea(Pay pay);

	void delClaTeaById(Integer parseInt);
	
	Object getAllPayByLimit(Pay payParameter);

}
