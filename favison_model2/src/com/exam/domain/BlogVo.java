package com.exam.domain;

import java.sql.Timestamp;

public class BlogVo {
	private int num;
	private String name;
	private String passwd;
	private String subject;
	private String content;
	private int readcount;
	private Timestamp regDate;
	private String ip;
	private String filename;
	private int reRef;
	private int reLev;
	private int reSeq;
	private int no;//pk
	
	
	public BlogVo() {
		// TODO Auto-generated constructor stub
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getReRef() {
		return reRef;
	}
	public void setReRef(int reRef) {
		this.reRef = reRef;
	}
	public int getReLev() {
		return reLev;
	}
	public void setReLev(int reLev) {
		this.reLev = reLev;
	}
	public int getReSeq() {
		return reSeq;
	}
	public void setReSeq(int reSeq) {
		this.reSeq = reSeq;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	@Override
	public String toString() {
		return "BlogVo [num=" + num + ", name=" + name + ", passwd=" + passwd + ", subject=" + subject + ", content="
				+ content + ", readcount=" + readcount + ", regDate=" + regDate + ", ip=" + ip + ", filename="
				+ filename + ", reRef=" + reRef + ", reLev=" + reLev + ", reSeq=" + reSeq + ", no=" + no + "]";
	}
	
	
}
