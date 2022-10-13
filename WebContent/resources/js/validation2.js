function bookCheck() {
 	//도서 아이디가 ISBN으로 시작 숫자를 포함하며 5~12글자
	var regBookId = /^ISBN[0-9]{1,8}$/;
	//도서명의 문자 길이가 4~12
	
	//가격의 문자길이가 0인지
	
	//가격이 음수인지
	
	//재고수가 숫자인지 검사	
	var regStock = /^\d+$/;
	let form = document.newProduct;
	console.log("도서명"+form.name.value.length);
	if(!regBookId.test(form.bookId.value)){
		alert("ISBN으로 시작하며 5~12글자 이어야 합니다.");
		return;
	}
	if(4 > form.name.value.length||form.name.value.length > 12){
		alert("도서명은 4글자 이상 12글자 이하입니다.")
		return;
	}
	if(parseInt(form.unitPrice.value) < 0 ){
		alert("가격이 0보다 작습니다.")
		return;
	}else if(form.unitPrice.value.length == 0){
		alert("가격을 적어주세요");
		return;
	}
	if(!regStock.test(form.unitsInStock.value)){
		alert("재고수는 숫자만 있을수 있습니다");
		return;
	}
	form.submit();	
}
