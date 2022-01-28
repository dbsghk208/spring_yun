<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylecheet" type="text/css" href="/pracPro2/css/pracShop.css">
<form id="shoppingForm" name="shoppingForm">
	<h1>쇼핑</h1>
	
	<!-- Menubar div -->
		<div class="Menubar">
			<a href="/pracPro2/"><img src="/pracPro2/image/icon_home.png" alt="홈"></a>
			<a href="/pracPro2/shopping">shopping</a>
		</div>
		
		<div id="shoppingMenu">
		
			<div id="shoppingMenuSubject">쇼핑</div>
			
			<ul>
				<li>
					<span id="menu2"><a href="/pracPro2/shopping/pracBeanNTea"> 원두 / 차 </a></span>
					<a href="#">원두</a>
					<a href="#">차</a>
				</li>
				
				<li>
					<span id="menu2" style="padding-right: 42px;"><a href="/pracPro2/shopping/product">상품</a>
					<a href="/pracPro2/shopping/mugList"> 머그 </a>
					<a href="/pracPro2/shopping/glassList"> 글라스 </a>
					<a href="/pracPro2/shopping/plasticTumblrList"> 플라스틱 텀블러 </a>
					<a href="/pracPro2/shopping/stainlessTumblrList"> 스테인리스 텀블러 </a>
					<a href="/pracPro2/shopping/thermosList"> 보온병 </a>
					<a href="/pracPro2/shopping/coffeeEtcList"> 커피용품 </a>		
				</li>			
			</ul>
		</div> <!-- shoppingMenu -->
		
		<div id="beanNTeaMenuDiv"></div>
		<div id="menuImgDiv1">
			<!-- menuImgDiv1 에이작스 -->
		</div>
		<br><br><br>
		
		
		<div id="productMenuDiv">상품</div>
		<div id="menuImgDiv2">
			<!-- menuImgDiv2 에이작스 -->
		</div>
		<br><br><br>
	
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	//menuImgDiv1 에이작스
	$.ajax({
		url: '/pracPro2/shopping/getShoppingList',
		type: 'post',
		dataType: 'json',
		success: function(data) {
			alert(JSON.stringify(data));
			
			$.each(data, function(index,items){
				$('<div>').append($('<div>', {
					width: '70%',
					height: '300px',
					style: 'margin: 10px; cursor:pointer; overflow:hidden',
					position: 'relative'
					
				}).append($('<img>', {
					src="/pracPro2/productImage/"+items.productImageName,
					position: 'absolute',
					width: '100%',
					height: '100%',
					id: 'imgClick'+items.productCode,
					class: 'imgClick'
				
				})).append($('<input>', {
					type:'hidden',
					id:'productCode',
					value:items.productCode
				
				}))) // 첫 div 태그 안에 img태그와 input 태그가 있음
				.append($('<div>', {
					width: '50%',
					align: 'center',
					style: 'padding-bottom: 10px; margin: 5px; color:black; border-bottom:1px solid gainsboro; font-size: 15px;', 
					text:items.producName
				}))
				.append($('<div>', {
					width: '50%',
					align: 'center',
					style: 'margin: 5px; color: #555555; font-size: 15px; font-weight: bold;',
					text:  items.productUnit.toLocaleString()+ " 원"
					
				}))
				
				.appendTo($('#menuImgDiv1')); //menuImgDiv1 에 붙여달라.
				
				$('#imgClick'+items.productCode).click(function(){
					location.href="/pracPro2/shopping/shoppingDetail?productCode="+items.productCode
					
				}); // imgClick 클릭이벤트
				
			});//each
		},
		error: function(err) { 
			console.log(err);
		}
		
	}); //menuImgDiv1 에이작스
	
	$.ajax({
		url:'/pracPro2/shopping/getShoppingList2',
		type:'post',
		dataType: 'json',
		success: function(data) {
			alert(JSON.stringify(data));
			
			$.each(data, function(index,items){
				$('<div>').append($('<div>',{
					width:'70%',
					height: '300px',
					style: 'margin:10px; cursor:pointer; overflow:hidden',
					position: 'relative'
				
				}).append($('<img>', {
					src: "/pracPro2/productImage/"+items.productImageName,
					position: 'absolute',
					width: '100%',
					height: '100%',
					id: 'imgClick'+items.productCode,
					class: 'imgClick'
					
				})).append($('<input>', {
					type:'hidden',
					id:'productCode',
					value:items.productCode
								
				})))
				.append($('<div>', {
					width: '50%',
					align:'center',
					style: 'padding-bottom:10px; margin:5px; color:black; border-bottom: 1px solid gainsboro; font-size:15px;',
					text: items.productName
				}))
				.append($('<div>', {
					width: '50%',
					align: 'center',
					style: 'margin:5px; color:#555555; font-size:15px; font-weight:bold;',
					text:items.productUnit.toLocalString()+ " 원"
					
				}))
				.appendTo($('#menuImgDiv2')); //menuImgDiv2 에 붙여달라.
				
				$('.imgClick'+items.productCode).click(function(){
					$.ajax({
						url: '/pracPro2/shopping/clickImg',
						type: 'post',
						data:'productCode='+items.productCode,
						dataType: 'text',
						success: function(data) {
							alert("성공");
							location.href="/pracPro2/shopping/shoppingDetail?productCode="+items.productCode
						},
						error:function(err) {
							console.log(err);
						}
						
					});//ajax
					
				});//.imgClick 클릭이벤트
				
			}); //each문
		
		},//success
		
		error : function(err) {
			console.log(err);
		}
		
	});// menuImgDiv2 에이작스
	
	
}); //function


</script>







