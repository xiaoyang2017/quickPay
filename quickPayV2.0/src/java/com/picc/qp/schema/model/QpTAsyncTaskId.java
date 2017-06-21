package com.picc.qp.schema.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

@Embeddable
public class QpTAsyncTaskId implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	
	/*
	*	构造函数
	*/
	public QpTAsyncTaskId() {
	}
	
	 
		private String taskId;
		@Column(name = "taskId")
		public String getTaskId() {
			return this.taskId;
		}
		
		public void setTaskId(String taskId) {
			this.taskId = taskId;
		}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getTaskId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof QpTAsyncTaskId == false){
			return false;
		}
		if(this == obj){
			return true;
		}
		QpTAsyncTaskId other = (QpTAsyncTaskId)obj;
		return new EqualsBuilder()
			.append(getTaskId(),other.getTaskId())
			.isEquals();
	}
}