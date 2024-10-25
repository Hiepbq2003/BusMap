/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.RouteStop;
import java.sql.*;

/**
 *
 * @author olymp
 */
public class RouteStopDAO extends DBContext {

    public List<RouteStop> getAllRouteStop() {
        List<RouteStop> listRS = new ArrayList<>();
        try {
            String sql = "select * from Route_Stop";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RouteStop routeStop = new RouteStop();
                routeStop.setRouteId(rs.getInt("RouteId"));
                routeStop.setStopId(rs.getInt("StopId"));
                routeStop.setOrdered(rs.getInt("Ordered"));
                routeStop.setRole(rs.getString("Role"));
                routeStop.setDirection(rs.getString("Direction"));
                listRS.add(routeStop);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listRS;
    }

    public void addRouteStop(int routeId, int stopId, String direction, String role, int ordered) {
        try {
            String sql = "INSERT INTO Route_Stop (RouteId, StopId, Direction, Role, Ordered) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, routeId);
            st.setInt(2, stopId);
            st.setString(3, direction);
            st.setString(4, role);
            st.setInt(5, ordered);

            int rowsInserted = st.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new route stop was inserted successfully!");
            }
        } catch (SQLException e) {
            System.err.println("Error inserting new route stop: " + e.getMessage());
        }
    }

}
