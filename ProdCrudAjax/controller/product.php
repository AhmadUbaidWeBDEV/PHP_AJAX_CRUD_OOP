<?php
class Product{
	private $server = "localhost";
	private $username = "root";
	private $pass = "";
	private $db = "ecomphp";
	private $conn ;
	private $table;

	public function __construct(){
		$this->conn = new mysqli($this->server, $this->username, $this->pass, $this->db);
		$this->table = "products";
	}
	public function getAll(){
		return $this->conn->query("SELECT * from $this->table JOIN categories on $this->table.category_id=categories.cid ORDER BY `products`.`id` DESC");
	}
	
	public function save($title,$sale_price,$category_id,$status, $thumbnail_image){
		echo $title;
		$this->conn->query("INSERT into $this->table(title,sale_price, category_id,status, thumbnail_image) VALUES('$title','$sale_price','$category_id','$status','$thumbnail_image')");
	
	}
	

	public function getOne($id){
		return $this->conn->query("SELECT * from $this->table JOIN categories on $this->table.category_id=categories.cid WHERE $this->table.id='$id'");
	}
	
	public function update($id,$title,$sale_price, $category_id,$status, $fileName){
		$this->conn->query("UPDATE $this->table SET title='$title', sale_price='$sale_price', category_id='$category_id',status='$status', thumbnail_image='$fileName' WHERE id='$id'");
	}

	public function delete($id){
		$this->conn->query("DELETE from $this->table WHERE id = '$id'");
	}
}
?>