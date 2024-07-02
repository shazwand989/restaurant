<?php
class Order extends Database {
    public function __construct() {
        $this->getConnection();
    }

    public function createOrder($data) {
        return $this->create('orders', $data);
    }

    public function getOrders() {
        return $this->read('orders');
    }

    public function getOrderById($orderId) {
        $conditions = "order_id = :order_id";
        $sql = "SELECT * FROM orders WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':order_id', $orderId);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function updateOrder($orderId, $data) {
        $conditions = "order_id = :order_id";
        $data['order_id'] = $orderId;
        return $this->update('orders', $data, $conditions);
    }

    public function deleteOrder($orderId) {
        $conditions = "order_id = :order_id";
        $sql = "DELETE FROM orders WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':order_id', $orderId);
        $stmt->execute();
        return true;
    }

    public function countOrders() {
        $sql = "SELECT COUNT(*) FROM `orders`";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchColumn();
    }
}
