package com.ncre.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.core.Controller;
import com.ncre.model.TktClass;
import com.ncre.service.TktService;

public class TktController extends Controller implements
		BaseControllerI<TktController> {

	public void add() {
		// TODO Auto-generated method stub
		new TktClass().set("title", "1+1=").set("answer", "2").set(
				"subject_type", "math").set("type", 0).save();
		new TktClass().set("title", "1+1=").set("answer", "2").set(
				"subject_type", "math").set("type", 0).save();
		new TktClass().set("title", "1+1=").set("answer", "2").set(
				"subject_type", "math").set("type", 0).save();
		new TktClass().set("title", "1+1=").set("answer", "2").set(
				"subject_type", "math").set("type", 0).save();
		new TktClass().set("title", "1+1=").set("answer", "2").set(
				"subject_type", "math").set("type", 0).save();
		new TktClass().set("title", "1+1=").set("answer", "2").set(
				"subject_type", "math").set("type", 0).save();
		new TktClass().set("title", "1+1=").set("answer", "2").set(
				"subject_type", "math").set("type", 0).save();
		new TktClass().set("title", "1+1=").set("answer", "2").set(
				"subject_type", "math").set("type", 0).save();
		new TktClass().set("title", "orange").set("answer", "橙子").set(
				"subject_type", "english").set("type", 1).save();
		new TktClass().set("title", "orange").set("answer", "橙子").set(
				"subject_type", "english").set("type", 1).save();
		new TktClass().set("title", "orange").set("answer", "橙子").set(
				"subject_type", "english").set("type", 1).save();
		new TktClass().set("title", "orange").set("answer", "橙子").set(
				"subject_type", "english").set("type", 1).save();
		new TktClass().set("title", "orange").set("answer", "橙子").set(
				"subject_type", "english").set("type", 1).save();
		new TktClass().set("title", "orange").set("answer", "橙子").set(
				"subject_type", "english").set("type", 1).save();
		new TktClass().set("title", "orange").set("answer", "橙子").set(
				"subject_type", "english").set("type", 1).save();
		new TktClass().set("title", "apple").set("answer", "苹果").set(
				"subject_type", "english").set("type", 1).save();
		new TktClass().set("title", "apple").set("answer", "苹果").set(
				"subject_type", "english").set("type", 1).save();
		new TktClass().set("title", "apple").set("answer", "苹果").set(
				"subject_type", "english").set("type", 1).save();
		renderHtml("<b>tkt add</b>");
		return;

	}

	public void delete() {
		// TODO Auto-generated method stub

	}

	public void index() {
		
	}


	public void show() {
		

	}

	public void update() {
		// TODO Auto-generated method stub

	}

}
