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

import com.bskms.bean.Notice;
import com.bskms.bean.Pay;
import com.bskms.bean.Sign;
import com.bskms.mapper.SignMapper;
import com.bskms.model.MMGridPageVoBean;
import com.bskms.model.TongJi;
import com.bskms.service.SignService;

/**

 *
 */
@Service
public class SignServiceImpl implements SignService{
	@Autowired
	private SignMapper signMapper;
	
	private final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Override
	public Object getAllSignByLimit(Sign signParameter) {
		int size = 0;

		Integer begin = (signParameter.getPage() - 1) * signParameter.getLimit();
		signParameter.setPage(begin);

		List<Sign> rows = new ArrayList<>();
		try {
			rows = signMapper.getAllSignByLimit(signParameter);
			size = signMapper.countAllSignByLimit(signParameter);
		} catch (Exception e) {
			logger.error("根据查询考勤 异常", e);
		}
		MMGridPageVoBean<Sign> vo = new MMGridPageVoBean<>();
		vo.setTotal(size);
		vo.setRows(rows);

		return vo;
	}

	@Override
	public Sign selectByPrimaryKey(Integer id) {
		return signMapper.selectByPrimaryKey(id);
	}

	@Override
	public void addSign(Sign sign) {
		try {
			signMapper.insert(sign);
			}catch (Exception e) {
				e.printStackTrace();
		}
	}

	@Override
	public String updateSign(Sign sign) {
		try {
			signMapper.updateByPrimaryKeySelective(sign);
			return "SUCCESS";
		} catch (Exception e) {
			logger.error("根据用户id更新用户异常", e);
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return "ERR";
		}
	}

	@Override
	public void delSignById(Integer parseInt) {
		try {
			signMapper.deleteByPrimaryKey(parseInt);
		} catch (Exception e) {
			logger.error("删除考勤用户出现异常", e);
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
	}

	@Override
	public Object getAllChildSignByLimit(Sign signParameter) {
		int size = 0;

		Integer begin = (signParameter.getPage() - 1) * signParameter.getLimit();
		signParameter.setPage(begin);

		List<Sign> rows = new ArrayList<>();
		try {
			rows = signMapper.getAllChildSignByLimit(signParameter);
			size = signMapper.countAllChildSignByLimit(signParameter);
		} catch (Exception e) {
			logger.error("根据查询班级 异常", e);
		}
		MMGridPageVoBean<Sign> vo = new MMGridPageVoBean<>();
		vo.setTotal(size);
		vo.setRows(rows);

		return vo;
	}

	@Override
	public List<TongJi> getAllTeacherCount() {
//		Sign signParameter;
//		if(signParameter.getMinDate()!=null && !signParameter.getMinDate().equals("")) {	
//			
//		    String date = signParameter.getMinDate()+"-01";
//	        Calendar calendar = Calendar.getInstance();
//	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//	        try {
//				calendar.setTime(sdf.parse(date));
//			} catch (ParseException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//	        calendar.add(Calendar.MONTH, 0);
//	        calendar.set(Calendar.DAY_OF_MONTH, 1);
//	        String firstDayOfMonth = sdf.format(calendar.getTime());
//	        calendar.add(Calendar.MONTH, 1);
//	        calendar.set(Calendar.DAY_OF_MONTH, 0);
//	        String lastDayOfMonth = sdf.format(calendar.getTime());
//
//		signParameter.setMaxDate(lastDayOfMonth);
//		signParameter.setMinDate(firstDayOfMonth);
//	}
		return signMapper.getAllTeacherCount();
	}

	@Override
	public List<TongJi> getAllChildCount() {
		return signMapper.getAllChildCount();
	}
	
	@Override
	public List<TongJi> getAllTongjiSignByLimit(Sign signParameter) {


		
		if(signParameter.getStartTime()!=null && !signParameter.getStartTime().equals("")) {	
				
			    String date = signParameter.getMinDate()+"-01";
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

		    signParameter.setEndTime(lastDayOfMonth);
		    signParameter.setStartTime(firstDayOfMonth);
		}

		return signMapper.getAllTeacherCount();
	}
}
