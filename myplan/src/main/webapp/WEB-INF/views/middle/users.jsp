
<html>
<head>

<!-- <link rel="stylesheet" type="text/css" href="resources/css/build.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap-colorselector.css" /> -->
<link rel="stylesheet" type="text/css" href="resources/css/profile.css"/>

<script src="resources/js/profile.js"></script>
<!-- <script src="resources/js/other/jquery-1.11.0.min.js"></script>
<script src="resources/js/other/strap.js"></script>
<script src="resources/js/other/bootstrap-checkbox.min.js"></script> -->



<script>

$(function () {
  $('#emailPasswordDiv').hide();
  $('#generalDiv').show();
  $('#general').click(function(){
	  $('#emailPasswordDiv').hide();
	  $('#generalDiv').show();
	  $('#general').parent("li").addClass('active');
	  $('#emailPassword').parent("li").removeClass('active');
  });
  $('#emailPassword').click(function(){
	  $('#emailPasswordDiv').show();
	  $('#generalDiv').hide();
	  $('#general').parent("li").removeClass('active');
	  $('#emailPassword').parent("li").addClass('active');
  });
});
</script>

</head>
<body>

<!-- <aside class="mainMenu">
    <div class="logo"></div>
    <ul class="menuItems">
      <li><a class="dashboard" title="Dashboard" data-toggle="tooltip" data-placement="right"></a></li>
      <li><a class="calendar" title="Calendar" data-toggle="tooltip" data-placement="right"></a></li>
      <li><a class="reports" title="Reports" data-toggle="tooltip" data-placement="right"></a></li>
      <li><a class="terms" title="Terms" data-toggle="tooltip" data-placement="right"></a></li>
      <li><a class="help" title="Help" data-toggle="tooltip" data-placement="right"></a></li>
      <li class="userLi"> <a class="user" title="Profile" data-toggle="tooltip" data-placement="right"><img src="images/user.jpg"></a> <a class="userName">John</a> </li>
    </ul>
  </aside>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="slide-nav">
  <div class="container">
    <div class="navbar-header"> <a class="navbar-toggle"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a> <a class="navbar-brand" href="#">Study Pro</a> </div>
    <div id="slidemenu">
      <div class="logo"></div>
      <ul class="menuItems">
        <li><a class="dashboard" title="Dashboard" data-toggle="tooltip" data-placement="right"></a></li>
        <li><a class="calendar" title="Calendar" data-toggle="tooltip" data-placement="right"></a></li>
        <li><a class="reports" title="Reports" data-toggle="tooltip" data-placement="right"></a></li>
        <li><a class="terms" title="Terms" data-toggle="tooltip" data-placement="right"></a></li>
        <li><a class="help" title="Help" data-toggle="tooltip" data-placement="right"></a></li>
        <li class="userLi"> <a class="user" title="Profile" data-toggle="tooltip" data-placement="right"><img src="images/user.jpg"></a> <a class="userName">John</a> </li>
      </ul>
    </div>
  </div>
</div> -->
<div class="outer" id="page-content">
  <section class="col-md-11 padding0">
    <div class="wellMain">
      <h1>Settings</h1>
    </div>
    <div class="col-md-12">  
  	<!--Left Side Panel Start -->
    <div class="col-md-3 centerMargin">  
      <ul class="nav nav-pills nav-stacked sidePanelLft">
        <li role="presentation" class="active"><a id="general">General</a></li>
        <li role="presentation"><a id="emailPassword">Password</a></li>
      </ul>
    </div>
  	<!--Left Side Panel End -->
    
    <!--Right Side Panel Start General-->
    <div class="col-md-7" id="generalDiv">  
      <div class="panel panel-default sidePanelRight">
        <div class="panel-heading">
          <h3 class="panel-title">General</h3>
        </div>
        <div class="panel-body">
        <form id="updateProfileForm">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><label>Profile Picture</label></td>
              <td><img class="userImg" src="resources/images/user.jpg" width="32" height="32" alt="Profile Pic">
                  <a class="btn btn-primary uploadBtn" href="javascript:;">Change<input type="file" id="imageSave" style='position:absolute;z-index:2;top:0;left:0;filter: alpha(opacity=0);-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";cursor: pointer; width: 80px;opacity:0;background-color:transparent;color:transparent;' name="file_source" size="40"  onchange='$("#upload-file-info").html($(this).val());'></a>&nbsp;<span class='label label-info' id="upload-file-info"></span>
              </td>
            </tr>
            <tr>
              <td><label for="firstName">First Name</label></td>
              <td><input type="text" placeholder="first name..." required id="firstName" name="firstName" class="col-lg-7"></td>
            </tr>
            <tr>
              <td><label for="lastName">Last Name</label></td>
              <td><input type="text" placeholder="last name..." required id="lastName" name="lastName" class="col-lg-7"></td>
            </tr>
            <tr>
              <td><label for="gender">Gender</label></td>
              <td><select name="gender" id="gender" class="col-lg-7">
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                  </select></td>
            </tr>
            <tr>
              <td><label title="birthDate">Date of Birth</label></td>
              <td><input type="text" id="date" placeholder="date" required class="col-lg-2"><span>/</span><input type="text" id="month" placeholder="month" required class="col-lg-2"><span>/</span><input type="text" id="year" placeholder="year" required class="col-lg-2"></td>
            </tr>
            <tr>
              <td><label for="country">Country</label></td>
              <td><select name="country" id="country" class="col-lg-7">
                    <option>Select</option>
                    <option value="sl">Sri Lanka</option>
                  </select></td>
            </tr>
            <tr>
              <td><label for="newsletter">Newsletter</label></td>
              <td><div class="squaredThree">
                <input type="checkbox" value="None" name="newsletter" id="newsletter">
                <label class="mrginLft2" for="newsletter"></label>
              </div>
              <label class="labelChck1">Don't send me any newsletter via mail</label>
              </td>
            </tr>
            <tr>
              <td><label title="deleteAcc">Delete Account</label></td>
              <td><label class="deleteAccTxt paddingL0" data-dismiss="modal" data-toggle="modal" data-target="#deleteAcc">Permanently delete my account</label></td>
            </tr>
             <tr>
              <td colspan="2">&nbsp;</td>
            </tr>
             <tr>
              <td colspan="2"><button id="profileUpdateBtn" class="btn btn-primary col-lg-12" type="button">Save</button></td>
            </tr>
          </table>
        </form>
        </div>
      </div>
    </div>
  	<!--Right Side Panel End General-->
    
    <!--Right Side Panel Start Email Password -->
    <div class="col-md-7" id="emailPasswordDiv">  
      <div class="panel panel-default sidePanelRight">
        <div class="panel-heading">
          <h3 class="panel-title">Password</h3>
        </div>
        <div class="panel-body">
        <form>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td colspan="2">To change your password; enter your current password, new password (conforming to the requirements below) and your new password again to ensure it was entered correctly.</td>
            </tr>
            <tr>
              <td colspan="2">&nbsp;</td>
            </tr>
             <tr>
              <td><label for="email">Email</label></td>
              <td><input type="text" required id="email" name="email" class="col-lg-10" disabled></td>
            </tr> 
            <tr>
              <td><label for="currentPassword">Current Password</label></td>
              <td><input type="password" required id="currentPassword" name="currPassword" disabled class="col-lg-10"></td>
            </tr>
            <tr>
              <td><label for="newPassword">New Password</label></td>
              <td><input type="password"  id="newPassword" name="newPassword" class="col-lg-10"></td>
            </tr>
            <tr>
              <td><label for="confNewPassword">Confirm New Password</label></td>
              <td><input type="password"  id="confNewPassword" name="confNewPassword" class="col-lg-10"></td>
            </tr>
            <tr>
              <td colspan="2">&nbsp;</td>
            </tr>
             <tr>
              <td colspan="2"><button id="passwordUpdateBtn" class="btn btn-primary col-lg-12" type="button">Save</button></td>
            </tr>
          </table>
        </form>
        </div>
      </div>
    </div>
  	<!--Right Side Panel End Email Password-->
    </div>  
  </section>
  
  <!-- Delete Account Popup Start -->
  <div class="modal fade" id="deleteAcc" role="dialog">
    <div class="modal-dialog deleteAccDiv"> 
      
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Delete Your Account?</h4>
        </div>
        <div class="modal-body">
         <div class="col-lg-12 padding0">
            <p>Your account will be permanently deleted and all of your data will be permanently  erased.</p>
          </div>
          <div class="col-lg-12 padding0">
             <label for="confNewPassword">Enter your password to confirm your identity</label>
             <input type="password" required id="confPasswordDel" name="confPasswordDel" class="col-lg-12">
          </div>
        <div class="col-lg-12 padding0 mrgnTop20">
          <div class="squaredThree">
            <input type="checkbox" value="None" class="hideCheckbox" name="confirm" id="confirm">
            <label class="mrginLft2" for="confirm"></label>
          </div>
          <label class="labelChck1">I'm 100% sure I wish to delete my account</label>
        </div>
       </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" data-toggle="modal">Cancel</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal" data-toggle="modal">Delete My Account</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Delete Account Popup End -->
  
  <footer> </footer>
</div>


</body>
</html>