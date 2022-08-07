/**
 * 
 */
package com.bskms.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.bskms.bean.UserChildren;
import com.bskms.bean.UserChildrenExample;
import com.bskms.bean.UserRole;
import com.bskms.mapper.SignMapper;
import com.bskms.mapper.UserChildrenMapper;
import com.bskms.service.UserChildrenService;

/**

 *
 */
@Service
public class UserChildrenServiceImpl implements UserChildrenService{
	@Autowired
	private UserChildrenMapper userChildrenMapper;
	
	private final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Override
	public void addUserChildren(UserChildren userChildern) {
		try {
			userChildrenMapper.insert(userChildern);
			}catch (Exception e) {
				e.printStackTrace();
		}
		
	}

	@Override
	public UserChildren selectByPrimaryKey(Integer id) {
		return userChildrenMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<UserChildren> selectAllJiazhang() {
		
		return userChildrenMapper.selectAllJiazhang();
	}

	@Override
	public UserChildren selectById(Integer id) {
		return userChildrenMapper.selectById(id);
	}

	@Override
	public UserChildren selectByUCId(String userId) {
		UserChildrenExample example = new UserChildrenExample();
		example.createCriteria().andUserIdEqualTo(userId);
		List<UserChildren> uc = userChildrenMapper.selectByExample(example);
		if(uc.size()>0) {
			return uc.get(0);
		}
		return new UserChildren();
	}

	@Override
	public void updateUC(UserChildren uc) {
		UserChildrenExample example = new UserChildrenExample();
		example.createCriteria().andIdEqualTo(uc.getId());
		userChildrenMapper.updateByExampleSelective(uc, example);
	}

//	@Override
//	public void delByUCId(Integer childrenId) {
//		try {
//			userChildrenMapper.deleteByPrimaryKey(childrenId);
//		} catch (Exception e) {
//			logger.error("删除家长幼儿信息出现异常", e);
//			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//		}
//		
//	}
	
	@Override
	public String delUserChildrenById(Integer id) {
		try {
			userChildrenMapper.deleteByPrimaryKey(id);
			return "SUCCESS";
		} catch (Exception e) {
			logger.error("删除家长幼儿联系出现异常", e);
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return "ERROR";
		}
		
	}
	
}
