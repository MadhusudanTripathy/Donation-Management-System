package com.mst.model;

import java.io.InputStream;

public class Donee {
	protected int id;
	protected String doneeName;
	protected String categoryValue;
	protected String subjectValue;
	protected String targetAmount;
	protected InputStream causePhoto;
	protected String base64CausePhoto;
	protected InputStream medicalProofPhoto;
	protected String base64MedicalProofPhoto;
	protected InputStream qrcodePhoto;
	protected String base64QrcodePhoto;
	
	
	public Donee(){}
	public Donee(int id, String doneeName, String category, String subject, String targetAmount, InputStream causePhoto, InputStream medical_proof_photo, InputStream qrcode_photo ){
		super();
		this.id=id;
		this.doneeName= doneeName;
		this.categoryValue =category;
		this.subjectValue =subject;
		this.targetAmount =targetAmount;
		this.causePhoto =causePhoto;
		this.medicalProofPhoto=medical_proof_photo;
		this.qrcodePhoto =qrcode_photo;
	}
	public Donee(String doneeName, String category, String subject, String targetAmount, InputStream causePhoto, InputStream medical_proof_photo, InputStream qrcode_photo ){
		super();
		this.doneeName= doneeName;
		this.categoryValue =category;
		this.subjectValue =subject;
		this.targetAmount =targetAmount;
		this.causePhoto =causePhoto;
		this.medicalProofPhoto=medical_proof_photo;
		this.qrcodePhoto =qrcode_photo;
	}
	public Donee(int id, String doneeName, String category, String subject, String targetAmount, String base64_causePhoto, String base64MedicalProofPhoto, String base64QrcodePhoto ){
		super();
		this.id=id;
		this.doneeName= doneeName;
		this.categoryValue =category;
		this.subjectValue =subject;
		this.targetAmount =targetAmount;
		this.base64CausePhoto =base64_causePhoto;
		this.base64MedicalProofPhoto=base64MedicalProofPhoto;
		this.base64QrcodePhoto =base64QrcodePhoto;
	}
	
	public int getId(){
		return id;
	}
	public void setId(int id){
		this.id=id;
	}
	public String getDoneeName(){
		return doneeName;
	}
	public void setDoneeName(String name){
		this.doneeName=name;
	}
	public String getCategoryValue(){
		return categoryValue;
	}
	public void setCategoryValue(String categoryValue){
		this.categoryValue=categoryValue;
	}
	public String getSubjectValue(){
		return subjectValue;
	}
	public void setSubjectValue(String subject){
		this.subjectValue=subject;
	}
	public String getTargetAmount(){
		return targetAmount;
	}
	public void setTargetAmount(String targetAmount){
		this.targetAmount=targetAmount;
	}
	public InputStream getCausePhoto() {
        return causePhoto;
    }
	public InputStream getMedicalProofPhoto() {
        return medicalProofPhoto;
    }
	public InputStream getQRCodePhoto() {
        return qrcodePhoto;
    }
	public String getBase64CausePhoto(){
		return base64CausePhoto;
	}
	public void setBase64CausePhoto(String category){
		this.categoryValue=category;
	}
	public String getBase64MedicalProofPhoto(){
		return base64MedicalProofPhoto;
	}
	public void setBase64MedicalProofPhoto(String base64MedicalProofPhoto){
		this.base64MedicalProofPhoto=base64MedicalProofPhoto;
	}
	public String getBase64QRCodePhoto(){
		return base64QrcodePhoto;
	}
	public void setBase64QRCodePhoto(String base64QrcodePhoto){
		this.base64QrcodePhoto=base64QrcodePhoto;
	}
}
