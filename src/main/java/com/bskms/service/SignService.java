/**
 * 
 */
package com.bskms.service;

import java.util.List;

import com.bskms.bean.Sign;
import com.bskms.model.TongJi;

/**

 *
 */
public interface SignService {

	Object getAllSignByLimit(Sign signParameter);

	Sign selectByPrimaryKey(Integer id);

	void addSign(Sign sign);

	String updateSign(Sign sign);

	void delSignById(Integer parseInt);

	Object getAllChildSignByLimit(Sign signParameter);

	List<TongJi> getAllTeacherCount();

	List<TongJi> getAllChildCount();

	List<TongJi> getAllTongjiSignByLimit(Sign signParameter);

}
