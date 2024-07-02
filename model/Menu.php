<?php
class Menu extends Database {
    public function __construct() {
        $this->getConnection();
    }

    public function createMenu($data) {
        return $this->create('menu', $data);
    }

    public function getMenus() {
        return $this->read('menu');
    }

    public function getMenuById($menuId) {
        $conditions = "menu_id = :menu_id";
        $sql = "SELECT * FROM menu WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':menu_id', $menuId);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function updateMenu($menuId, $data) {
        $conditions = "menu_id = :menu_id";
        $data['menu_id'] = $menuId;
        return $this->update('menu', $data, $conditions);
    }

    public function deleteMenu($menuId) {
        $conditions = "menu_id = :menu_id";
        $sql = "DELETE FROM menu WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':menu_id', $menuId);
        $stmt->execute();
        return true;
    }

    public function countMenus() {
        $sql = "SELECT COUNT(*) FROM `menu`";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchColumn();
    }
}
