package com.bbcall.mybatis.dao;

import java.util.List;

import com.bbcall.mybatis.table.Referdoc;


public interface ReferdocMapper {

	// 添加参考数据
	public void addReference(Referdoc referdoc);

	// 通过订单类ID得对应的参考数据
	public Referdoc getReferdoc(int referdoc_id);
	
	// 通过订单类型取得对应的参考数据
	public Referdoc getReferdocByType(String referdoc_type);

	// 取得所有的参考数据列表
	public List<Referdoc> getReferdoclist();
	
	// 更新参考数据
	public void updateReferdoc(Referdoc referdoc);

	// 删除参考数据
	public void deleteReferdoc(int referdoc_id);

}
