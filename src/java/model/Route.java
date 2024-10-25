/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalTime;
import java.util.Date;
/**
 *
 * @author olymp
 */

public class Route {
    private int routeId;
    private String RouteName;
    private double fare;
    private LocalTime frequency;
    private LocalTime startTime, endTime;
    private String routeNumber;

    public Route() {
    }

    public Route(int routeId, double fare, LocalTime frequency, LocalTime startTime, LocalTime endTime, String routeNumber) {
        this.routeId = routeId;
        this.fare = fare;
        this.frequency = frequency;
        this.startTime = startTime;
        this.endTime = endTime;
        this.routeNumber = routeNumber;
    }

    public Route(String RouteName, double fare, LocalTime frequency, LocalTime startTime, LocalTime endTime, String routeNumber) {
        this.RouteName = RouteName;
        this.fare = fare;
        this.frequency = frequency;
        this.startTime = startTime;
        this.endTime = endTime;
        this.routeNumber = routeNumber;
    }
    
    

    public Route(int routeId, String RouteName, double fare, LocalTime frequency, LocalTime startTime, LocalTime endTime, String routeNumber) {
        this.routeId = routeId;
        this.RouteName = RouteName;
        this.fare = fare;
        this.frequency = frequency;
        this.startTime = startTime;
        this.endTime = endTime;
        this.routeNumber = routeNumber;
    }
    
    

    public String getRouteName() {
        return RouteName;
    }

    public void setRouteName(String RouteName) {
        this.RouteName = RouteName;
    }
    

    public int getRouteId() {
        return routeId;
    }

    public void setRouteId(int routeId) {
        this.routeId = routeId;
    }

    public double getFare() {
        return fare;
    }

    public void setFare(double fare) {
        this.fare = fare;
    }

    public LocalTime getFrequency() {
        return frequency;
    }

    public void setFrequency(LocalTime frequency) {
        this.frequency = frequency;
    }

    public LocalTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }

    public String getRouteNumber() {
        return routeNumber;
    }

    public void setRouteNumber(String routeNumber) {
        this.routeNumber = routeNumber;
    }

    @Override
    public String toString() {
        return "Route{" + "routeId=" + routeId + ", fare=" + fare + ", frequency=" + frequency + ", startTime=" + startTime + ", endTime=" + endTime + ", routeNumber=" + routeNumber + '}';
    }
    
    
    
}
