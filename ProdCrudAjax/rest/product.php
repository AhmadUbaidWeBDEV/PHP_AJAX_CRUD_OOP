<?php

require_once "../controller/product.php";

$mode = $_REQUEST['mode'];

$objProduct = new Product();

if($mode=="insert"){
	$title = $_REQUEST['title'];
	$sale_price = $_REQUEST['sale_price'];
	$category_id = $_REQUEST['category_id'];
	$status = $_REQUEST['status'];
	$sourcePath = $_FILES['thumbnail_image']['tmp_name'];
	$fileName = $_FILES['thumbnail_image']['name'];
	
	if(empty($sourcePath)){
		$fileName = "default.jpg";
	}else{
		$targetPath = "../images/".$fileName; 
		move_uploaded_file($sourcePath,$targetPath) ; 
		$objProduct->save($title,$sale_price, $category_id,$status, $fileName);
	} 

	
}else if($mode=="load"){
	$i=1;
	$result = "";
	$products = $objProduct->getAll();
	while($row = $products->fetch_assoc()){ 
    $prodid=$row["id"];
		$result.="<tr>";
		$result.="<td>".$row["id"]."</td>";
		$result.="<td style='display:block;'><img src='images/".$row["thumbnail_image"]."'><p style='text-align:center;'>".$row["title"]."</p></td>";
		$result.="<td>".$row["sale_price"]."</td>";
		$result.="<td>".$row["name"]."</td>";
		$result.="<td>".$row["status"]."</td>";
		$result.="<td><a class='edit'  data-id='".$prodid."'>Edit</a> | <a class='delete' name='delete'  data-id='".$prodid."'>Delete</a></td>";
	    $result.="</tr>";
	};
	echo $result;
}else if($mode=="loadOne"){
	
	$id = $_REQUEST['id'];
	$result = $objProduct->getOne($id)->fetch_assoc();
	echo json_encode($result);
}else if($mode=="update"){
	$id = $_REQUEST['id'];
	$title = $_REQUEST['title'];
	$sale_price = $_REQUEST['sale_price'];
	$category_id = $_REQUEST['category_id'];
	$status = $_REQUEST['status'];
	$sourcePath = $_FILES['thumbnail_image']['tmp_name'];
	$fileName = $_FILES['thumbnail_image']['name'];
	

	
	if(empty($sourcePath)){
		$fileName = "default.jpg";
	}else{
		$targetPath = "../images/".$fileName; 
		move_uploaded_file($sourcePath,$targetPath) ; 
	}

	$objProduct->update($id,$title,$sale_price, $category_id,$status, $fileName);
}else if($mode=="delete"){
	$id = $_REQUEST['id'];
	$objProduct->delete($id);
}
?>