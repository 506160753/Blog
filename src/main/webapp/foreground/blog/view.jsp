<script type="text/javascript" src="${pageContext.request.contextPath}/static/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css">
<script type="text/javascript">
    SyntaxHighlighter.all();
</script>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=1&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
<script type="text/javascript">
	
	function loadimage(){
		document.getElementById("randImage").src="${pageContext.request.contextPath}/image.jsp?"+Math.random();
	}
	function submitData(){
		var content=$("#content").val();
		var imageCode=$("#imageCode").val();
		if(${user.id ==null}){
			openModal();
		}else if(content==null || content==''){
			alert("请输入评论内容！");
		}else if(imageCode==null || imageCode==''){
			alert("请填写验证码！");
		}else{
			$.post("${pageContext.request.contextPath}/comment/save.do",{'content':content,'imageCode':imageCode,'blog.id':'${blog.id}','user.id':'${user.id}' },function(result){
				if(result.success){
					window.location.reload();
				//	alert("评论已提交成功，审核通过后显示！");
				}else{
					alert(result.errorInfo);
				}
			},"json");
		}
	}
	
	function showOtherComment(){
		$('.otherComment').show();
	}
	
	function Submit(type){
		alert("ASd");
		if(type == 1){
			var userName = $("#userNameL").val();
			var password = $("#passwordL").val();
			if(userName == null || userName == ''){
				alert("请输入账号！");
			}else if(password == null || password == ''){
				alert("请输入密码！");
			}else{
				$.post("${pageContext.request.contextPath}/user/login.do",{'userName':userName,'password':password },function(result){
					if(result.success){
						window.location.reload();
					}else{
						alert(result.errorInfo);
					}
				},"json");
			}
		}
		if(type == 2){
			var userName = $("#userNameR").val();
			var password = $("#passwordR").val();
			var nickName = $("#nickNameR").val();
			var confirmPassword = $("#confirmPassword").val();
			if(userName == null || userName == ''){
				alert("请输入账号！");
			}else if(nickName == null || nickName == ''){
				alert("请输入昵称！");
			}else if(password == null || password == ''){
				alert("请输入密码！");
			}else if(confirmPassword == null || confirmPassword == '' || confirmPassword != password){
				alert("两侧密码不一致,请确认密码！");
			}else{
				$.post("${pageContext.request.contextPath}/user/save.do",{'userName':userName,'nickName':nickName,'password':password },function(result){
					if(result.success){
						window.location.reload();
					//	alert("用户注册成功,已自动登陆");
					}else{
						alert(result.errorInfo);
					}
				},"json");
			}
		}
		if(type == 3){
			var nickName = $("#nickName").val();
			if(nickName == null || nickName == ''){
				alert("请输入新的昵称！");
			}else{
				$.post("${pageContext.request.contextPath}/user/save.do",{'id':'${user.id}','nickName':nickName},function(result){
					if(result.success){
						window.location.reload();
					}else{
						alert(result.errorInfo);
					}
				},"json");
			}
		}
		if(type == 4){
			var oldPassWord = $("#oldPassWord").val();
			var newPassWord = $("#newPassWord").val();
			if(oldPassWord == null || oldPassWord == ''){
				alert("请输入原密码！");
			}else if(newPassWord == null || newPassWord == ''){
				alert("请输入新密码！");
			}else{
				$.post("${pageContext.request.contextPath}/user/save.do",{'id':'${user.id}','userName':'${user.userName}','password':oldPassWord,'newPassWord':newPassWord},function(result){
					if(result.success){
						window.location.reload();
					}else{
						alert(result.errorInfo);
					}
				},"json");
			}
		}
	}

	function clickContent(){
		if(${user.id ==null}){
			openModal();
		}	
	}
	function openModal(){
		$("#myModal").modal("show");
	}
	
	function loginOut(){
		$.post("${pageContext.request.contextPath}/user/loginOut.do","json");
		window.location.reload();
	}
</script>
<div class="data_list">
	<div class="data_list_title">
		<img src="${pageContext.request.contextPath}/static/images/blog_show_icon.png"/>
		博客信息
	</div>
	<div>
	   <div class="blog_title"><h3><strong>${blog.title }</strong></h3></div>
	   <div style="padding-left: 330px;padding-bottom: 20px;padding-top: 10px">
		<div class="bshare-custom"><a title="分享到QQ空间" class="bshare-qzone"></a><a title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到人人网" class="bshare-renren"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a><a title="分享到网易微博" class="bshare-neteasemb"></a><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a><span class="BSHARE_COUNT bshare-share-count">0</span></div>
	   </div>
		<div class="blog_info">
			发布时间：『 <fmt:formatDate value="${blog.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm"/>』&nbsp;&nbsp;博客类别：${blog.blogType.typeName}&nbsp;&nbsp;阅读(${blog.clickHit}) 评论(${blog.replyHit})
		</div>
		<div class="blog_content">
			${blog.content }
		</div>
		<div class="blog_keyWord">
			<font><strong>关键字：</strong></font>
			<c:choose>
				<c:when test="${keyWords==null}">
					&nbsp;&nbsp;无
				</c:when>
				<c:otherwise>
					<c:forEach var="keyWord" items="${keyWords }">
						&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/blog/q.html?q=${keyWord}" target="_blank">${keyWord }</a>&nbsp;&nbsp;
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="blog_lastAndNextPage">
			${pageCode }
		</div>
	</div>
</div>
<div class="data_list">
	<div class="data_list_title">
		<img src="${pageContext.request.contextPath}/static/images/comment_icon.png"/>
		评论信息    
		<c:if test="${size>10}">
			<a href="javascript:showOtherComment()" style="float: right;padding-right: 40px;">显示所有评论</a>
		</c:if>
	</div>
	<div class="commentDatas">
		<c:choose>
			<c:when test="${size==0}">
				暂无评论
			</c:when>
			<c:otherwise>
				<c:forEach var="comment" items="${commentList }" varStatus="status">
						<c:choose>
							<c:when test="${status.index<10 }">
								<div class="comment">
									<span><font>${status.index+1 }楼&nbsp;&nbsp;&nbsp;&nbsp;${comment.user.nickName }：</font>${comment.content }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<fmt:formatDate value="${comment.commentDate }" type="date" pattern="yyyy-MM-dd HH:mm"/>&nbsp;]</span>
								</div>								
							</c:when>
							<c:otherwise>
								<div class="otherComment">
									<div class="comment">
										<span><font>${status.index+1 }楼&nbsp;&nbsp;&nbsp;&nbsp;${comment.user.nickName }：</font>${comment.content }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<fmt:formatDate value="${comment.commentDate }" type="date" pattern="yyyy-MM-dd HH:mm"/>&nbsp;]</span>
									</div>		
								</div>						
							</c:otherwise>
						</c:choose>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<div class="data_list" >
	<div class="data_list_title">
		<img src="${pageContext.request.contextPath}/static/images/publish_comment_icon.png"/>
		发表评论&nbsp;&nbsp;
		<c:choose>
			<c:when test="${user == null}">
				<jsp:include page="/foreground/include/loginAndRegister.jsp"/>
				<a href="javascript:void(0);" data-toggle="modal" data-target="#myModal" data-keyboard="true">[请登录后评论]</a>
			</c:when>
			<c:otherwise>
				<jsp:include page="/foreground/include/modifyUser.jsp"/>
					欢迎&nbsp;<a href="javascript:void(0);" data-toggle="modal" data-target="#myModalUpdate" data-keyboard="true">
					${user.nickName }
				</a>&nbsp;参与评论&nbsp;<a href="javascript:loginOut();" style="color:gray;font-size:12px">[注销]</a>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="publish_comment">
			<div>
				<textarea onclick="clickContent();" style="width: 100%" rows="3" id="content" name="content" placeholder="来说两句吧..."></textarea>
			</div>
			<div class="verCode">
				验证码：<input type="text" value="${imageCode }" name="imageCode"  id="imageCode" size="10" onkeydown= "if(event.keyCode==13)form1.submit()"/>&nbsp;<img onclick="javascript:loadimage();"  title="换一张试试" name="randImage" id="randImage" src="${pageContext.request.contextPath}/image.jsp" width="60" height="20" border="1" align="absmiddle"> 
			</div>
			<div class="publishButton">
				<button class="btn btn-primary" type="button" onclick="submitData()">发表评论</button>
			</div>
		</form>
	</div>
</div>

