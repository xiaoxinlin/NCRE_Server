package com.ncre.controller;

import java.util.List;

import com.jfinal.core.Controller;
import com.ncre.model.QuestionClass;
import com.ncre.model.TktClass;

public class QuestionController extends BaseControllerImpl  {

	public void add() {

		QuestionClass questionClass = getModel(QuestionClass.class);

		questionClass.set("is_legal", false).save();

		redirect("/question/index");
	}

	public void delete() {
		String id = getPara("id");

		QuestionClass.dao.deleteById(id.toString());

		redirect("/question/index");
	}

	public void index() {
		String pageNow = getPara("page");
		if("".equals(pageNow) || pageNow == null){
			pageNow = "1";
		}
		List<QuestionClass> questionList = QuestionClass.dao
				.find("select * from `question`");

		renderJson(questionList);

		return;
	}

	public void show() {
		String id = getPara("id");

		QuestionClass questionClass = QuestionClass.dao.findById(id.toString());

		renderJson(questionClass);

		return;
	}

	public void update() {
		QuestionClass questionClass = getModel(QuestionClass.class);

		questionClass.dao.findById(questionClass.get("id").toString())
				.set("title", questionClass.get("title"))
				.set("answer",questionClass.get("answer"))
				.set("is_legal", questionClass.get("is_legal"))
				.update();

		redirect("/question/index");
	}

}
