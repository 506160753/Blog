<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal fade" id="myModalUpdate" role="dialog" aria-labelledby="gridSystemModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">个人信息管理</h4>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
          <div class="row">
              <ul class="nav nav-tabs" role="tablist">
			    <li role="presentation" class="active"><a href="#login" aria-controls="login" role="tab" data-toggle="tab">修改昵称</a></li>
			    <li role="presentation"><a href="#register" aria-controls="register" role="tab" data-toggle="tab">修改密码</a></li>
			  </ul>
			  <div class="tab-content">
			    <div role="tabpanel" class="tab-pane face in active" id="login">
			    	<div class="modal-body">
				        <form id="nickNameUpdate" method="post">
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">新的昵称:</label>
				            <input type="text" class="form-control" id="nickName">
				          </div>
				        </form>
				        <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary" onclick="Submit(3)">确认修改</button>
					    </div>
				    </div>
			    </div>
			    <div role="tabpanel" class="tab-pane face" id="register">
			    	<div class="modal-body">
				        <form id="passWordUpdate" method="post">
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">原密码:</label>
				            <input type="text" class="form-control" id="oldPassWord">
				          </div>
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">新密码:</label>
				            <input type="text" class="form-control" id="newPassWord">
				          </div>
				        </form>
				        <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary" onclick="Submit(4)">确认修改</button>
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