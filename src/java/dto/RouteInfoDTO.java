/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.time.LocalTime;


public class RouteInfoDTO {
    private int routeId;
    private String routeName;
    private double fare;
    private LocalTime frequency;
    private LocalTime startTime;
    private LocalTime endTime;
    private String routeNumber;
    private int minStopId;
    private String minStopName;
    private int maxStopId;
    private String maxStopName;

    public RouteInfoDTO() {
    }

    public RouteInfoDTO(int routeId, String routeName, double fare, LocalTime frequency, LocalTime startTime, LocalTime endTime, String routeNumber, int minStopId, String minStopName, int maxStopId, String maxStopName) {
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

    @Override
    public String toString() {
        return "RouteInfoDTO{" + "routeId=" + routeId + ", routeName=" + routeName + ", fare=" + fare + ", frequency=" + frequency + ", startTime=" + startTime + ", endTime=" + endTime + ", routeNumber=" + routeNumber + ", minStopId=" + minStopId + ", minStopName=" + minStopName + ", maxStopId=" + maxStopId + ", maxStopName=" + maxStopName + '}';
    }
    
    
}
