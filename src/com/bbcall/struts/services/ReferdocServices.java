package com.bbcall.struts.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbcall.functions.ResultCode;
import com.bbcall.mybatis.dao.ReferdocMapper;
import com.bbcall.mybatis.table.Referdoc;

@Service("referdocServices")
public class ReferdocServices {

	@Autowired
	private ReferdocMapper referdocMapper;

	private Referdoc referdocinfo;

	private List<Referdoc> referdocinfos;

	// ################################################################################
	// ## Add Referdoc services
	// ## 新增参考数据
	// ##==============================================================================
	// ## Instructions
	// ##
	// ##------------------------------------------------------------------------------
	// ## 1. Require parameters:
	// ## (1) referdoc_type
	// ## (2) referdoc_price
	// ##
	// ##------------------------------------------------------------------------------
	// ## 2. Optional parameters: NONE
	// ##
	// ##------------------------------------------------------------------------------
	// ## 3. Return parameters:
	// ## (4) ResultCode.SUCCESS
	// ##
	// ##------------------------------------------------------------------------------
	// ## 4. Return referdocinfo:
	// ## (1) referdocinfo
	// ##
	// ################################################################################

	public int addReferdoc(String referdoc_type, double referdoc_price) {
		// TODO Auto-generated method stub

		System.out.println("Here is referdocServices.add method...");

		int checkResult = chkReferType(referdoc_type);

		if (checkResult == ResultCode.REFERDOC_TYPE_NOTEXIST) {

			
			Referdoc referdoc = new Referdoc();
			referdoc.setReferdoc_type(referdoc_type);
			referdoc.setReferdoc_price(referdoc_price);

			referdocMapper.addReferdoc(referdoc);

			referdocinfos = referdocMapper.getReferdoclist();
			return ResultCode.SUCCESS;
		} else {
			return checkResult;
		}

	}

	// ################################################################################
	// ## Update Referdoc services
	// ## 更新参考数据
	// ##==============================================================================
	// ## Instructions
	// ##
	// ##------------------------------------------------------------------------------
	// ## 1. Require parameters:
	// ## (1) referdoc_id
	// ## (2) referdoc_type
	// ## (3) referdoc_price
	// ##
	// ##------------------------------------------------------------------------------
	// ## 2. Optional parameters: NONE
	// ##
	// ##------------------------------------------------------------------------------
	// ## 3. Return parameters:
	// ## (4) ResultCode.SUCCESS
	// ##
	// ##------------------------------------------------------------------------------
	// ## 4. Return referdocinfo:
	// ## (1) referdocinfo
	// ##
	// ################################################################################

	public int updateReferdoc(int referdoc_id, String referdoc_type,
			double referdoc_price) {

		System.out.println("Here is referdocServices.update method...");

		Referdoc referdoc = referdocMapper.getReferdoc(referdoc_id);

		referdoc.setReferdoc_type(referdoc_type);
		referdoc.setReferdoc_price(referdoc_price);

		referdocMapper.updateReferdoc(referdoc);

		referdocinfo = referdoc;

		return ResultCode.SUCCESS;
	}

	// ################################################################################
	// ## Delete Referdoc services
	// ## 删除参考数据
	// ##==============================================================================
	// ## Instructions
	// ##
	// ##------------------------------------------------------------------------------
	// ## 1. Require parameters:
	// ## (1) referdoc_id
	// ##
	// ##------------------------------------------------------------------------------
	// ## 2. Optional parameters: NONE
	// ##
	// ##------------------------------------------------------------------------------
	// ## 3. Return parameters:
	// ## (4) ResultCode.SUCCESS
	// ##
	// ##------------------------------------------------------------------------------
	// ## 4. Return referdocinfos:
	// ## (1) referdocinfos
	// ##
	// ################################################################################

	public int deleteReferdoc(int referdoc_id) {

		System.out.println("Here is referdocServices.delete method...");

		referdocMapper.deleteReferdoc(referdoc_id);

		referdocinfos = referdocMapper.getReferdoclist();

		return ResultCode.SUCCESS;
	}

	// ################################################################################
	// ## Get Referdoc services
	// ## 取得参考数据
	// ##==============================================================================
	// ## Instructions
	// ##
	// ##------------------------------------------------------------------------------
	// ## 1. Require parameters:
	// ## (1) referdoc_id
	// ##
	// ##------------------------------------------------------------------------------
	// ## 2. Optional parameters: NONE
	// ##
	// ##------------------------------------------------------------------------------
	// ## 3. Return parameters:
	// ## (4) ResultCode.SUCCESS
	// ##
	// ##------------------------------------------------------------------------------
	// ## 4. Return referdocinfo:
	// ## (1) referdocinfo
	// ##
	// ################################################################################

	public int getReferdoc(int referdoc_id) {

		System.out.println("Here is referdocServices.get method...");

		referdocinfo = referdocMapper.getReferdoc(referdoc_id);

		return ResultCode.SUCCESS;
	}

	// ################################################################################
	// ## Get Referdoc listservices
	// ## 取得参考数据列表
	// ##==============================================================================
	// ## Instructions
	// ##
	// ##------------------------------------------------------------------------------
	// ## 1. Require parameters:
	// ##
	// ##------------------------------------------------------------------------------
	// ## 2. Optional parameters: NONE
	// ##
	// ##------------------------------------------------------------------------------
	// ## 3. Return parameters:
	// ## (4) ResultCode.SUCCESS
	// ##
	// ##------------------------------------------------------------------------------
	// ## 4. Return referdocinfos:
	// ## (1) referdocinfos
	// ##
	// ################################################################################

	public int getReferdoclist() {

		System.out.println("Here is referdocServices.get list method...");

		referdocinfos = referdocMapper.getReferdoclist();

		return ResultCode.SUCCESS;
	}

	public int chkReferType(String referdoc_type) {

		if (referdoc_type.equals(""))
			return ResultCode.REFERDOC_TYPE_EMPTY;

		referdocinfo = referdocMapper.getReferdocByType(referdoc_type);

		if (null != referdocinfo) {
			System.out.println("referdoc type exist");
			return ResultCode.REFERDOC_TYPE_TEXIST;
		} else {
			System.out.println("referdoc type not exist");
			return ResultCode.REFERDOC_TYPE_NOTEXIST;
		}
	}

	// ###################
	// 返回用户信息, 用于json返回
	// ###################

	public Referdoc referdocinfo() {

		return referdocinfo;
	}

	public List<Referdoc> referdocinfos() {

		return referdocinfos;
	}
}
