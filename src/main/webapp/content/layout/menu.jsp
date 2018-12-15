<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="mainmenu-area">
	<div class="container">
		<div class="row">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><s:a action="" namespace="">Trang chủ</s:a></li>	
					<li><s:a action="products?id=1" namespace="">Sản phẩm</s:a></li>
					<li><s:a action="cart" namespace="">Giỏ hàng</s:a></li>
					</ul>

			</div>
		</div>
	</div>
</div>
<!-- End mainmenu area -->