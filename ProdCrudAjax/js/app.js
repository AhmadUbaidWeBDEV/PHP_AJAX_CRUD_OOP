$(document).ready(function(){
	$("#save").click(saveData);
	$("[name='submit']").click(function(){
		mode = "insert";
		$("#save").attr("value", "submit");
	})
	$("body").on("click", ".edit", function(){
		mode = "update";
		$("#save").attr("value", "update");
		idTarget = $(this).attr("data-id");
		
		getData(idTarget);
	});
	$("body").on("click", ".delete", function(){
      var delid = $("[name='delete']").val();
		idTarget = $(this).attr("data-id");
		var temp = confirm("Are you sure?");
	
		if(!temp){
			return false;
		}else{
			deleteData(idTarget);
		}
	});
	loadData();

	var mode = "insert";
	var idTarget = -1;

	var data;
	var title;
	var sale_price;
	var category_id;
	var status;
	var thumbnail_image;

	function getValue(){
		data = new FormData();
		title = $("[name='title']").val();
		sale_price = $("[name='sale_price']").val();
		category_id = $("[name='category_id']").val();
		status = $("[name='status']").val();
		thumbnail_image = $("[name='thumbnail_image']").prop("files")[0];
		

		if(thumbnail_image==undefined){
			thumbnail_image = null;
		}

		data.append("mode", mode);
		data.append("id", idTarget);
		data.append("title", title);
		data.append("sale_price", sale_price);
		data.append("category_id",category_id);
		data.append("status", status);
		data.append("thumbnail_image", thumbnail_image);
	}

	function saveData(){
		getValue();
		if(mode=="insert"){
			insertData();
		}else if(mode=="update"){
			updateData();
		}
	};

	function insertData(){
		$('#loading').show();
		getValue();
		$.ajax({
			type:"POST",
			url : "rest/product.php",
			data : data,
			contentType : false, 
			processData: false, 
			success : function(){
				loadData();
			},
			complete : function(){
				$('#loading').hide();
			}
		});
	}

	function getData($id){

		$.ajax({
			type:"GET",
			url : "rest/product.php",
			data : {mode:'loadOne', id:idTarget},
			success : function(data){
				var temp = JSON.parse(data);
				$("[name='title']").val(temp.title);
                $("[name='sale_price']").val(temp.sale_price);
				$("[name='category_id']").val(temp.category_id);
				$("[name='status']").val(temp.status);				
				$("[name='thumbnail_image']").val(temp.thumbnail_image);
			}
		});
	}

	function updateData(){
		$('#loading').show();
		getValue();
		$.ajax({
			type:"POST",
			url : "rest/product.php",
			data : data,
			contentType : false, 
			processData: false, 
			success : function(){
				loadData();
				clearForm();
			},
			complete : function(){
				$('#loading').hide();
			}
		});
	}

	function loadData(){
		$.ajax({
			type:"GET",
			url : "rest/product.php",
			data : {mode:'load'},
			success : function(data){
				$("body table tbody").html(data);
			}
		});

		

	};

	function deleteData(id){
		$('#loading').show();
		$.ajax({
			type:"GET",
			url : "rest/product.php",
			data : {mode:"delete", id:idTarget},
			success : function(){
				loadData();

			},
			complete : function(){
				$('#loading').hide();
			}
		});
	}

})