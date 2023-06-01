<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

.main-content {
	width: 1305px;
	height: auto;
	margin: 0px auto;
	display: flex;
	flex-wrap: wrap;
}

.btn-group1 {
	width: 280px;
	margin: 3px;
	display: inline-block;
}

.input-info {
	width: 1305px;
	height: 85px;
	margin: 0px auto;
	background-color: #F8F8F8;
  	justify-content: space-between;
  	border-radius: 10px;
}

.input-info label {
	width: 120px;
    border-radius: 5px;
    border: 1px solid #E8EBF0;
    padding: 10px;
    font-size: 14px;
    text-align: center;
    line-height: 30px;
    flex-shrink: 0;
    position: relative;
    margin-right: 4px;
    margin-left: 20px;
}

.input-info span {
	padding-bottom: 50px;
    font-size: 18px;
    text-align: center;
    margin-left: 20px;
}

.product-item-list {
	width: 650px;
	height: 300px;
	overflow: auto;
	border: 1px solid #ddd;
	
}

.side-bar {
	border: 1px solid #ddd;
	padding: 20px;
	float: left;
	height: 100vh;
}


#item-table table {
	width: 100%;
	border-collapse: collapse;
	border: 1px solid #ddd;
}

#item-table th, td {
	padding: 8px;
	text-align: center;
	border: 1px solid #ddd;
	white-space: nowrap;
}

#item-table th {
	background-color: #ddd;
	font-weight: bold;
}

#item-table tr:hover {
  	background-color: #f5f5f5;
}

#item-table input[type="checkbox"] {
 	margin: 0;
}	

.semi-product-item-list {
	width: 1305px;
	height: 360px;
	overflow: auto;
	border: 1px solid #ddd;
}

#item2-table table {
	width: 100%;
	border-collapse: collapse;
	border: 1px solid #ddd;
}

#item2-table th, td {
	padding: 8px;
	text-align: center;
	border: 1px solid #ddd;
	white-space: nowrap;
}

#item2-table th {
	background-color: #ddd;
	font-weight: bold;
}

#item2-table tr:hover {
  	background-color: #f5f5f5;
}

#item2-table input[type="checkbox"] {
 	margin: 0;
}


#item3-table table {
	width: 100%;
	border-collapse: collapse;
	border: 1px solid #ddd;
}

#item3-table th, td {
	padding: 8px;
	text-align: center;
	border: 1px solid #ddd;
	white-space: nowrap;
}

#item3-table th {
	background-color: #ddd;
	font-weight: bold;
}

#item3-table tr:hover {
  	background-color: #f5f5f5;
}

#item3-table input[type="checkbox"] {
 	margin: 0;
}


.bom-tree {
	width: 650px;
	height: 300px;
	overflow: auto;
	border: 1px solid #ddd;
}

/* 모달 창 */
.modal {
	display: none; /* 기본적으로 숨김 처리 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.5); /* 배경색과 투명도 조정 */
}

/* 모달 창 컨텐츠 */
.modal-content {
	background-color: #fefefe;
	margin: 10% auto;
	padding: 10px;
	border: 1px solid #888;
	max-width: 800px; /* 최대 너비 설정 */
	width: 80%;
	max-height: 500px;
	overflow: auto;
}

/* 모달 창 닫기 버튼 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover,
.close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

/* 리스트 아이템 */
#high-item-table td {
	cursor: pointer; /* 마우스 커서를 포인터로 변경 */
	padding: 5px;
}

#high-item-table td:hover {
	background-color: #f5f5f5; /* 호버 상태 배경색 변경 */
}

#high-item-table th {
	padding: 0 10px;
}

#low-item-table td {
	cursor: pointer; /* 마우스 커서를 포인터로 변경 */
	padding: 5px;
}

#low-item-table td:hover {
	background-color: #f5f5f5; /* 호버 상태 배경색 변경 */
}

#low-item-table th {
	padding: 0 10px;
}

@media (max-width: 480px) {
  /* 작은 화면에서 모달 창의 너비 조정 */
  .modal-content {
    width: 90%;
  }
}


</style>
<meta charset="UTF-8">
<title>품목 관리 정보</title>
</head>
<body>

	<div class="side-bar">
      <!-- product/ds -->
      <a href="/product/status/defect">불량현황</a><p>
      <!-- product/ps -->
      <a href="/product/status/production">생산현황 검색</a><p>
      <!-- product/pr -->
      <!-- product -->
      <a href="/product/is/item">품목별 재고 현황</a><p>
      <a href="/product/is/bom">BOM별 재고 현황</a><p>
      <a href="/product/is/wh">창고별 재고 현황</a><p>
      <a href="/product/is/wh/">창고별 재고 현황 상세</a><p>
      <a href="/item/search">제품 검색</a><p>
      <a href="/product/sim">입고</a><p>
      <a href="/wo">제품 생산 지시</a><p>
      
      <!-- sales -->
      <a href="/sales/analysis-of-materials">자제소요분석</a><p>
      <a href="/sales/receive-order">수주서 관리</a><p>
      <a href="/sales/order">구매</a><p>
      <a href="/sales/stock-in">구매입고등록</a><p>
      
      <!-- standard -->
      <a href="/standard/login">로그인</a><p>
      <a href="/standard/user-admin">사용자 계정관리</a><p>
      <a href="/standard/imi">품목 관리 및 등록</a><p>
      <a href="/standard/ipi">품목 단가 관리</a><p>
      <a href="/standard/pmi">품목 관리 정보</a><p>
      
      <!-- 로그아웃 -->
      <c:if test="${sessionScope.member != null}">
         <form action="/standard/logout" method="POST">
            <button type="submit">로그아웃</button>
         </form>
      </c:if>
   </div>
	
	
	<div class="input-info">
		<span>Bom 등록 정보</span>
		<br>
		<br>
		<label>*완제품 코드</label><input placeholder="더블 클릭 하여 선택" id="high-item-code" readonly>
		<label>*반제품/원자재 코드</label><input placeholder="더블 클릭 하여 선택" id="low-item-code" readonly>
		<label>*재료 수량</label><input id="material-quantity">
		
		<div class="btn-group1">
			<button id="bom-insert">BOM 등록</button>
			<button id="reset-btn">초기화</button>
		</div>
	</div>
		
		
	<div class="main-content">
		
		<div class="product-item-list">
			<span>완제품 목록</span>
			<table id="item-table">
				<tr>
					<th> </th>
					<th> </th>
					<th>제품코드</th>
					<th>품명</th>
					<th>구분</th>
				</tr>
			</table>
		</div>
		
		<div class="bom-tree">
			<span>Bom Tree</span>
			<button id="semi-product-delete">삭제</button>
			<table id="item3-table">
			  <thead>
			    <tr>
			      <th> </th>
			      <th> </th>
			      <th>완제품코드</th>
			      <th>재료코드</th>
			      <th>품명</th>
			      <th>소요량</th>
			      <th>구분</th>
			      <th>재고단위</th>
			    </tr>
			  </thead>
			  <tbody></tbody>
			</table>
		</div>
		
		<div class="semi-product-item-list">
			<span>반제품/원자재 목록</span>
			<table id="item2-table">
				<tr>
					<th> </th>
					<th> </th>
					<th>제품코드</th>
					<th>품명</th>
					<th>구분</th>
					<th>재고단위</th>
					<th>비고</th>
				</tr>
			</table>
		</div> 
	</div>	
	
	
	<!-- 완제품 모달 창 -->
	<div id="high-item-modal" class="modal">
	  	<div class="modal-content">
	    	<span class="close">&times;</span>
	    	<h2>완제품 선택</h2>
	    	<table id="high-item-table">
	      		<thead>
	        		<tr>
	          			<th>제품명</th>
				        <th>제품코드</th>
				        <th>제품구분</th>
				        <th>메모</th>
	        		</tr>
	      		</thead>
	      		<tbody id="high-item-list"></tbody>
	    	</table>
	  </div>
	</div>
	
	
	<!-- 반제품/원자재 모달 창 -->
	<div id="low-item-modal" class="modal">
	  	<div class="modal-content">
	    	<span class="close">&times;</span>
	    	<h2>반제품/원자재 선택</h2>
	    	<table id="low-item-table">
	      		<thead>
	        		<tr>
	          			<th>제품명</th>
				        <th>제품코드</th>
				        <th>제품구분</th>
				        <th>메모</th>
	        		</tr>
	      		</thead>
	      		<tbody id="low-item-list"></tbody>
	    	</table>
	  </div>
	</div>

		
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	
	$(document).ready(function () {
		productItemList();
		semiProductItemList();
	});

	// 완제품 모달 창 
	$(document).on('dblclick', '#high-item-code', function() {
	  	$('#high-item-modal').show();
	  	
	  	$.ajax({
	  		url : '/standard/pmi/product/items',
	  		type : 'GET',
	  		dataType : 'json',
	  		success : function(productItemList) {
	  			let tbody = $('#high-item-list');
	  	      	tbody.empty();

				for (var i = 0; i < productItemList.length; i++) {
					let item = productItemList[i];
					let row = '<tr>' +
				  	'<td>' + item.itemName + '</td>' +
				  	'<td>' + item.itemCode + '</td>' +
				  	'<td>' + item.itemType + '</td>' +
				  	'<td>' + item.memo + '</td>' +
				  	'</tr>';
					tbody.append(row);
				}
				// 테이블 행 클릭 시 데이터 설정 및 모달 숨김
				$('#high-item-table tbody tr').on('click', function() {
				  	let selectedRow = $(this);
				  	let itemCode = selectedRow.find('td:eq(1)').text();
				  	$('#high-item-code').val(itemCode);
				  	$('#high-item-modal').hide();
				});
	  		},
	  		error: function(xhr, status, error) {
			      console.log('Error:', error);
			}
	  	});
	});
	
	// 모달 창 닫기
	$(document).on('click', '#high-item-modal .close', function() {
	  	$('#high-item-modal').hide();
	});

	
	
	// 반제품/원자재 모달 창 
	$(document).on('dblclick', '#low-item-code', function() {
	  	$('#low-item-modal').show();
	  	
	  	$.ajax({
	  		url : '/standard/pmi/product/semi-items',
	  		type : 'GET',
	  		dataType : 'json',
	  		success : function(semiProductItemList) {
	  			let tbody = $('#low-item-list');
	  	      	tbody.empty();

				for (var i = 0; i < semiProductItemList.length; i++) {
					let item = semiProductItemList[i];
					let row = '<tr>' +
				  	'<td>' + item.itemName + '</td>' +
				  	'<td>' + item.itemCode + '</td>' +
				  	'<td>' + item.itemType + '</td>' +
				  	'<td>' + item.memo + '</td>' +
				  	'</tr>';
					tbody.append(row);
				}
				// 테이블 행 클릭 시 데이터 설정 및 모달 숨김
				$('#low-item-table tbody tr').on('click', function() {
				  	let selectedRow = $(this);
				  	let itemCode = selectedRow.find('td:eq(1)').text();
				  	$('#low-item-code').val(itemCode);
				  	$('#low-item-modal').hide();
				});
	  		},
	  		error: function(xhr, status, error) {
			      console.log('Error:', error);
			}
	  	});
	});
	
	// 모달 창 닫기
	$(document).on('click', '#low-item-modal .close', function() {
	  	$('#low-item-modal').hide();
	});
	
	
	// 완제품 리스트
	function productItemList() {
		$.ajax({
		    url : '/standard/pmi/product/items',
		    type : 'GET',
		    dataType : 'json',
		    success : function(productItemList) {
		      let table = $('#item-table');
	
		      for (var i = 0; i < productItemList.length; i++) {
			      let item = productItemList[i];
			      let row = '<tr>' +
			      '<td>' + (i + 1) + '</td>' +
		          '<td><input type="radio" name="item-radio"></td>' +
		          '<td>' + item.itemCode + '</td>' +
		          '<td>' + item.itemName + '</td>' +
		          '<td>' + item.itemType + '</td>' +
		          '</tr>';
		      	  table.append(row);
		      }
		    },
		    error: function(xhr, status, error) {
		      console.log('Error:', error);
		    }
		});
	}
	
	// 완제품 리스트의 클릭 이벤트
	$(document).on('click', '#item-table tr', function () {
	    let radioInput = $(this).find('td:eq(1) input[type="radio"]');
	    radioInput.prop('checked', true);
	    let selectedRow = $(this);
	    let itemCode = selectedRow.find('td:eq(2)').text();
	    $('#high-item-code').val(itemCode);
	});
	
	
	// 반제품 리스트
	function semiProductItemList() {
		$.ajax({
		    url : '/standard/pmi/product/semi-items',
		    type : 'GET',
		    dataType : 'json',
		    success : function(semiProductItemList) {
		      let table = $('#item2-table');
	
		      for (var i = 0; i < semiProductItemList.length; i++) {
			      let item = semiProductItemList[i];
			      let row = '<tr>' +
			      '<td>' + (i + 1) + '</td>' +
		          '<td><input type="radio" name="item-radio"></td>' +
		          '<td>' + item.itemCode + '</td>' +
		          '<td>' + item.itemName + '</td>' +
		          '<td>' + item.itemType + '</td>' +
		          '<td>' + item.stockUnit + '</td>' +
		          '<td>' + item.memo + '</td>' +
		          '</tr>';
		      	  table.append(row);
		      }
		    },
		    error: function(xhr, status, error) {
		      console.log('Error:', error);
		    }
		});
	}
	
	// 반제품 리스트의 클릭 이벤트
	$(document).on('click', '#item2-table tr', function () {
	    let radioInput = $(this).find('td:eq(1) input[type="radio"]');
	    radioInput.prop('checked', true);
	    let selectedRow = $(this);
	    let itemCode = selectedRow.find('td:eq(2)').text();
	    $('#low-item-code').val(itemCode);
	});
	
	
	// Bom 리스트 이벤트
	$(document).on('click', '#item-table tr', function(event) {
		if (event.target.type !== 'radio') {
			$(this).find('input[type="radio"]').prop('checked', true);
		}
		let selectedRow = $(this);
		let itemCode = selectedRow.find('td:eq(2)').text();
		console.log(itemCode);
		bomList();
		
	});
	
	
	$(document).on('click', '#item3-table tr', function () {
	    let radioInput = $(this).find('td:eq(1) input[type="radio"]');
	    radioInput.prop('checked', true);
	    let selectedRow = $(this);
	    let itemCode = selectedRow.find('td:eq(3)').text();
	    $('#low-item-code').val(itemCode);
	}); 
	
	// Bom Tree 리스트
	function bomList(paramItemCode) {
		let itemCode = $('#item-table tr input[type="radio"]:checked').closest('tr').find('td:eq(2)').text();
		if (paramItemCode === undefined){
			itemCode = itemCode;
		} else {
			itemCode = paramItemCode;
		}
		console.log('bomList -> ' + itemCode);
		console.log('paramItemCodeBomList -> ' + paramItemCode);
		
		$.ajax({
		    url: '/standard/pmi/bom-list/' + itemCode,
		    type: 'GET',
		    dataType: 'json',
		    success: function(bomList) {
		      	let table = $('#item3-table');
		      	let tbody = table.find('tbody');
				if (!tbody.length) {
				  	tbody = $('<tbody></tbody>');
				  	table.append(tbody);
				}
		      	tbody.empty();
		      	for (var i = 0; i < bomList.length; i++) {
		        	let bom = bomList[i];
		        	let row = '<tr>' +
		          	'<td>' + (i + 1) + '</td>' +
		          	'<td><input type="radio" name="item-radio"></td>' +
		          	'<td>' + bom.highItemCode + '</td>' +
		          	'<td>' + bom.lowItemCode + '</td>' +
		          	'<td>' + bom.itemName + '</td>' +
		          	'<td>' + bom.materialQuantity + '</td>' +
		          	'<td>' + bom.itemType + '</td>' +
		          	'<td>' + bom.stockUnit + '</td>' +
		          	'</tr>';
		        	tbody.append(row);
		      	}
		    },
		    error: function(xhr, status, error) {
		      	console.log('Error:', error);
		    }
		});
	}
	
	
	// 초기화 버튼
	$(document).on('click', '#reset-btn', function(){
		$('#high-item-code').val('').attr('placeholder', '더블 클릭 하여 선택').prop('readonly', true);
		$('#low-item-code').val('').attr('placeholder', '더블 클릭 하여 선택').prop('readonly', true);
		$('#material-quantity').val('');
	});
	
	
	// Bom 등록
	$(document).on('click', '#bom-insert', function(){
		if  ($('#high-item-code').val() === "" || $('#low-item-code').val() === "" || $('#material-quantity').val() === "") {
			alert("필수 정보를 입력해주세요.");
		} else {
			$.ajax({
				url : '/standard/pmi/bom',
				type : 'POST',
				dataType : 'json',
				contentType : 'application/json',
				data : JSON.stringify({
					highItemCode		: $('#high-item-code').val(),
					lowItemCode 		: $('#low-item-code').val(),
					materialQuantity	: $('#material-quantity').val()
				}),
				success : function(bomInsert){
					if(bomInsert == 1){
						alert("Bom 등록 완료.");
						bomList($('#high-item-code').val());
					} else if (bomInsert == -1){
						alert("중복 등록은 불가 합니다.");
					} else {
						alert("Bom 등록 실패.");
					}
				},
				error: function(xhr, status, error) {
				      console.log('Error:', error);
				}
			});
		}
	});
	
	
	// 반제품/원자재 삭제 버튼
	$(document).on('click', '#semi-product-delete', function(){
		let highItemCode = $('#high-item-code').val();
		let lowItemCode = $('#low-item-code').val();
		console.log(highItemCode);
		console.log(lowItemCode);
		
		if (highItemCode === '' || lowItemCode === ''){
			alert("삭제 할 반제품/원자재를 선택해주세요.");
		} else {
			$.ajax({
				url : '/standard/pmi/bom',
				type : 'DELETE',
				dataType : 'json',
				contentType : 'application/json',
				data : JSON.stringify({
					highItemCode : highItemCode,
					lowItemCode : lowItemCode
				}),
				success : function(bomDelete){
					if(bomDelete == 1){
						alert("삭제가 완료되었습니다.");
						bomList(highItemCode);
					} else {
						alert("삭제 중 문제가 발생 했습니다.다음에 다시 시도해주세요.");
					}
				},
				error: function(xhr, status, error) {
				      console.log('Error:', error);
				}
			});
		}
	});
	 
	
	


</script>
</html>