/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.time.LocalTime;

/**
 *
 * @author chi
 */
public class RouteDTO {

    private int routeId;
    private String routeName;
    private double fare;
    private String frequency;
    private String startTime;
    private String endTime;
    private String routeNumber;
    private int minStopId;
    private String minStopName;
    private int maxStopId;
    private String maxStopName;

    public RouteDTO() {
    }

    public RouteDTO(int routeId, String routeName, double fare, String frequency, String startTime, String endTime, String routeNumber, int minStopId, String minStopName, int maxStopId, String maxStopName) {
        this.routeId = routeId;
        this.routeName = routeName;
        this.fare = fare;
        this.frequency = frequency;
        this.startTime = startTime;
        this.endTime = endTime;
        this.routeNumber = routeNumber;
        this.minStopId = minStopId;
        this.minStopName = minStopName;
        this.maxStopId = maxStopId;
        this.maxStopName = maxStopName;
    }

    public int getRouteId() {
        return routeId;
    }

    public void setRouteId(int routeId) {
        this.routeId = routeId;
    }

    public String getRouteName() {
        return routeName;
    }

    public void setRouteName(String routeName) {
        this.routeName = routeName;
    }

    public double getFare() {
        return fare;
    }

    public void setFare(double fare) {
        this.fare = fare;
    }

    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getRouteNumber() {
        return routeNumber;
    }

    public void setRouteNumber(String routeNumber) {
        this.routeNumber = routeNumber;
    }

    public int getMinStopId() {
        return minStopId;
    }

    public void setMinStopId(int minStopId) {
        this.minStopId = minStopId;
    }

    public String getMinStopName() {
        return minStopName;
    }

    public void setMinStopName(String minStopName) {
        this.minStopName = minStopName;
    }

    public int getMaxStopId() {
        return maxStopId;
    }

    public void setMaxStopId(int maxStopId) {
        this.maxStopId = maxStopId;
    }

    public String getMaxStopName() {
        return maxStopName;
    }

    public void setMaxStopName(String maxStopName) {
        this.maxStopName = maxStopName;
    }

    

}
