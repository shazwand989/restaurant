<?php
class Restaurant extends Database {
    public function __construct() {
        $this->getConnection();
    }

    public function createRestaurant($data) {
        return $this->create('restaurant', $data);
    }

    public function getRestaurants() {
        return $this->read('restaurant');
    }

    public function getRestaurantById($restaurantId) {
        $conditions = "restaurant_id = :restaurant_id";
        $sql = "SELECT * FROM restaurant WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':restaurant_id', $restaurantId);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function updateRestaurant($restaurantId, $data) {
        $conditions = "restaurant_id = :restaurant_id";
        $data['restaurant_id'] = $restaurantId;
        return $this->update('restaurant', $data, $conditions);
    }

    public function deleteRestaurant($restaurantId) {
        $conditions = "restaurant_id = :restaurant_id";
        $sql = "DELETE FROM restaurant WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':restaurant_id', $restaurantId);
        $stmt->execute();
        return true;
    }
}
