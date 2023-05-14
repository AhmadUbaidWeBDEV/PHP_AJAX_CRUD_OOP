<?php include './database.php';
$db = new Database();
$categories = $db->select("SELECT * FROM categories");
?>
<html>

<head>
	<title>Data</title>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/app.js"></script>
</head>
<style type="text/css">
	table img{
		width: 200px;
	}
</style>
<body>
	
	<p id="loading" style="display:none">
	
	</p>
	
	<table border="1" cellpadding="5" cellspacing="0">
		<thead>
			<tr>
				<td></td>
				<td><input type="text" name="title"  required/></td>
				<td> <input type="text" name="sale_price"  required/></td>
				<td>
					<select name="category_id">
					<?php while($row = $categories->fetch_assoc()){?>
   <option value="<?php echo $row['cid']; ?>"><?php echo $row['name'];?></option>
   <?php } ?>
					</select>
				</td>
				<td> <input type="text" name="status"  required/></td>
				<td><input type="file" name="thumbnail_image"  required/></td>
				<td><input type="submit" id="save" value="Submit"></td>
			</tr>
			<tr>
				<th>id</th>
				<th>Product</th>
				<th>price</th>
				<th>Category</th>
				<th>stock</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	
</body>
</html>