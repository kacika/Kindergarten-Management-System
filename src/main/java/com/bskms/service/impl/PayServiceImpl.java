/**
 * 
 */
package com.bskms.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.bskms.bean.ClaTea;

import com.bskms.bean.Pay;

import com.bskms.mapper.PayMapper;
import com.bskms.model.MMGridPageVoBean;
import com.bskms.service.PayService;

/**

 *
 */
@Service
public class PayServiceImpl implements PayService{

	@Autowired
	private PayMapper payMapper;
	
	private final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	/**
	 * @Override
	 * @see com.aisino.arrms.service.UserService#getAllUserByLimit(com.aisino.arrms.model.UserParameter)
	 *      <BR>
	 *      Method name: getAllClassByLimit <BR>
	 *      Description: 根据条件查询班级 <BR>
	 *      Remark: <BR>
	 * @param userParameter
	 * @return <BR>
	 */
	@Override
	public Object getAllPayByLimit(Pay payParameter) {
		int size = 0;

		Integer begin = (payParameter.getPage() - 1) * payParameter.getLimit();
		payParameter.setPage(begin);
		
		
		if(payParameter.getMinDate()!=null && !payParameter.getMinDate().equals("")) {	
				
			    String date = payParameter.getMinDate()+"-01";
		        Calendar calendar = Calendar.getInstance();
		        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		        try {
					calendar.setTime(sdf.parse(date));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		        calendar.add(Calendar.MONTH, 0);
		        calendar.set(Calendar.DAY_OF_MONTH, 1);
		        String firstDayOfMonth = sdf.format(calendar.getTime());
		        calendar.add(Calendar.MONTH, 1);
		        calendar.set(Calendar.DAY_OF_MONTH, 0);
		        String lastDayOfMonth = sdf.format(calendar.getTime());

			payParameter.setMaxDate(lastDayOfMonth);
			payParameter.setMinDate(firstDayOfMonth);
		}
		

		List<Pay> rows = new ArrayList<>();
		try {
			rows = payMapper.getAllPayByLimit(payParameter);
			size = payMapper.countAllPayByLimit(payParameter);
		} catch (Exception e) {
			logger.error("根据查询工资 异常", e);
		}
		MMGridPageVoBean<Pay> vo = new MMGridPageVoBean<>();
		vo.setTotal(size);
		vo.setRows(rows);

		return vo;
	}

	@Override
	public Pay selectByPrimaryKey(Integer id) {
		
		return payMapper.selectByPrimaryKey(id);
	}

	@Override
	public void addPayTea(Pay pay) {
		try {
			payMapper.insert(pay);
			}catch (Exception e) {
				e.printStackTrace();
		}
	}

	@Override
	public String updateTea(Pay pay) {
		try {
			payMapper.updateByPrimaryKeySelective(pay);
			return "SUCCESS";
		} catch (Exception e) {
			logger.error("根据用户id更新用户异常", e);
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return "ERR";
		}
	}

	@Override
	public void delClaTeaById(Integer id) {
		try {
			payMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			logger.error("删除用户出现异常", e);
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
	}

}
