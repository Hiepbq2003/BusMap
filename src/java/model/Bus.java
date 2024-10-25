/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author olymp
 */
//BusId INT IDENTITY(1,1) PRIMARY KEY,
//    Plate NVARCHAR(50) NOT NULL,
//    Capacity INT NOT NULL,
//    Model NVARCHAR(255),
//    Color NVARCHAR(50),
//    RouteId INT,
//    FOREIGN KEY (RouteId) REFERENCES Routes(RouteId)
public class Bus {
    private int busId, routeId, capacity;
    private String plate, color, model;

    public Bus() {
    }

    public Bus(int busId, int routeId, String plate, int capacity, String color, String model) {
        this.busId = busId;
        this.routeId = routeId;
        this.plate = plate;
        this.capacity = capacity;
        this.color = color;
        this.model = model;
    }

    public Bus(int routeId, int capacity, String plate, String color, String model) {
        this.routeId = routeId;
        this.capacity = capacity;
        this.plate = plate;
        this.color = color;
        this.model = model;
    }
    
    

    public int getBusId() {
        return busId;
    }

    public void setBusId(int busId) {
        this.busId = busId;
    }

    public int getRouteId() {
        return routeId;
    }

    public void setRouteId(int routeId) {
        this.routeId = routeId;
    }

    public String getPlate() {
        return plate;
    }

    public void setPlate(String plate) {
        this.plate = plate;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    @Override
    public String toString() {
        return "Bus{" + "busId=" + busId + ", routeId=" + routeId + ", plate=" + plate + ", capacity=" + capacity + ", color=" + color + ", model=" + model + '}';
    }
    
    
}
