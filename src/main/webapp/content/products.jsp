<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%--/.header --%>
<s:include value="layout/header.jsp" />
<%--/.menu --%>
<s:include value="layout/menu.jsp" />
<!-- main -->								
<div class="single-product-area">	
	<div class="container" >
	<div class="row" style="height: auto;width: auto;">		
			<s:iterator value="products">
					<div class="col-md-3 col-sm-6">				
					<div class="single-shop-product">
					
						<div class="product-upper" style="height: 245px;width: 195px;">
							<img src="uploads/<s:property value="%{images}" />" alt="">
						</div>
						<h2>
							<s:a action="detail?id=%{id}">
								<s:property value="%{name}" />
							</s:a>
						</h2>
						<div class="product-carousel-price">
							<ins style="color: red; font-weight: bold;">
							<s:property value="getText('{0,number,#,##0}',{price})"/> VNĐ
							</ins>
						</div>

						<div class="product-option-shop">
							<s:a class="add_to_cart_button" data-quantity="1"
								data-product_sku="" data-product_id="70" rel="nofollow"
								action="add?id=%{id}" namespace="/cart">Thêm vào giỏ hàng</s:a>
						</div>
					</div>
					
					
				</div>
			</s:iterator>			
		</div>
</div>
</div>
<!-- End main content area -->
<%--/.footer --%>
<s:include value="layout/footer.jsp" />