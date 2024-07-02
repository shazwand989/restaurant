<?php
class State extends Database {
    public function __construct() {
        $this->getConnection();
    }

    public function createState($data) {
        return $this->create('states', $data);
    }

    public function getStates() {
        return $this->read('states');
    }

    public function getStateById($stateId) {
        $conditions = "state_id = :state_id";
        $sql = "SELECT * FROM states WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':state_id', $stateId);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function updateState($stateId, $data) {
        $conditions = "state_id = :state_id";
        $data['state_id'] = $stateId;
        return $this->update('states', $data, $conditions);
    }

    public function deleteState($stateId) {
        $conditions = "state_id = :state_id";
        $sql = "DELETE FROM states WHERE $conditions";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':state_id', $stateId);
        $stmt->execute();
        return true;
    }
}
?>
