<?php

class Database{

    public $host   = 'localhost';
    public $user   = 'root';
    public $pass   = '';
    public $dbname = 'ecomphp';
    public $conn;
    public function __construct()
    {
        $this->conn = new mysqli(
            $this->host,
            $this->user,
            $this->pass,
            $this->dbname
        );

    }
 
    public function select($query){
        $result = $this->conn->query($query) or
        die($this->conn->error . __LINE__);
        if($result->num_rows > 0){
            return $result;
        }else{
            return false;
        }
    }

    public function insert($query){
        $insert_row = $this->conn->query($query) or
        die($this->conn->error . __LINE__);
        if($insert_row){
            return $insert_row;
        }else{
            return false;
        }
    }

    public function update($query){
        $update_row = $this->conn->query($query) or
        die($this->conn->error . __LINE__);
        if($update_row){
            return $update_row;
        }else{
            return false;
        }
    }

    public function delete($query){
        $delete_row = $this->conn->query($query) or
        die($this->conn->error . __LINE__);
        if($delete_row){
            return $delete_row;
        }else{
            return false;
        }
    }

    public function getLastId(){
        return $this->conn->insert_id;
    }


}


?>