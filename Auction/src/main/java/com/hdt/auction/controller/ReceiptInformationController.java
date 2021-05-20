package com.hdt.auction.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hdt.auction.dto.Msg;
import com.hdt.auction.entity.ReceiptInformation;
import com.hdt.auction.service.ReceiptInformationService;

@Controller
public class ReceiptInformationController {

	@Autowired
	ReceiptInformationService receiptInformationService;

	/**
	 * 根据uerid 返回用户已经添加的地址
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getrptInfo")
	public Msg getRptInfo(@RequestParam(value = "id") long id) {

		List<ReceiptInformation> receiptInformations = receiptInformationService.getReceiptInfoByUserId(id);
		return Msg.success().add("rptInfo", receiptInformations);
	}
	@ResponseBody
	@RequestMapping("/setDefault")
	public Msg setDefault(@RequestParam(value = "id") long id,@RequestParam(value = "user_id") long user_id) {

		List<ReceiptInformation> receiptInformations = receiptInformationService.getReceiptInfoByUserId(user_id);
		for (ReceiptInformation receiptInformation : receiptInformations) {
			Byte a = 0;
			receiptInformation.setIs_DefaultAddress(a);
			receiptInformationService.updateReceiptInfo(receiptInformation);
		}
		Byte b = 1;
		ReceiptInformation rInformation = receiptInformationService.getReceiptInfoById(id);
		rInformation.setIs_DefaultAddress(b);
		receiptInformationService.updateReceiptInfo(rInformation);
		return Msg.success();
	}
	@ResponseBody
	@RequestMapping("/getrptInfoByis_default")
	public Msg getRptInfoByis_default(@RequestParam(value = "id") long id) {
		Byte a = 1;
		ReceiptInformation receiptInformations = receiptInformationService.selectByIdandIs_default(id, a);
		return Msg.success().add("rptInfo", receiptInformations);
	}
	/**
	 * 删除 地址
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteRptRptInfo")
	public Msg deleteRpt(@RequestParam(value = "id") long id) {

		receiptInformationService.deleteReceiptInfoById(id);
		return Msg.success();
	}
	/**
	 * 上传地址信息
	 * @param receiptInformation
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/insertRpt")
	public Msg insertRpt(ReceiptInformation receiptInformation) {
		Byte a =0;
		receiptInformation.setIs_DefaultAddress(a);
		receiptInformationService.insertReceiptInfo(receiptInformation);
		return Msg.success().add("RptInfo", receiptInformation);
	}
	@ResponseBody
	@RequestMapping("/updateRpt")
	public Msg updateRpt(ReceiptInformation receiptInformation) {
		receiptInformationService.updateReceiptInfo(receiptInformation);
		return Msg.success().add("RptInfo", receiptInformation);
	}
	
}
