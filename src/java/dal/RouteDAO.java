/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dto.RouteDTO;
import dto.RouteInfoDTO;
import java.util.ArrayList;
import java.util.List;
import model.Route;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalTime;
import java.sql.*;

/**
 *
 * @author olymp
 */
public class RouteDAO extends DBContext {

    public List<Route> getAllRoutes() {
        List<Route> listR = new ArrayList<>();
        try {
            String sql = "select * from Routes";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Route route = new Route();
                route.setRouteId(rs.getInt("RouteId"));
                route.setRouteNumber(rs.getString("RouteNumber"));
                route.setRouteName(rs.getString("RouteName"));
                route.setFare(rs.getDouble("Fare"));
                route.setFrequency(LocalTime.parse(rs.getString("Frequency")));
                route.setStartTime(LocalTime.parse(rs.getString("StartTime")));
                route.setEndTime(LocalTime.parse(rs.getString("EndTime")));
                listR.add(route);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listR;
    }

    public List<RouteInfoDTO> getRouteInfoList() {
        List<RouteInfoDTO> routeInfoList = new ArrayList<>();
        try {
            String sql = "SELECT r.RouteId, r.RouteName, r.Fare, r.Frequency, r.StartTime, r.EndTime, r.RouteNumber,\n"
                    + "       MIN(s.StopId) AS MinStopId,\n"
                    + "       (SELECT StopName FROM Stops WHERE StopId = MIN(s.StopId)) AS MinStopName,\n"
                    + "       MAX(s.StopId) AS MaxStopId,\n"
                    + "       (SELECT StopName FROM Stops WHERE StopId = MAX(s.StopId)) AS MaxStopName\n"
                    + "FROM [BusTracking].[dbo].[Routes] r\n"
                    + "JOIN Route_Stop rs ON r.RouteId = rs.RouteId\n"
                    + "JOIN Stops s ON s.StopId = rs.StopId\n"
                    + "WHERE rs.Direction = 'Forward'\n"
                    + "GROUP BY r.RouteId, r.RouteName, r.Fare, r.Frequency, r.StartTime, r.EndTime, r.RouteNumber;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RouteInfoDTO routeInfo = new RouteInfoDTO();
                routeInfo.setRouteId(rs.getInt("RouteId"));
                routeInfo.setRouteName(rs.getString("RouteName"));
                routeInfo.setFare(rs.getDouble("Fare"));
                routeInfo.setFrequency(LocalTime.parse(rs.getString("Frequency")));
                routeInfo.setStartTime(LocalTime.parse(rs.getString("StartTime")));
                routeInfo.setEndTime(LocalTime.parse(rs.getString("EndTime")));
                routeInfo.setRouteNumber(rs.getString("RouteNumber"));
                routeInfo.setMinStopId(rs.getInt("MinStopId"));
                routeInfo.setMinStopName(rs.getString("MinStopName"));
                routeInfo.setMaxStopId(rs.getInt("MaxStopId"));
                routeInfo.setMaxStopName(rs.getString("MaxStopName"));
                routeInfoList.add(routeInfo);
            }
        } catch (SQLException e) {
            System.err.println("Error in getRouteInfoList: " + e.getMessage());
        }
        return routeInfoList;
    }

    public List<RouteDTO> getRoutesByStopId(int fromStopId, int toStopId) {
        List<RouteDTO> routes = new ArrayList<>();
        String sql = "SELECT r.RouteId, r.RouteName, r.Fare, r.Frequency, r.StartTime, r.EndTime, r.RouteNumber,\n"
                + "MIN(s.StopId) AS MinStopId,\n"
                + "(SELECT StopName FROM Stops WHERE StopId = MIN(s.StopId)) AS MinStopName,\n"
                + "MAX(s.StopId) AS MaxStopId,\n"
                + "(SELECT StopName FROM Stops WHERE StopId = MAX(s.StopId)) AS MaxStopName\n"
                + "FROM [BusTracking].[dbo].[Routes] r JOIN Route_Stop rs ON r.RouteId = rs.RouteId\n"
                + "JOIN Stops s ON s.StopId = rs.StopId\n"
                + "WHERE rs.Direction = 'Forward' AND rs.StopId IN (?, ?)\n"
                + "GROUP BY r.RouteId, r.RouteName, r.Fare, r.Frequency, r.StartTime, r.EndTime, r.RouteNumber;";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, fromStopId);
            statement.setInt(2, toStopId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                RouteDTO route = new RouteDTO();
                route.setRouteId(rs.getInt("RouteId"));
                route.setFare(rs.getDouble("Fare"));
                route.setRouteName(rs.getString("RouteName"));
                route.setFrequency(rs.getString("Frequency"));
                route.setStartTime(rs.getString("StartTime"));
                route.setEndTime(rs.getString("EndTime"));
                route.setMinStopId(rs.getInt("MinStopId"));
                route.setMinStopName(rs.getString("MinStopName"));
                route.setMaxStopId(rs.getInt("MaxStopId"));
                route.setMaxStopName(rs.getString("MaxStopName"));
                route.setRouteNumber(rs.getString("RouteNumber"));
                routes.add(route);
            }
        } catch (SQLException e) {
            System.err.println("Error retrieving routes by stopId: " + e.getMessage());
        }

        return routes;
    }

    public boolean addRoute(Route route) {
        String sql = "INSERT INTO [Routes] "
                + "([RouteName], [Fare], [Frequency], [StartTime], [EndTime], [RouteNumber]) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, route.getRouteName());
            statement.setDouble(2, route.getFare());
            statement.setTime(3, Time.valueOf(route.getFrequency()));
            statement.setTime(4, Time.valueOf(route.getStartTime()));
            statement.setTime(5, Time.valueOf(route.getEndTime()));
            statement.setString(6, route.getRouteNumber());
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean editRoute(Route route) {
        String sql = "UPDATE [Routes] SET "
                + "[RouteName] = ?, "
                + "[Fare] = ?, "
                + "[Frequency] = ?, "
                + "[StartTime] = ?, "
                + "[EndTime] = ?, "
                + "[RouteNumber] = ? "
                + "WHERE [RouteId] = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, route.getRouteName());
            statement.setDouble(2, route.getFare());
            statement.setTime(3, Time.valueOf(route.getFrequency()));
            statement.setTime(4, Time.valueOf(route.getStartTime()));
            statement.setTime(5, Time.valueOf(route.getEndTime()));
            statement.setString(6, route.getRouteNumber());
            statement.setInt(7, route.getRouteId());
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteRoute(int routeId) {
        String sql = "DELETE FROM [Routes] WHERE [RouteId] = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, routeId);
            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public int countRoutes() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Routes";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return count;
    }

    public static void main(String[] args) {
        RouteDAO rDAO = new RouteDAO();
        List<RouteInfoDTO> listR = rDAO.getRouteInfoList();
        for (RouteInfoDTO route : listR) {
            System.out.println(route);
        }
    }
}
