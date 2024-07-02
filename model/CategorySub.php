<?php
class CategorySub extends Database {
    public function __construct() {
        $this->getConnection();
    }

    public function createCategorySub($data) {
        return $this->create('category_sub', $data);
    }

    public function getCategorySubs() {
        return $this->read('category_sub');
    }

    public function getCategorySubById($categorySubId) {
        $conditions = "category_sub_id = :category_sub_id";
        $sql = "SELECT * FROM category_sub WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':category_sub_id', $categorySubId);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function updateCategorySub($categorySubId, $data) {
        $conditions = "category_sub_id = :category_sub_id";
        $data['category_sub_id'] = $categorySubId;
        return $this->update('category_sub', $data, $conditions);
    }

    public function deleteCategorySub($categorySubId) {
        $conditions = "category_sub_id = :category_sub_id";
        $sql = "DELETE FROM category_sub WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':category_sub_id', $categorySubId);
        $stmt->execute();
        return true;
    }
}
