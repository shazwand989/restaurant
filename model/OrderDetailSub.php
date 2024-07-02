<?php
class OrderDetailSub extends Database {
    public function __construct() {
        $this->getConnection();
    }

    public function createOrderDetailSub($data) {
        return $this->create('order_detail_sub', $data);
    }

    public function getOrderDetailSubs() {
        return $this->read('order_detail_sub');
    }

    public function getOrderDetailSubById($orderDetailSubId) {
        $conditions = "order_detail_sub_id = :order_detail_sub_id";
        $sql = "SELECT * FROM order_detail_sub WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':order_detail_sub_id', $orderDetailSubId);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function updateOrderDetailSub($orderDetailSubId, $data) {
        $conditions = "order_detail_sub_id = :order_detail_sub_id";
        $data['order_detail_sub_id'] = $orderDetailSubId;
        return $this->update('order_detail_sub', $data, $conditions);
    }

    public function deleteOrderDetailSub($orderDetailSubId) {
        $conditions = "order_detail_sub_id = :order_detail_sub_id";
        $sql = "DELETE FROM order_detail_sub WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':order_detail_sub_id', $orderDetailSubId);
        $stmt->execute();
        return true;
    }
}
