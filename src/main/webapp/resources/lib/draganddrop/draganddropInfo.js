var mediaMixArray = [0,1,2,3,4,5,6];
var mediaCnt = 0;

$("table thead th").on("dragstart", dragInfo)

var drop = document.getElementById('drop');

drop.ondragover = function(e) {
	e.preventDefault(); // 필수
	e.dataTransfer.dropEffect = 'move';
};

drop.ondrop = function(e) {
	var tr = $("table tbody tr");
	var index = e.dataTransfer.getData('index') * 1;
	mediaCnt++;
	// 항목 복구 버튼생성
	if(mediaCnt>0){
		document.getElementById('dropbox_content').style.display = 'none';
		document.getElementById('drop').style.display = 'flex';
	}

	var plusUl = document.createElement('div');
	var redo = "'onclick='redo(" + index + ")'>";
	var rank = "redo-" + index;

	plusUl.innerHTML = "<button class='"
			+ rank
			+ " btn btn-outline-secondary fas' style='border-radius: 70px; margin-left:10px;"
			+ redo + e.dataTransfer.getData('data')
			+ "<i class='fas fa-times' style='margin-left:10px;'></i>"
			+ "</button>";
	document.getElementById('drop').appendChild(plusUl);

	/*index값이 위치한 배열의 인덱스 반환*/
	var i = mediaMixArray.findIndex(function(item){
		return item == index;
	})
	/*찾은 인덱스를 지움*/
	mediaMixArray.splice(i,1);
	mediaMix();
}

function redo(index) {// 항목 복구
	var tr = $("table tbody tr");
	var th = $("table thead th");
	$(th[index]).css("display", "");

	for (var i = 0; i < tr.length; i++) {
		var tri = $("table tbody tr");
		var td = $(tri[i]).children("td");
		$(td[index]).css("display", "");
	}
	$(".redo-" + index).remove();
	
	mediaMixArray.push(index);
	mediaMix();
	mediaCnt--;
	
	if(mediaCnt==0){
		document.getElementById('dropbox_content').style.display = '';
		document.getElementById('drop').style.display = '';
	}
}

function mediaMix() {
	mediaMixArray.sort(function(a, b) { // 오름차순
	    return a - b;
	});
	var url = '/campaign/ajax/mediamix';
	var params = {
		cid : $("#cid").val(),
		cols : JSON.stringify(mediaMixArray)
	};
	ajaxGet(url, params, bindMediaMix);
}

function bindMediaMix(data) {
	var cols = mediaMixArray;
	var list = data.list;

	var thead = $("table thead");
	var tbody = $("table tbody");
	
	var cpTable = JSON.parse(JSON.stringify(defTable));
	cpTable.sort(function (a, b) {
		var strIF = "";
		for(var key in cols){
			if(!delIndex.includes(Number(key))){
				strIF += '|| (a['+cols[key]+'] < b['+cols[key]+'] ? -1 : a['+cols[key]+'] > b['+cols[key]+'] ? 1 : 0)';
			}
		}
		strIF = strIF.substring(2);
		return eval(strIF);
	});
	
	var cursor = cpTable[0];
	var resTable = [];
	var isSum = false;
    for(var idx=0; idx<cpTable.length-1; idx++){	//행단위 검사
    	var compare = cpTable[idx];
    	for(var key in Object.keys(compare)){		//열단위 검사
    		if(cols.includes(Number(key)) && !delIndex.includes(Number(key))){
    			if(compare[key] == cpTable[idx+1][key]){
    				isSum = true;
    			}else {
    				isSum = false;
    				break;
    			}
    		}
    	}
    	var adPrice = (isEmpty(cursor[4])) ? '0': cursor[4].toString();
		var totalOts = (isEmpty(cursor[5])) ? '0' : cursor[5].toString();
		var preOts = (isEmpty(cursor[6])) ? '0' : cursor[6].toString();
		
    	if(isSum){	//행 합치기
    		var comAdPrice = (isEmpty(cpTable[idx+1][4])) ? '0' : cpTable[idx+1][4].toString();
    		var comTotalOts = (isEmpty(cpTable[idx+1][5])) ? '0' : cpTable[idx+1][5].toString();
    		var comPreOts = (isEmpty(cpTable[idx+1][6])) ? '0' : cpTable[idx+1][6].toString();
    		
    		cursor[4] = (Number(adPrice.replace(/,/g, '')) + Number(comAdPrice.replace(/,/g, ''))).toString();
    		cursor[5] = (Number(totalOts.replace(/,/g, '')) + Number(comTotalOts.replace(/,/g, ''))).toString();
    		cursor[6] = (Number(preOts.replace(/,/g, '')) + Number(comPreOts.replace(/,/g, ''))).toString();
    	}else {		//행 삽입
    		resTable.push(cursor);
    		cursor = cpTable[idx+1];
    	}
    }
    resTable.push(cursor);
	
	thead.empty();
	tbody.empty();
	
	var tr = $("<tr></tr>");
	var th = $("<th></th>");
	var td = $("<td></td>");
	
	/*테이블 헤더 만드는부분*/
	var tr1 = tr.clone();
	for(var i=0;i<cols.length;i++){
		var thc = th.clone();
		switch(cols[i]){
		case 0:
			thc.text("미디어 유형");
			thc.css("width","170px");
			thc.attr("data-idx","0");
			break;
		case 1:
			thc.text("미디어");
			thc.css("width","140px");
			thc.attr("data-idx","1");
			break;
		case 2:
			thc.text("미디어 상품");
			thc.attr("data-idx","2");
			break;
		case 3:
			thc.text("노출 위치");
			thc.css("width","185px");
			thc.attr("data-idx","3");
			break;
		case 4:
			thc.text("광고료");
			thc.css("width","170px");
			thc.attr("data-idx","4");
			break;
		case 5:
			thc.text("예상 타겟 OTS");
			thc.css("width","170px");
			thc.attr("data-idx","5");
			break;
		case 6:
			thc.text("예상 총 OTS");
			thc.css("width","170px");
			thc.attr("data-idx","6");
			break;
		}
		thc.attr("scope","col");
		thc.attr("draggable",true);
		thc.css("user-select","all");
		thc.on("dragstart", dragInfo);
		tr1.append(thc);
	}
	thead.append(tr1);
	
	
	/*테이블 바디 만드는 부분*/
	for(var j=0;j<resTable.length;j++){
		var l = resTable[j];
		var tr2 = tr.clone();
		for(var k=0;k<cols.length;k++){
			var tdc = td.clone();
			switch(cols[k]){
			case 0:
				tdc.text(l[0]);
				break;
			case 1:
				tdc.text(l[1]);
				break;
			case 2:
				tdc.text(l[2]);
				break;
			case 3:
				tdc.text(l[3]);
				break;
			case 4:
				tdc.text((isEmpty(l[4]) ? '0': l[4].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")));
				break;
			case 5:
				tdc.text((isEmpty(l[5]) ? '0': l[5].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")));
				break;
			case 6:
				tdc.text((isEmpty(l[6]) ? '0': l[6].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")));
				break;
			}
			tr2.append(tdc);
		}
		var tdc = td.clone()	
		tbody.append(tr2);
	}
	
	$('th').unbind('click')
    .attr('onclick', '')
    .each(function(column) {
 	   	$(this).click(function() {
 	   		if($(this).is('.asc')) {
	            $(this).removeClass('asc');
	            $(this).addClass('desc');
	            $(".ord-mark").detach();
	            $(this).append('<span class="ord-mark">▼</span>');
	            sortdir=-1;                
	        } else {
	           $(this).addClass('asc');
	           $(this).removeClass('desc'); 
	           $(".ord-mark").detach();
	           $(this).append('<span class="ord-mark">▲</span>');
	           sortdir=1;
	        }
	        $(this).siblings().removeClass('asc');
	        $(this).siblings().removeClass('desc');
	        var rec = $('#table').find('tbody>tr').get();
	        rec.sort(function (a, b) {
	            var val1 = $(a).children('td').eq(column).text().toUpperCase();
	            var val2 = $(b).children('td').eq(column).text().toUpperCase();
	            bVal = parseInt(val1.replace(/,/g,""));
	            aVal = parseInt(val2.replace(/,/g,""));
	            if(isNumeric(bVal) && isNumeric(aVal)){
	            	return (bVal < aVal)?-sortdir:(bVal>aVal)?sortdir:0;
	            }
	            return (val1 < val2)?-sortdir:(val1>val2)?sortdir:0;
	        });
	        $.each(rec, function(index, row) {
	        	$('tbody').append(row);
	        });
 	   	});
    });
}

function isNumeric(data) {
	return !isNaN(data);
}
function isEmpty(str){
    if(typeof str == "undefined" || str == null || str == "")
        return true;
    else
        return false ;
}

function dragInfo(e){
	$(".ord-mark").detach();
	e.originalEvent.dataTransfer.setData('index', $(this).attr("data-idx"));
	e.originalEvent.dataTransfer.setData('data', $(this).text());
	e.originalEvent.dataTransfer.dropEffect = 'copy';
}
