package com.ncre.utils;

import com.jfinal.plugin.activerecord.Model;

public class ExamConfig{

	public int getXztNumsOfTEST() {
		return xztNumsOfTEST;
	}
	public void setXztNumsOfTEST(int xztNumsOfTEST) {
		this.xztNumsOfTEST = xztNumsOfTEST;
	}
	public int getTktNumsOfTEST() {
		return tktNumsOfTEST;
	}
	public void setTktNumsOfTEST(int tktNumsOfTEST) {
		this.tktNumsOfTEST = tktNumsOfTEST;
	}
	public int getXztNumsOfEXAM() {
		return xztNumsOfEXAM;
	}
	public void setXztNumsOfEXAM(int xztNumsOfEXAM) {
		this.xztNumsOfEXAM = xztNumsOfEXAM;
	}
	public int getTktNumsOfEXAM() {
		return tktNumsOfEXAM;
	}
	public void setTktNumsOfEXAM(int tktNumsOfEXAM) {
		this.tktNumsOfEXAM = tktNumsOfEXAM;
	}
	public int getDtNumsOfEXAM() {
		return dtNumsOfEXAM;
	}
	public void setDtNumsOfEXAM(int dtNumsOfEXAM) {
		this.dtNumsOfEXAM = dtNumsOfEXAM;
	}
	private  int xztNumsOfTEST = 1;
	private  int tktNumsOfTEST = 1;
	
	private  int xztNumsOfEXAM = 3;
	private  int tktNumsOfEXAM = 2;
	private  int dtNumsOfEXAM = 1;
	

	
	
}
