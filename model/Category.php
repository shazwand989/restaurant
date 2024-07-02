<?php
class Category extends Database
{
    public function __construct()
    {
        $this->getConnection();
    }

    public function createCategory($data)
    {
        return $this->create('categories', $data);
    }

    public function getCategories()
    {
        return $this->read('categories');
    }

    public function getCategoryById($categoryId)
    {
        $conditions = "category_id = :category_id";
        $sql = "SELECT * FROM categories WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':category_id', $categoryId);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function updateCategory($categoryId, $data)
    {
        $conditions = "category_id = :category_id";
        $data['category_id'] = $categoryId;
        return $this->update('categories', $data, $conditions);
    }

    public function deleteCategory($categoryId)
    {
        $conditions = "category_id = :category_id";
        $sql = "DELETE FROM categories WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':category_id', $categoryId);
        $stmt->execute();
        return true;
    }

    public function countCategories()
    {
        $sql = "SELECT COUNT(*) FROM categories";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchColumn();
    }
}
