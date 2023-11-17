<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header 시작 -->
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<section id="pay" class="container wrap">
	
	<div id="sub-bnr"><h5>日本語単語</h5></div>
	
	
	<div class="row mt-1 justify-content-between hello">
		<div class="col-8 left pe-0">
			<table class="table" >
			  <thead>
			    <tr>    
			      <th scope="col">	
			      <input type="hidden" name="cmd" value="order">  
				      <div class="form-check col-1"><input class="form-check-input mt-1" type="checkbox" id="checkAll" onclick="toggleCheckAll()"></div>
			      </th>     
			      <th scope="col" class="col-6"><div class="mx-2"><strong>단어</strong></div></th>
			      <th scope="col" class="col-2"><div class="mx-2"><strong>뜻</strong></div></th>
			      <th scope="col" class="col-1"><strong>yomikana</strong></th>
			      <th scope="col" class="col-1"><div class="mx-1"><strong>난이도</strong></div></th>
			      <th scope="col" class="col-1"><strong>선택</strong></th>
			    </tr>
			  </thead>
			  <tbody>			  
				<c:forEach items="${listCart}" var="listCart" varStatus="loop">
			    <tr class="product${loop.index} product-row" id="product${loop.index}">
			      <th scope="row">
			      	<div class="form-check col-1"><input class="form-check-input" type="checkbox" onclick="updateTotalPrice()"></div>
			      </th>
			      <td class="col-6">
			   		<div class="product-img d-flex">
			   			<img src="/img/${listCart.product_img }" class="img-fluid" width="30%" alt="제품 이미지">
			   			<div>
			   			<div class="pname row mx-2 mt-4">${listCart.product_name}</div> 			   			
			   			<div style="font-size:6px; color: red; padding:0; margin:10px;">&#45; 옵션명: <span class="poptions">${listCart.options }</span></div>
			   			</div>
			   			</div>
			   		
			      </td>
			      <td class="col-2">
			      	<div class="quantity-controlss mt-4">
			      		<i class="bi bi-dash-circle mx-1" type='button' onclick='count("minus", ${loop.index})'></i>
			      		<div id='result${loop.index}'>${listCart.stock_quantity}</div>
			      		<i class="bi bi-plus-circle mx-1" type='button' onclick='count("plus", ${loop.index})'></i>
			      	</div>
			      </td>
			      <td class="col-1"><div class="mt-4 gaap">${listCart.price}</div></td>
			      <td class="col-1"><div class="mt-4 mx-2"><div name="p_price" id="p_price${loop.index}" class="p_price product-price" data-price="${listCart.price}" data-stock-quantity="${listCart.stock_quantity}">${listCart.price * listCart.stock_quantity}</div></div></td>
			      <td class="col-1"><div class="mt-4 mx-2"><i class="delete_btn fa-regular fa-trash-can" type="button" onclick='deleteRowAndProduct(${listCart.product_code}, ${loop.index}, "${listCart.options}")'></i></div></td>
			    </tr>
			     </c:forEach>
			    </tbody>
			    </table>
	    

</div>
</div>

</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
  // 페이지 로드 시에 초기 총 가격 계산
  document.addEventListener('DOMContentLoaded', function () {
    // 모든 체크박스 선택
    const checkboxes = document.querySelectorAll('.form-check-input');
    checkboxes.forEach(function(checkbox) {
      checkbox.checked = true;
    });

    // 총 가격 업데이트
    updateTotalPrice();
    
 // .gaap 클래스의 수치에 콤마 추가
    const gaapElements = document.querySelectorAll('.gaap');
    gaapElements.forEach(function(element) {
      const numericValue = parseFloat(element.textContent.replace(/,/g, '')); // 콤마 제거 후 숫자로 변환
      element.textContent = numericValue.toLocaleString();
    });

    // .p_price 클래스의 수치에 콤마 추가
    const pPriceElements = document.querySelectorAll('.p_price');
    pPriceElements.forEach(function(element) {
      const numericValue = parseFloat(element.textContent.replace(/,/g, '')); // 콤마 제거 후 숫자로 변환
      element.textContent = numericValue.toLocaleString();
    });
  });

  //"plus"와 "minus" 버튼을 클릭할 때 개별 상품 가격과 총 가격을 업데이트
  function count(type, row) {
    const resultElement = document.getElementById('result' + row);
    let number = parseInt(resultElement.innerText);
    let price = parseFloat(document.getElementById('p_price' + row).getAttribute('data-price').replace(',', ''));
    

    if (type === 'plus') {
      number = number + 1;
    } else if (type === 'minus') {
      if (number > 1) {
        number = number - 1;
      }
    }

    resultElement.innerText = number;

    const paytext = number * price;
    const p_priceElement = document.getElementById('p_price' + row);
    p_priceElement.innerHTML = paytext.toLocaleString();
    
    updateStockQuantity(row, number);
    
    // 해당 상품이 체크된 경우에만 총 가격 업데이트
    const checkbox = document.querySelector('#product' + row + ' .form-check-input');
    if (checkbox.checked) {
      updateTotalPrice(); // 총 가격 업데이트
    }
  }
  
  function updateStockQuantity(row, newQuantity) {
	  const product_name = document.getElementById('product' + row).querySelector('.pname').textContent;
	  const options = document.getElementById('product' + row).querySelector('.poptions').textContent;
	  // Ajax 요청을 이용하여 서버로 데이터 업데이트 요청 보내기
	  $.ajax({
	    type: 'POST',
	    url: '/cart/updateStockQuantity', // 업데이트를 처리할 컨트롤러 경로
	    data: {
	      product_name: product_name,
	      stock_quantity: newQuantity,
	      options: options
	    },
	    success: function (response) {
	      // 성공 시 작업 수행
	      console.log('재고 수량 업데이트 완료');
	    },
	    error: function (error) {
	      // 에러 처리
	      console.error('재고 수량 업데이트 실패: ' + error);
	    }
	  });
	}
  
  function deleteProduct(product_code, options) {
	    $.ajax({
	        type: 'POST',
	        url: '/cart/delete',
	        data: { product_code: product_code, options: options },
	        success: function (response) {
	            console.log(response);
	            $(`#product${product_code}`).remove();
	            $(`#product${options}`).remove();
	            updateTotalPrice();
	        },
	        error: function (error) {
	            console.error('상품 삭제 실패: ' + error.responseText);
	        }
	    });
	}
  
  function deleteRowAndProduct(product_code, row, options) {
	    deleteRow(row); // 행 삭제
	    deleteProduct(product_code, options); // 제품 삭제
	}
  
	//각각의 tr 요소의 체크박스에 이벤트 리스너 등록
	  for (let i = 0; i <= 100; i++) {
	    const checkbox = document.querySelector('#product' + i + ' .form-check-input');
	    checkbox.addEventListener('change', function() {
	      onRowCheckboxChange(i);
	    });	
	  }
	
  //각각의 tr 요소의 체크박스가 변경될 때 호출되는 함수
  function onRowCheckboxChange(row) {
    const checkbox = document.querySelector('#product' + row + ' .form-check-input');
    const checkAll = document.getElementById('checkAll');
    if (!checkbox.checked) {
      // 하나의 체크박스라도 체크 해제되면 전체 선택 체크박스도 체크 해제
      checkAll.checked = false;
    } else {
      // 모든 tr 요소의 체크박스가 체크되었는지 확인
      const checkboxes = document.querySelectorAll('.form-check-input');
      let allChecked = true;
      checkboxes.forEach(function(checkbox) {
        if (!checkbox.checked) {
          allChecked = false;
        }
      });

      if (allChecked) {
        // 모든 tr 요소의 체크박스가 체크되었으면 전체 선택 체크박스도 체크
        checkAll.checked = true;
      }
    }

    updateTotalPrice(); // 총 가격 업데이트
  }

  // "체크 해제" 이벤트 처리
  function toggleCheckAll() {
    const checkAll = document.getElementById('checkAll');
    const checkboxes = document.querySelectorAll('.form-check-input');

    checkboxes.forEach(function(checkbox) {
      checkbox.checked = checkAll.checked;
    });

    updateTotalPrice(); // 총 가격 업데이트
  }

  // 특정 <tr>을 삭제하고 총 가격을 업데이트
  function deleteRow(row) {
    const rowElement = document.getElementById('product' + row);
    if (rowElement) {
      rowElement.remove();

      // 남은 상품들의 데이터를 기반으로 다시 계산
      updateTotalPrice();
    }
  }
  
  //모든 상품 가격을 다시 계산
  function updateTotalPrice() {
    let totalPaytext = 0;
    const pPriceElements = document.querySelectorAll('.p_price');
    pPriceElements.forEach(function(element) {
      const numericValue = parseFloat(element.textContent.replace(/,/g, '')); // 콤마 제거 후 숫자로 변환
      if (element.closest('tr').querySelector('.form-check-input').checked) {
      totalPaytext += numericValue;
      }
    });

    // 총합을 .paytext 클래스를 가진 모든 요소에 업데이트
    const paytextElements = document.querySelectorAll('.paytext');
    paytextElements.forEach(function(element) {
      element.textContent = totalPaytext.toLocaleString();
    });

    // #totalPrice 업데이트
    const totalPriceElement = document.getElementById('totalPrice');
    totalPriceElement.textContent = totalPaytext.toLocaleString();
  }

  // "선택상품주문" 버튼 클릭 시 선택된 상품만 주문
  function orderSelectedProducts() {
    for (let i = 0; i <= 100; i++) {
      const checkbox = document.querySelector('#product' + i + ' .form-check-input');

      if (checkbox.checked) {
        // 선택된 상품에 대한 주문 로직을 추가
      }
    }
  }

  //tbody 내의 모든 체크박스를 선택할 때 실행되는 함수
  function checkAllTbodyCheckboxes() {
    const tbodyCheckboxes = document.querySelectorAll('tbody input[type="checkbox"]');
    const theadCheckbox = document.getElementById('checkAll');
    tbodyCheckboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', checkAllTbodyCheckboxes);
      });
    // 모든 tbody 체크박스가 체크되었는지 확인
    let allChecked = true;
    tbodyCheckboxes.forEach(function(checkbox) {
      if (!checkbox.checked) {
        allChecked = false;
      }
    });

    // thead 체크박스를 업데이트
    theadCheckbox.checked = allChecked;

    // 총 가격 업데이트
    updateTotalPrice();
  }

</script>
<script>
success: function (response) {
    // 성공 시 처리 (예: 알림 모달 표시)
    $("#myModal .modal-body").text(response);
    $("#myModal").modal("show");
    // 장바구니 페이지로 이동
    window.location.href = "/cart/";
},
</script>
<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/footer.jsp" />