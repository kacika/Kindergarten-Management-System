
package com.bskms.service.impl;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import com.bskms.bean.Children;
import com.bskms.bean.User;
import com.bskms.bean.UserChildren;
import com.bskms.bean.UserRole;
import com.bskms.service.IExcel2DB;
import com.bskms.service.UserRoleService;
import com.bskms.service.UserService;
import com.bskms.service.UserChildrenService;
import com.bskms.utils.MD5;
import com.bskms.utils.MyUtils;

/**
 * class name:Excel2DBImpl <BR>
 * class description: excel导入到数据库 实现类 <BR>
 * Remark: <BR>
 * 

 */
@Service
public class Excel2DBImpl implements IExcel2DB {

	@Autowired
	private UserService userService;
	@Autowired
	private UserRoleService userRoleService;
	@Autowired
	private UserChildrenService userChildrenService;
	/** logback日志记录 */
	private static final Logger logger = LoggerFactory.getLogger(Excel2DBImpl.class);

	/**
	 * @Override
	 * @see com.aisino.arrms.service.IExcel2DB#importExcel2DB(org.springframework.web.multipart.MultipartFile)
	 *      <BR>
	 *      Method name: importExcel2DB <BR>
	 *      Description: 从用户Excel表导入到数据库内 <BR>
	 * @param file
	 * @return <BR>
	 */
	@SuppressWarnings("resource")
	@Override
	@Transactional
	public String importUserExcel2DB(MultipartFile file) {
		int j = 0;
		try {
			InputStream in = file.getInputStream();
			String fileName = file.getOriginalFilename();

			Workbook wb = null;
			String fileType = fileName.substring(fileName.lastIndexOf('.'));
			if ((".xls").equals(fileType)) {
				wb = new HSSFWorkbook(in); // 2003 excel
			} else if ((".xlsx").equals(fileType)) {
				wb = new XSSFWorkbook(in); // 2007 excel
			} else {// 导入Excel格式出错
				logger.info("{}--->{}", fileName, "文件格式有问题");
				return "文件格式有问题！";
			}
			// 得到sheet
			Sheet sheet = wb.getSheetAt(0); // 默认取第一个sheet
			// int colsNum = sheet.getPhysicalNumberOfRows(); //获取实际的行数
			int rowsNum = sheet.getLastRowNum();//
			
			for (j = 1; j < rowsNum + 1; j++) { // 第一行为表头，所以从第二行开始
				// getLastRowNum，获取最后一行的行标
				String userId = null;
				String userPassword = "123456";
				String userName = null;
				Integer userSex = null;
				Date userBirthday = null;
				String userTel = null;
				String userAddress = null;
				String userMail = null;
				String position = null;
				String dept = null;
				String userIdcard=null;
				Integer userState = 1;
				
				Integer roleId = null;
				Integer childrenId=null;
				Integer isFaMa=null;
			    
				int n = 1;
				
//				String childname = null;
//				String childIdcard = null;
				
				Row row = sheet.getRow(j);
				if (row != null && row.getCell(n) != null && !row.getCell(n).toString().trim().equals("")) {
					userName = row.getCell(n).toString().trim();
				}
				
				n++;
				if (row != null && row.getCell(n) != null && !row.getCell(n).toString().trim().equals("")) {
					userId = row.getCell(n).toString().trim();
					if (!MyUtils.isuserId(userId)) {
						logger.info("{}--->{}", userId,n, file.getOriginalFilename(), "用户账号不正确！");
						return "第"+j+"个用户账号不正确！";
					}
				}
			
				n++;
				if (row != null && row.getCell(n) != null && !row.getCell(n).toString().trim().equals("")) {
//					logger.info("{}--->{}", "用户密码",row.getCell(n).toString());
					userPassword = row.getCell(n).toString().trim();
				}
			
				n++;
				if (row != null && row.getCell(n) != null && !row.getCell(n).toString().trim().equals("")) {
					dept = row.getCell(n).toString().trim();
				}
			
				n++;
				if (row != null && row.getCell(n) != null && !row.getCell(n).toString().trim().equals("")) {
					position = row.getCell(n).toString().trim();
				}
		
				
				n++;
				if (row != null && row.getCell(n) != null && !row.getCell(n).toString().trim().equals("")) {
					userTel = row.getCell(n).toString().trim();
					if (!MyUtils.isPhoneNum(userTel)) {
						logger.info("{}--->{}", userTel,n, file.getOriginalFilename(), "用户手机号不正确！");
						return "第"+j+"个用户手机号不正确！";
					}
				}
		
				n++;
				if (row != null && row.getCell(n) != null && !row.getCell(n).toString().trim().equals("")) {
					userMail = row.getCell(n).toString().trim();
					if (!MyUtils.isEmail(userMail)) {
						logger.info("{}--->{}", userMail,n,file.getOriginalFilename(), "用户邮箱不正确！");
						return "第"+j+"个用户邮箱不正确！";
					}
				}
			
				n++;
				if (row != null && row.getCell(n) != null && !row.getCell(n).toString().trim().equals("")) {
					//logger.info("{}--->{}", "用户性别",row.getCell(n));
					if (row.getCell(n).toString().trim().equals("男")) {
						userSex = 1;
						isFaMa = 1;
					} else {
						userSex = 0;
						isFaMa = 0;
					}
				}
		
				n++;
				if (row != null && row.getCell(n) != null && !row.getCell(n).toString().trim().equals("")) {
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					userBirthday = format.parse(row.getCell(n).toString().trim());
				}
		
				n++;
				if (row != null && row.getCell(n) != null && !row.getCell(n).toString().trim().equals("")) {
					userAddress = row.getCell(n).toString().trim();
				}
			
				n++;
				if (row != null && row.getCell(n) != null && !row.getCell(n).toString().trim().equals("")) {
					userIdcard = row.getCell(n).toString().trim();
					if(userIdcard.length()!=18) {
						logger.info("{}--->{}", n,userIdcard,file.getOriginalFilename(), "身份证号码不正确！");
						return "第"+j+"个用户身份证号码不正确！";
					}
				}
		
				n++;
				if (row != null && row.getCell(n) != null && !row.getCell(n).toString().trim().equals("")) {
//					Double d = Double.parseDouble(row.getCell(n).toString().trim());
//					userState = d.intValue();
//					if (userState < 0 || userState > 2 && userState != 9) {
//						logger.info("{}--->{}", file.getOriginalFilename(), "用户状态码不正确！");
//						return "用户状态码不正确！";
//					}
					if (row.getCell(n).toString().trim().equals("教师")) {
						userState = 1;
					} else if(row.getCell(n).toString().trim().equals("家长")){
						userState = 2;
					}else {
						logger.info("{}--->{}", file.getOriginalFilename(), "用户状态码不正确！");
						return "第"+j+"个用户状态码不正确！";
					}
				}
				if(row.getCell(n).toString().trim().equals("家长")) {
					n++;
					if(row != null && row.getCell(n) != null && !row.getCell(n).toString().trim().equals("")) {
						logger.info("{}--->{}", "幼儿",row.getCell(n));
						childrenId = Integer.parseInt(row.getCell(n).toString().trim());
					}else {
						logger.info("{}--->{}", file.getOriginalFilename(), "未填写家长对应幼儿！");
						return "第"+j+"个用户未填写家长对应幼儿！";
					}

				}
				
				
					
				User user = new User();
					
				user.setAccountCreateTime(new Date());
				user.setDept(dept);
				user.setPosition(position);
				user.setUserAddress(userAddress);
				user.setUserBirthday(userBirthday);
				user.setUserId(userId);
				user.setUserMail(userMail);
				user.setUserName(userName);
				user.setUserPassword(MD5.md5(userPassword));
				user.setUserSex(userSex);
				user.setUserState(userState);
				user.setUserTel(userTel);
				user.setUserIdcard(userIdcard);
				
				// String[] Array=new String[100]；//定义一个长度为100的String数组
				String[] userIds = new String[1];
				userIds[0] = userId;
				roleId = userState+1;
//				String addURR = null;
				userService.addUser(user);
				userRoleService.addUserRole(roleId, userIds);
				if(userState == 2) {
					UserChildren userChildren = new UserChildren();
					userChildren.setUserId(userId);
					userChildren.setChildrenId(childrenId);
					userChildren.setIsFaMa(isFaMa);
					userChildrenService.addUserChildren(userChildren);
				}
			}
			wb.close();
			in.close();
		} catch (Exception e) {
			if (e.getMessage().contains("PRIMARY")) {
				logger.info("{}--->{}", file.getOriginalFilename(), "用户账号重复！");
				return "第"+j+"个用户账号重复！";
			}
			logger.info("{}--->{}", e, "请检查必填字段！");
			// 回滚
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return "请检查必填字段！";
		}
		return "Y";
	}
}