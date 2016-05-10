<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal fade" id="myModal" role="dialog" aria-labelledby="gridSystemModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">欢迎您的到来</h4>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
          <div class="row">
              <ul class="nav nav-tabs" role="tablist">
			    <li role="presentation" class="active"><a href="#login" aria-controls="login" role="tab" data-toggle="tab">登陆</a></li>
			    <li role="presentation"><a href="#register" aria-controls="register" role="tab" data-toggle="tab">注册</a></li>
			  </ul>
			  <div class="tab-content">
			    <div role="tabpanel" class="tab-pane face in active" id="login">
			    	<div class="modal-body">
				        <form id="login" method="post">
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">账号:</label>
				            <input type="text" class="form-control" id="userNameL">
				          </div>
				          <div class="form-group">
				            <label for="message-text" class="control-label">密码:</label>
				            <input type="password" class="form-control" id="passwordL">
				          </div>
				        </form>
				        <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary" onclick="Submit(1)">确认登陆</button>
					    </div>
				    </div>
			    </div>
			    <div role="tabpanel" class="tab-pane face" id="register">
			    	<div class="modal-body">
				        <form id="register" method="post">
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">账号:</label>
				            <input type="text" class="form-control" id="userNameR">
				          </div>
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">昵称:</label>
				            <input type="text" class="form-control" id="nickNameR">
				          </div>
				          <div class="form-group">
				            <label for="message-text" class="control-label">密码:</label>
				            <input type="password" class="form-control" id="passwordR">
				          </div>
				          <div class="form-group">
				            <label for="message-text" class="control-label">确认密码:</label>
				            <input type="password" class="form-control" id="confirmPassword">
				          </div>
				        </form>
				        <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary" onclick="Submit(2)">确认注册</button>
					    </div>
				    </div>
			    </div>
			  </div>
          </div>
        </div>
      </div>
      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->