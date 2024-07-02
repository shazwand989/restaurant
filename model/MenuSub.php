<?php
class MenuSub extends Database
{
    public function __construct()
    {
        $this->getConnection();
    }

    public function createMenuSub($data)
    {
        return $this->create('menu_sub', $data);
    }

    public function getMenuSubs()
    {
        return $this->read('menu_sub');
    }

    public function getMenuSubById($menuSubId)
    {
        $conditions = "menu_sub_id = :menu_sub_id";
        $sql = "SELECT * FROM menu_sub WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':menu_sub_id', $menuSubId);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function updateMenuSub($menuSubId, $data)
    {
        $conditions = "menu_sub_id = :menu_sub_id";
        $data['menu_sub_id'] = $menuSubId;
        return $this->update('menu_sub', $data, $conditions);
    }

    public function deleteMenuSub($menuSubId)
    {
        $conditions = "menu_sub_id = :menu_sub_id";
        $sql = "DELETE FROM menu_sub WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':menu_sub_id', $menuSubId);
        $stmt->execute();
        return true;
    }
}
