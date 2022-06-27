<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">

<head>
    <title>Raise Fund Now</title>
    <meta charset="UTF-8">
    <!---<title> Responsive Registration Form | CodingLab </title>--->
    <link href="https://drive.google.com/uc?export=view&amp;id=1-tX6yG-eh6hrelrroGZZt4_BBo5nHH_G" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
</head>

<body>
    <div class="container">
    <c:if test="${donee != null}">
                                    
                                    <div class="title">Edit Beneficiary</div>
                                </c:if>
                                <c:if test="${donee == null}">
                                    
                                    <div class="title">Raise Fund</div>
                                </c:if>
        
        <div class="content">
        	<c:if test="${donee != null}">
                            <form action="update" method="post" enctype="multipart/form-data">
                        </c:if>
                        <c:if test="${donee == null}">
                            <form action="insert" method="post" enctype="multipart/form-data">
                        </c:if>	

                <div class="user-details">
                <c:if test="${donee != null}">
                            <input type="hidden" name="id" value="<c:out value='${donee.id}' />" />
                        </c:if>
                    <div class="input-box">
                        <span class="details">Beneficiary Full Name</span>
                        <input type="text" 
                        name="doneeName"
                        placeholder="Enter Your Name" 
                        value="<c:out value='${donee.doneeName}' />"
                        required>
                    </div>
                    <div class="input-box">
                        <span class="details">Beneficiary Category</span>
                        <input type="text" 
                        placeholder="Enter Category" 
                        name="category" 
                        value="<c:out value='${donee.categoryValue}' />"
                        required>
                    </div>
                    <div class="input-box w-100">
                        <span class="details">Beneficiary Description</span>
                        <textarea 
                        name="subject" 
                        placeholder="Describe the cause" 
                        id="" 
                        rows="3">
                        <c:if test="${donee != null}">
                            <c:out value='${donee.subjectValue}' />
                        </c:if>
                        </textarea>
                    </div>
                    <div class="input-box w-100">
                        <span class="details">Target Amount</span>
                        <input 
                        type="text" 
                        placeholder="Enter Target Fund You Want To Generate"
                        name="targetAmount"
                        value="<c:out value='${donee.targetAmount}' />"
                        required>
                    </div>
                </div>
                
                <div class="photo-details">
                    
                    <div class="input-box">
                        <span class="details">Medical Proof Document Photo
                        </span>
                        <input type="file" placeholder="Enter your username"
                        name="causePhoto"
                        required>
                    </div>
                    <div class="input-box">
                        <span class="details">Beneficiary Cause Photo</span>
                        <input type="file" placeholder="Enter your username" 
                        name="medicalProofPhoto"
                        required>
                    </div>
                    <div class="input-box">
                        <span class="details">QR Code Photo</span>
                        <input type="file" placeholder="Enter your username" 
                        name="qrcodePhoto"
                        required>
                    </div>

                    <div class="button">
                        <input type="submit" value="Register">
                    </div>
                </div>
            </form>
        </div>
    </div>

</body>

</html>