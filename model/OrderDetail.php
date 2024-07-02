<?php
class OrderDetail extends Database {
    public function __construct() {
        $this->getConnection();
    }

    public function createOrderDetail($data) {
        return $this->create('order_details', $data);
    }

    public function getOrderDetails() {
        return $this->read('order_details');
    }

    public function getOrderDetailById($orderDetailId) {
        $conditions = "order_detail_id = :order_detail_id";
        $sql = "SELECT * FROM order_details WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':order_detail_id', $orderDetailId);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function updateOrderDetail($orderDetailId, $data) {
        $conditions = "order_detail_id = :order_detail_id";
        $data['order_detail_id'] = $orderDetailId;
        return $this->update('order_details', $data, $conditions);
    }

    public function deleteOrderDetail($orderDetailId) {
        $conditions = "order_detail_id = :order_detail_id";
        $sql = "DELETE FROM order_details WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':order_detail_id', $orderDetailId);
        $stmt->execute();
        return true;
    }
}
