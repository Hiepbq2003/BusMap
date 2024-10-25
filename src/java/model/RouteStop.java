/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author olymp
 */
public class RouteStop {
    private int routeId, stopId, ordered;
    private String direction, role;

    public RouteStop() {
    }

    public RouteStop(int routeId, int stopId, int ordered, String direction, String role) {
        this.routeId = routeId;
        this.stopId = stopId;
        this.ordered = ordered;
        this.direction = direction;
        this.role = role;
    }

    public int getRouteId() {
        return routeId;
    }

    public void setRouteId(int routeId) {
        this.routeId = routeId;
    }

    public int getStopId() {
        return stopId;
    }

    public void setStopId(int stopId) {
        this.stopId = stopId;
    }

    public int getOrdered() {
        return ordered;
    }

    public void setOrdered(int ordered) {
        this.ordered = ordered;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "RouteStop{" + "routeId=" + routeId + ", stopId=" + stopId + ", ordered=" + ordered + ", direction=" + direction + ", role=" + role + '}';
    }
}
